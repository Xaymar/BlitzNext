#pragma once
#include "object.hpp"

class Mirror : public Object {
	public:
	Mirror();
	Mirror(const Mirror& t);
	~Mirror();

	//Entity interface
	Entity* clone()
	{
		return new Mirror(*this);
	}
	Mirror* getMirror()
	{
		return this;
	}
};
