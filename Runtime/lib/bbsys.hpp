#pragma once
#include "basic.hpp"

#include <gxruntime.hpp>

extern bool       debug;
extern gxRuntime* gx_runtime;

struct bbEx {
	const char* err;
	bbEx(const char* e) : err(e)
	{
		if (e)
			gx_runtime->debugError(e);
	}
};

#define ThrowRuntimeException(_X_) throw bbEx(_X_);
