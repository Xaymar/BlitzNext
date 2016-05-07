#pragma once

#include <string>
#include <list>
#include <map>
#include <windows.h>

#include "GraphicsDriver.h"

class Engine {
#pragma region Singleton
private:
	const static Engine Instance;
public:
	Engine GetInstance();
#pragma endregion

public:
	Engine();
	~Engine();

	GraphicsDriver* LoadGraphicsDriver(std::string libraryPath);
	void UnloadGraphicsDriver(GraphicsDriver*);



private:
	std::list<GraphicsDriver*> m_GraphicsDrivers;
	std::map<GraphicsDriver*, HINSTANCE> m_GraphicsDrivers_MapToLibrary;
};