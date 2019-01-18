#pragma once
#include <Windows.h>
#include <mmsyscom.h>

class gxRuntime;

class gxTimer {
	public:
	gxTimer(gxRuntime* rt, int hertz);
	~gxTimer();

	static void CALLBACK timerCallback(UINT id, UINT msg, DWORD user, DWORD dw1, DWORD dw2);

	private:
	gxRuntime* runtime;
	HANDLE     event;
	MMRESULT   timerID;
	int        ticks_put, ticks_get;

	/***** GX INTERFACE *****/
	public:
	int wait();
};
