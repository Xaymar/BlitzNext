
#ifndef PIVOT_H
#define PIVOT_H

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

#endif