#pragma once
#include "graphicsruntime.hpp"

class gxScene;

enum { LIGHT_DISTANT = 1, LIGHT_POINT = 2, LIGHT_SPOT = 3 };

class gxLight {
	public:
	gxLight(gxScene* scene, int type);
	~gxLight();

	D3DLIGHT7 d3d_light;

	private:
	gxScene* scene;

	/***** GX INTERFACE *****/
	public:
	void setRange(float range);

	inline void setColor(const float rgb[3])
	{
		memcpy(&d3d_light.dcvDiffuse, rgb, 12);
	}

	void setPosition(const float pos[3]);

	void setDirection(const float dir[3]);

	void setConeAngles(float inner, float outer);

	inline void getColor(float rgb[3])
	{
		memcpy(rgb, &d3d_light.dcvDiffuse, 12);
	}
};
