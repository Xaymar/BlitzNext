#pragma once
#include <iostream>
#include <string>

struct Operand {
	int         mode;
	int         reg, imm, offset;
	std::string immLabel, baseLabel;
	int         baseReg, indexReg, shift;

	Operand();
	Operand(const std::string& s);

	void parse();

	private:
	std::string s;
	bool        parseSize(int* sz);
	bool        parseChar(char c);
	bool        parseReg(int* reg);
	bool        parseFPReg(int* reg);
	bool        parseLabel(std::string* t);
	bool        parseConst(int* iconst);
};
