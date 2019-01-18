
#ifndef LIGHT_H
#define LIGHT_H

#include "geom.hpp"
#include "gxlight.hpp"
#include "object.hpp"

class World;

class Light : public Object {
	public:
	Light(int type);
	~Light();

	Light* getLight()
	{
		return this;
	}

	void setRange(float r);
	void setColor(const Vector& v);
	void setConeAngles(float inner, float outer);

	bool beginRender(float tween);

	gxLight* getGxLight() const
	{
		return light;
	}

	private:
	friend class World;
	gxLight* light;
};

#endif