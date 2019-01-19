#pragma once

struct Type;

struct Var {
	int   index;
	Type* type;

	Var(int i, Type* t) : index(i), type(t) {}
};
