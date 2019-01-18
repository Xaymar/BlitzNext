#pragma once
#include "object.hpp"

class Pivot : public Object {
	public:
	Pivot();
	Pivot(const Object& t);

	//Entity interface
	Entity* clone()
	{
		return new Pivot(*this);
	}
};
