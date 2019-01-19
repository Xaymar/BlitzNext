
#pragma warning(disable : 4786)

#include "libs.hpp"

#include <fstream>
#include <iomanip>
#include <iostream>
#include <list>
#include <map>
#include <set>
#include <string>
#include <vector>

#include <assem_x86/assem_x86.hpp>
#include <bbruntime_dll.hpp>
#include <codegen_x86/codegen_x86.hpp>
#include <config.hpp>
#include <environ.hpp>
#include <ex.hpp>
#include <linker.hpp>
#include <parser.hpp>
#include <stdutil.hpp>

static void showInfo()
{
	const int major = (VERSION & 0xffff) / 100, minor = (VERSION & 0xffff) % 100;
	std::cout << "BlitzCC V" << major << "." << minor << std::endl;
	std::cout << "(C)opyright 2000-2003 Blitz Research Ltd" << std::endl;
}

static void showUsage()
{
	std::cout << "Usage: blitzcc [-h|-q|+q|-c|-d|-k|+k|-v|-o exefile] [sourcefile.bb]" << std::endl;
}

static void showHelp()
{
	showUsage();
	std::cout << "-h         : show this help" << std::endl;
	std::cout << "-q         : quiet mode" << std::endl;
	std::cout << "+q		  : very quiet mode" << std::endl;
	std::cout << "-c         : compile only" << std::endl;
	std::cout << "-d         : debug compile" << std::endl;
	std::cout << "-k         : dump keywords" << std::endl;
	std::cout << "+k         : dump keywords and syntax" << std::endl;
	std::cout << "-v		  : version info" << std::endl;
	std::cout << "-o exefile : generate executable" << std::endl;
}

static void err(const std::string& t)
{
	throw std::runtime_error(t);
}

static void usageErr()
{
	err("Usage error");
}

static std::string quickHelp(const std::string& kw)
{
	Environ* e = runtimeEnviron;
	Decl*    d = e->funcDecls->findDecl(tolower(kw));
	if (!d || d->type->funcType() == 0)
		return "No quick help available for " + kw;
	std::string t = kw;
	FuncType*   f = d->type->funcType();
	if (f->returnType == Type::float_type)
		t += '#';
	else if (f->returnType == Type::string_type)
		t += '$';

	t += " ";

	if (f->returnType != Type::void_type)
		t += "( ";

	for (int k = 0; k < f->params->size(); ++k) {
		std::string s;
		if (k)
			s += ',';
		Decl* p = f->params->decls[k];
		s += p->name;
		if (p->type == Type::float_type)
			s += '#';
		else if (p->type == Type::string_type)
			s += '$';
		else if (p->type == Type::void_type)
			s += '*';
		if (p->defType)
			s = '[' + s + ']';
		t += s;
	}

	if (f->returnType != Type::void_type) {
		t += f->params->size() ? " )" : ")";
	}
	return t;
}

static void dumpKeys(bool lang, bool mod, bool help)
{
	if (lang) {
		std::map<std::string, int>::iterator it;
		std::map<std::string, int>&          keywords = Toker::getKeywords();
		for (it = keywords.begin(); it != keywords.end(); ++it) {
			if (it->first.find(' ') != std::string::npos)
				continue;
			std::cout << it->first << std::endl;
		}
	}

	if (!mod)
		return;

	for (int k = 0; k < keyWords.size(); ++k) {
		std::string t = keyWords[k];

		if (t[0] == '_')
			continue;
		if (!isalpha(t[0]))
			t = t.substr(1);
		for (int n = 0; n < t.size(); ++n) {
			if (!isalnum(t[n]) && t[n] != '_') {
				t = t.substr(0, n);
				break;
			}
		}
		if (help)
			t = quickHelp(t);
		std::cout << t << std::endl;
	}
}

static std::string verstr(int ver)
{
	return itoa((ver & 65535) / 100) + "." + itoa((ver & 65535) % 100);
}

static void versInfo()
{
	std::cout << "Compiler version:" << verstr(bcc_ver) << std::endl;
	std::cout << "Runtime version:" << verstr(run_ver) << std::endl;
	std::cout << "Debugger version:" << verstr(dbg_ver) << std::endl;
	std::cout << "Linker version:" << verstr(lnk_ver) << std::endl;
}

int main(int argc, char* argv[])
{
	std::shared_ptr<Module>   module;
	std::shared_ptr<Environ>  v_environ;
	std::shared_ptr<ProgNode> prog;

	try {
		std::string in_file, out_file, args;

		bool debug = false, quiet = false, veryquiet = false, compileonly = false;
		bool dumpkeys = false, dumphelp = false, showhelp = false, dumpasm = false;
		bool versinfo = false;

		for (int k = 1; k < argc; ++k) {
			std::string t = argv[k];
			t             = tolower(t);

			if (t == "-h") {
				showhelp = true;
			} else if (t == "-a") {
				dumpasm = true;
			} else if (t == "-q") {
				quiet = true;
			} else if (t == "+q") {
				quiet = veryquiet = true;
			} else if (t == "-c") {
				compileonly = true;
			} else if (t == "-d") {
				debug = true;
			} else if (t == "-k") {
				dumpkeys = true;
			} else if (t == "+k") {
				dumpkeys = dumphelp = true;
			} else if (t == "-v") {
				versinfo = true;
			} else if (t == "-o") {
				if (out_file.size() || k == argc - 1)
					usageErr();

				out_file = argv[++k];
			} else {
				if (in_file.size() || t[0] == '-' || t[0] == '+')
					usageErr();

				in_file = argv[k];
				for (++k; k < argc; ++k) {
					std::string t = argv[k];
					if (t.find(' ') != std::string::npos)
						t = '\"' + t + '\"';
					if (args.size())
						args += ' ';
					args += t;
				}
			}
		}

		if (out_file.size() && !in_file.size())
			usageErr();

		if (const char* er = openLibs())
			err(er);

		if (const char* er = linkLibs())
			err(er);

		if (showhelp)
			showHelp();
		if (dumpkeys)
			dumpKeys(true, true, dumphelp);
		if (versinfo)
			versInfo();

		if (!in_file.size()) {
			return 0;
		}

		if (in_file[0] == '\"') {
			if ((in_file.size() < 3) || (in_file[in_file.size() - 1] != '\"')) {
				usageErr();
			}
			in_file = in_file.substr(1, in_file.size() - 2);
		}

		std::ifstream in(in_file.c_str());
		if (!in)
			err("Unable to open input file");
		if (!quiet) {
			showInfo();
			std::cout << "Compiling \"" << in_file << "\"" << std::endl;
		}

		int n = in_file.rfind('/');
		if (n == std::string::npos)
			n = in_file.rfind('\\');
		if (n != std::string::npos) {
			if (!n || in_file[n - 1] == ':')
				++n;
			SetCurrentDirectory(in_file.substr(0, n).c_str());
		}

		try {
			//parse
			if (!veryquiet)
				std::cout << "Parsing..." << std::endl;
			Toker  toker(in);
			Parser parser(toker);
			prog = parser.parse(in_file);

			//semant
			if (!veryquiet)
				std::cout << "Generating..." << std::endl;
			v_environ = prog->semant(runtimeEnviron);

			//translate
			if (!veryquiet)
				std::cout << "Translating..." << std::endl;
			qstreambuf    qbuf;
			std::iostream asmcode(&qbuf);
			Codegen_x86   codegen(asmcode, debug);

			prog->translate(&codegen, userFuncs);

			if (dumpasm) {
				std::cout << std::endl << std::string(qbuf.data(), qbuf.size()) << std::endl;
			}

			//assemble
			if (!veryquiet)
				std::cout << "Assembling..." << std::endl;
			module = linkerLib->createModule();
			Assem_x86 assem(asmcode, module);
			assem.assemble();

		} catch (Ex& x) {
			std::string file = '\"' + x.file + '\"';
			int         row = ((x.pos >> 16) & 65535) + 1, col = (x.pos & 65535) + 1;
			std::cout << file << ":" << row << ":" << col << ":" << row << ":" << col << ":" << x.ex << std::endl;
			throw std::runtime_error(file);
		}

		delete prog;

		if (out_file.size()) {
			if (!veryquiet)
				std::cout << "Creating executable \"" << out_file << "\"..." << std::endl;
			if (!module->createExe(out_file.c_str(), (home + "/bin/runtime.dll").c_str())) {
				err("Error creating executable");
			}
		} else if (!compileonly) {
			void* entry = module->link(runtimeModule);
			if (!entry)
				return 0;

			HMODULE dbgHandle = 0;
			/*std::shared_ptr<Debugger> debugger;

			if (debug) {
				dbgHandle = LoadLibrary((home + "\\debugger.dll").c_str());
				if (dbgHandle) {
					typedef Debugger*(_cdecl * GetDebugger)(Module*, Environ*);
					GetDebugger gd = (GetDebugger)GetProcAddress(dbgHandle, "debuggerGetDebugger");
					if (gd)
						debugger = gd(module, v_environ);
				}
				if (!debugger)
					err("Error launching debugger");
			}*/

			if (!veryquiet)
				std::cout << "Executing..." << std::endl;

			runtimeLib->execute((void (*)())entry, args.c_str(), nullptr);

			if (dbgHandle)
				FreeLibrary(dbgHandle);
		}

		delete module;
		delete v_environ;

		closeLibs();
	} catch (std::exception& e) {
		std::cout << "Unexpected exception: " << e.what() << std::endl;

	} catch (...) {
		std::cout << "Unexpected error." << std::endl;
	}
	std::cin.get();
	return 0;
}