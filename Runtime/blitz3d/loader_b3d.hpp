#pragma once
#include "meshloader.hpp"
#include <string>

class Loader_B3D : public MeshLoader {
	public:
	MeshModel* load(const std::string& f, const Transform& conv, int hint);
};
