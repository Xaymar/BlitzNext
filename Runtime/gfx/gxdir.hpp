#pragma once
#include <string>
#include <Windows.h>

class gxDir {
	public:
	gxDir(HANDLE h, const WIN32_FIND_DATA& f);
	~gxDir();

	private:
	HANDLE          handle;
	WIN32_FIND_DATA findData;

	/***** GX INTERFACE *****/
	public:
	std::string getNextFile();
};
