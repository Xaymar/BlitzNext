#pragma once
#include <istream>

#include <linker.hpp>

class Assem {
	public:
	std::istream& in;
	Module*  mod;
	Assem(std::istream& in, Module* mod) : in(in), mod(mod) {}
	virtual void assemble() = 0;
};
