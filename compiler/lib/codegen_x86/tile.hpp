#pragma once
#include <string>
#include <vector>

enum { EAX = 1, ECX, EDX, EDI, ESI, EBX };

extern std::vector<std::string> codeFrags, dataFrags;
extern std::string              funcLabel;
extern int                      frameSize, maxFrameSize;
const int                NUM_REGS = 6;
extern bool                     regUsed[];
extern const std::string        regs[];

extern void resetRegs();
extern int  allocReg(int n);
extern std::string fixEsp(int esp_off);

struct Tile {
	int want_l, want_r, hits, argFrame;

	Tile(const std::string& a, Tile* l = 0, Tile* r = 0);
	Tile(const std::string& a, const std::string& a2, Tile* l = 0, Tile* r = 0);
	~Tile();

	void label();
	int  eval(int want);

	private:
	int         need;
	Tile *      l, *r;
	std::string assem, assem2;
};
