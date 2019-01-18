#include "listener.hpp"

#include <gxaudio.hpp>

extern gxAudio* gx_audio;

Listener::Listener(float roll, float dopp, float dist)
{
	if (!gx_audio)
		return;

	gx_audio->set3dOptions(roll, dopp, dist);
	renderListener();
}

Listener::Listener(const Listener& t) : Object(t) {}

Listener::~Listener()
{
	if (!gx_audio)
		return;

	Vector pos, vel, up(0, 1, 1), forward(0, 0, 1);
	gx_audio->set3dListener(&pos.x, &vel.x, &forward.x, &up.x);
}

void Listener::renderListener()
{
	if (!gx_audio)
		return;

	const Vector& pos     = GetWorldTransform().v;
	const Vector& vel     = getVelocity();
	const Vector& forward = GetWorldTransform().m.k.normalized();
	const Vector& up      = GetWorldTransform().m.j.normalized();

	gx_audio->set3dListener(&pos.x, &vel.x, &forward.x, &up.x);
}
