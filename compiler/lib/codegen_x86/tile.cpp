#include "tile.hpp"
#include <string>
#include <vector>
#include "codegen_x86.hpp"

#include <stdutil.hpp>

//reduce to 3 for stress test

const std::string regs[] = {"???", "eax", "ecx", "edx", "edi", "esi", "ebx"};

//array of 'used' flags
bool regUsed[NUM_REGS + 1];

//size of locals in function
int frameSize, maxFrameSize;

//code fragments
std::vector<std::string> codeFrags, dataFrags;

//name of function
std::string funcLabel;

void resetRegs()
{
	for (int n = 1; n <= NUM_REGS; ++n)
		regUsed[n] = false;
}

int allocReg(int n)
{
	if (!n || regUsed[n]) {
		for (n = NUM_REGS; n >= 1 && regUsed[n]; --n) {
		}
		if (!n)
			return 0;
	}
	regUsed[n] = true;
	return n;
}

static void freeReg(int n)
{
	regUsed[n] = false;
}

static void pushReg(int n)
{
	frameSize += 4;
	if (frameSize > maxFrameSize)
		maxFrameSize = frameSize;
	char buff[32];
	_itoa(frameSize, buff, 10);
	std::string s = "\tmov\t[ebp-";
	s += buff;
	s += "],";
	s += regs[n];
	s += '\n';
	codeFrags.push_back(s);
}

static void popReg(int n)
{
	char buff[32];
	_itoa(frameSize, buff, 10);
	std::string s = "\tmov\t";
	s += regs[n];
	s += ",[ebp-";
	s += buff;
	s += "]\n";
	codeFrags.push_back(s);
	frameSize -= 4;
}

static void moveReg(int d, int s)
{
	std::string t = "\tmov\t" + regs[d] + ',' + regs[s] + '\n';
	codeFrags.push_back(t);
}

static void swapRegs(int d, int s)
{
	std::string t = "\txchg\t" + regs[d] + ',' + regs[s] + '\n';
	codeFrags.push_back(t);
}

Tile::Tile(const std::string& a, Tile* l, Tile* r)
	: assem(a), l(l), r(r), want_l(0), want_r(0), hits(0), need(0), argFrame(0)
{}

Tile::Tile(const std::string& a, const std::string& a2, Tile* l, Tile* r)
	: assem(a), assem2(a2), l(l), r(r), want_l(0), want_r(0), hits(0), need(0), argFrame(0)
{}

Tile::~Tile()
{
	delete l;
	delete r;
}

void Tile::label()
{
	if (!l) {
		need = 1;
	} else if (!r) {
		l->label();
		need = l->need;
	} else {
		l->label();
		r->label();
		if (l->need == r->need)
			need = l->need + 1;
		else if (l->need > r->need)
			need = l->need;
		else
			need = r->need;
	}
}

int Tile::eval(int want)
{
	//save any hit registers
	int spill = hits;
	if (want_l)
		spill |= 1 << want_l;
	if (want_r)
		spill |= 1 << want_r;
	if (spill) {
		for (int n = 1; n <= NUM_REGS; ++n) {
			if (spill & (1 << n)) {
				if (regUsed[n])
					pushReg(n);
				else
					spill &= ~(1 << n);
			}
		}
	}

	//if tile needs an argFrame...
	if (argFrame) {
		codeFrags.push_back("-" + itoa(argFrame));
	}

	int got_l = 0, got_r = 0;
	if (want_l)
		want = want_l;

	std::string* as = &assem;

	if (!l) {
		got_l = allocReg(want);
	} else if (!r) {
		got_l = l->eval(want);
	} else {
		if (l->need >= NUM_REGS && r->need >= NUM_REGS) {
			got_r = r->eval(0);
			pushReg(got_r);
			freeReg(got_r);
			got_l = l->eval(want);
			got_r = allocReg(want_r);
			popReg(got_r);
		} else if (r->need > l->need) {
			got_r = r->eval(want_r);
			got_l = l->eval(want);
		} else {
			got_l = l->eval(want);
			got_r = r->eval(want_r);
			if (assem2.size())
				as = &assem2;
		}
		if (want_l == got_r || want_r == got_l) {
			swapRegs(got_l, got_r);
			int t = got_l;
			got_l = got_r;
			got_r = t;
		}
	}

	if (!want_l)
		want_l = got_l;
	else if (want_l != got_l)
		moveReg(want_l, got_l);

	if (!want_r)
		want_r = got_r;
	else if (want_r != got_r)
		moveReg(want_r, got_r);

	int i;
	while ((i = as->find("%l")) != std::string::npos)
		as->replace(i, 2, regs[want_l]);
	while ((i = as->find("%r")) != std::string::npos)
		as->replace(i, 2, regs[want_r]);

	codeFrags.push_back(*as);

	freeReg(got_r);
	if (want_l != got_l)
		moveReg(got_l, want_l);

	//cleanup argFrame
	if (argFrame) {
		//***** Not needed for STDCALL *****
		//		codeFrags.push_back( "+"+itoa(argFrame) );
	}

	//restore spilled regs
	if (spill) {
		for (int n = NUM_REGS; n >= 1; --n) {
			if (spill & (1 << n))
				popReg(n);
		}
	}
	return got_l;
}

std::string fixEsp(int esp_off)
{
	if (esp_off < 0)
		return "\tsub\tesp," + itoa(-esp_off) + "\n";
	return "\tadd\tesp," + itoa(esp_off) + "\n";
}
