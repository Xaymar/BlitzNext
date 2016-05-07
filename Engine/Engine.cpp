#include "Engine.h"

Engine Engine::GetInstance() {
	return Instance;
}

Engine::Engine() {

}

Engine::~Engine() {
	// Unload all GraphicsDrivers
	for (auto iter = m_GraphicsDrivers.begin(); iter != m_GraphicsDrivers.end(); iter++) {
		UnloadGraphicsDriver(*iter);
	}
}

typedef GraphicsDriver*(__stdcall *GraphicsDriverInstance_t)();

GraphicsDriver* Engine::LoadGraphicsDriver(std::string libraryPath) {
	HINSTANCE lib = LoadLibrary(libraryPath.c_str());
	if (lib != NULL) {
		FARPROC fnGraphicsDriverInstance = GetProcAddress(lib, "GraphicsDriverInstance");
		if (fnGraphicsDriverInstance != NULL) {
			GraphicsDriver* graphicsDriver = ((GraphicsDriverInstance_t)fnGraphicsDriverInstance)();

			// Insert into list.
			m_GraphicsDrivers.emplace_back(graphicsDriver);
			m_GraphicsDrivers_MapToLibrary[graphicsDriver] = lib;

			return graphicsDriver;
		}
		FreeLibrary(lib);
	}

	// An error occured, handle it somehow here.
	MessageBox(0, "Not Yet Implemented", "Not Yet Implemented", 0);
	return nullptr;
}

void Engine::UnloadGraphicsDriver(GraphicsDriver* graphicsDriver) {

}
