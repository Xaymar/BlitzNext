#pragma once
#include <iostream>
#include <istream>
#include <string>
#include <vector>
#include "assem.hpp"

class Module;
struct Operand;

class Assem_x86 : public Assem {
	public:
	Assem_x86(std::istream& in, Module* mod);

	virtual void assemble();

	private:
	void align(int n);
	void emit(int n);
	void emitw(int n);
	void emitd(int n);
	void emitImm(const std::string& s, int size);
	void emitImm(const Operand& o, int size);
	void r_reloc(const std::string& dest);
	void a_reloc(const std::string& dest);
	void assemDir(const std::string& name, const std::string& op);
	void assemInst(const std::string& name, const std::string& lhs, const std::string& rhs);
	void assemLine(const std::string& line);
};
