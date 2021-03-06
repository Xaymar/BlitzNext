#include "libs.hpp"
#include <istream>
#include <set>
#include <fstream>

#include <environ.hpp>
#include <linker.hpp>
#include <type.hpp>
#include <config.hpp>
#include <bbruntime_dll.hpp>
#include <prognode.hpp>

#include <windows.h>

int bcc_ver;
int lnk_ver;
int run_ver;
int dbg_ver;

std::string   home;
Linker*  linkerLib;
Runtime* runtimeLib;

Module*          runtimeModule;
Environ*         runtimeEnviron;
std::vector<std::string> keyWords;
std::vector<UserFunc>    userFuncs;

static HMODULE linkerHMOD, runtimeHMOD;

static Type* bbtypeof(int c)
{
	switch (c) {
	case '%':
		return Type::int_type;
	case '#':
		return Type::float_type;
	case '$':
		return Type::string_type;
	}
	return Type::void_type;
}

static int    curr;
static std::string text;

static int bbnext(std::istream& in)
{
	text = "";

	int t = 0;

	for (;;) {
		while (isspace(in.peek()))
			in.get();
		if (in.eof())
			return curr = 0;
		t = in.get();
		if (t != ';')
			break;
		while (!in.eof() && in.get() != '\n') {
		}
	}

	if (isalpha(t)) {
		text += (char)t;
		while (isalnum(in.peek()) || in.peek() == '_')
			text += (char)in.get();
		return curr = -1;
	}
	if (t == '\"') {
		while (in.peek() != '\"')
			text = text + (char)in.get();
		in.get();
		return curr = -2;
	}

	return curr = t;
}

static const char* linkRuntime()
{
	while (const char* sym = runtimeLib->nextSym()) {
		std::string s(sym);

		int pc = runtimeLib->symValue(sym);

		//internal?
		if (s[0] == '_') {
			runtimeModule->addSymbol(("_" + s).c_str(), pc);
			continue;
		}

		bool cfunc = false;

		if (s[0] == '!') {
			cfunc = true;
			s     = s.substr(1);
		}

		keyWords.push_back(s);

		//global!
		size_t start = 0, end, k;
		Type*  t     = Type::void_type;
		if (!isalpha(s[0])) {
			start = 1;
			t     = bbtypeof(s[0]);
		}
		for (k = 1; k < s.size(); ++k, end = k) {
			if (!isalnum(s[k]) && s[k] != '_')
				break;
		}
		DeclSeq* params = new DeclSeq();
		std::string n      = s.substr(start, end - start);
		while (k < s.size()) {
			Type* t    = bbtypeof(s[k++]);
			int   from = k;
			for (; isalnum(s[k]) || s[k] == '_'; ++k) {
			}
			std::string str     = s.substr(from, k - from);
			ConstType* defType = 0;
			if (s[k] == '=') {
				int from = ++k;
				if (s[k] == '\"') {
					for (++k; s[k] != '\"'; ++k) {
					}
					std::string t = s.substr(from + 1, k - from - 1);
					defType  = new ConstType(t);
					++k;
				} else {
					if (s[k] == '-')
						++k;
					for (; isdigit(s[k]); ++k) {
					}
					if (t == Type::int_type) {
						int n   = atoi(s.substr(from, k - from));
						defType = new ConstType(n);
					} else {
						float n = (float)atof(s.substr(from, k - from));
						defType = new ConstType(n);
					}
				}
			}
			Decl* d = params->insertDecl(str, t, DECL_PARAM, defType);
		}

		FuncType* f = new FuncType(t, params, false, cfunc);
		n           = tolower(n);
		runtimeEnviron->funcDecls->insertDecl(n, f, DECL_FUNC);
		runtimeModule->addSymbol(("_f" + n).c_str(), pc);
	}
	return 0;
}

static std::set<std::string> _ulibkws;

static const char* loadUserLib(const std::string& userlib)
{
	std::string t = home + "/userlibs/" + userlib;

	std::string lib = "";
	std::ifstream in(t.c_str());

	bbnext(in);
	while (curr) {
		if (curr == '.') {
			if (bbnext(in) != -1)
				return "expecting identifier after '.'";

			if (text == "lib") {
				if (bbnext(in) != -2)
					return "expecting string after lib directive";
				lib = text;

			} else {
				return "unknown decl directive";
			}
			bbnext(in);

		} else if (curr == -1) {
			if (!lib.size())
				return "function decl without lib directive";

			std::string id       = text;
			std::string lower_id = tolower(id);

			if (_ulibkws.count(lower_id))
				return "duplicate identifier";
			_ulibkws.insert(lower_id);

			Type* ty = 0;
			switch (bbnext(in)) {
			case '%':
				ty = Type::int_type;
				break;
			case '#':
				ty = Type::float_type;
				break;
			case '$':
				ty = Type::string_type;
				break;
			}
			if (ty)
				bbnext(in);
			else
				ty = Type::void_type;

			DeclSeq* params = new DeclSeq();

			if (curr != '(')
				return "expecting '(' after function identifier";
			bbnext(in);
			if (curr != ')') {
				for (;;) {
					if (curr != -1)
						break;
					std::string arg = text;

					Type* ty = 0;
					switch (bbnext(in)) {
					case '%':
						ty = Type::int_type;
						break;
					case '#':
						ty = Type::float_type;
						break;
					case '$':
						ty = Type::string_type;
						break;
					case '*':
						ty = Type::null_type;
						break;
					}
					if (ty)
						bbnext(in);
					else
						ty = Type::int_type;

					ConstType* defType = 0;

					Decl* d = params->insertDecl(arg, ty, DECL_PARAM, defType);

					if (curr != ',')
						break;
					bbnext(in);
				}
			}
			if (curr != ')')
				return "expecting ')' after function decl";

			keyWords.push_back(id);

			FuncType* fn = new FuncType(ty, params, true, true);

			runtimeEnviron->funcDecls->insertDecl(lower_id, fn, DECL_FUNC);

			if (bbnext(in) == ':') { //real name?
				bbnext(in);
				if (curr != -1 && curr != -2)
					return "expecting identifier or string after alias";
				id = text;
				bbnext(in);
			}

			userFuncs.push_back(UserFunc(lower_id, id, lib));
		}
	}
	return 0;
}

static const char* linkUserLibs()
{
	_ulibkws.clear();

	WIN32_FIND_DATA fd;

	HANDLE h = FindFirstFile((home + "/userlibs/*.decls").c_str(), &fd);

	if (h == INVALID_HANDLE_VALUE)
		return 0;

	const char* err = 0;

	do {
		if (err = loadUserLib(fd.cFileName)) {
			static char buf[64];
			sprintf(buf, "Error in userlib '%s' - %s", fd.cFileName, err);
			err = buf;
			break;
		}

	} while (FindNextFile(h, &fd));

	FindClose(h);

	_ulibkws.clear();

	return err;
}

const char* openLibs()
{
	/*char *p = getenv("blitzpath");
	if (!p) return "Can't find blitzpath environment variable";
	*/
	char* buf = new char[MAX_PATH];
	GetModuleFileName(NULL, buf, MAX_PATH);
	home = std::string(buf);
	delete buf;

	std::string::size_type pos = home.find_last_of("\\/");
	home                  = home.substr(0, pos);

	linkerHMOD = LoadLibrary((home + "\\linker.dll").c_str());
	if (!linkerHMOD)
		return "Unable to open linker.dll";

	typedef Linker*(_cdecl * GetLinker)();
	GetLinker gl = (GetLinker)GetProcAddress(linkerHMOD, "linkerGetLinker");
	if (!gl)
		return "Error in linker.dll";
	linkerLib = gl();

	runtimeHMOD = LoadLibrary((home + "\\runtime.dll").c_str());
	if (!runtimeHMOD)
		return "Unable to open runtime.dll";

	typedef Runtime*(_cdecl * GetRuntime)();
	GetRuntime gr = (GetRuntime)GetProcAddress(runtimeHMOD, "runtimeGetRuntime");
	if (!gr)
		return "Error in runtime.dll";
	runtimeLib = gr();

	bcc_ver = VERSION;
	lnk_ver = linkerLib->version();
	run_ver = runtimeLib->version();

	if ((lnk_ver >> 16) != (bcc_ver >> 16) || (run_ver >> 16) != (bcc_ver >> 16) || (lnk_ver >> 16) != (bcc_ver >> 16))
		return "Library version error";

	runtimeLib->startup(GetModuleHandle(0));

	runtimeModule  = linkerLib->createModule();
	runtimeEnviron = new Environ("", Type::int_type, 0, 0);

	keyWords.clear();
	userFuncs.clear();

	return 0;
}

const char* linkLibs()
{
	if (const char* p = linkRuntime())
		return p;

	if (const char* p = linkUserLibs())
		return p;

	return 0;
}

void closeLibs()
{
	delete runtimeEnviron;
	if (linkerLib)
		linkerLib->deleteModule(runtimeModule);
	if (runtimeLib)
		runtimeLib->shutdown();
	if (runtimeHMOD)
		FreeLibrary(runtimeHMOD);
	if (linkerHMOD)
		FreeLibrary(linkerHMOD);

	runtimeEnviron = 0;
	linkerLib      = 0;
	runtimeLib     = 0;
	runtimeHMOD    = 0;
	linkerHMOD     = 0;
}
