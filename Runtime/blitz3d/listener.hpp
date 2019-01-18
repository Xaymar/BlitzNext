#pragma once
#include "object.hpp"

class Listener : public Object {
	public:
	Listener(float roll, float dopp, float dist);
	Listener(const Listener& t);
	~Listener();

	//Entity interface
	Entity* clone()
	{
		return new Listener(*this);
	}
	Listener* getListener()
	{
		return this;
	}

	//Listener interface
	void renderListener();

	private:
};
