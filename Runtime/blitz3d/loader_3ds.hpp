#pragma once
#include "meshloader.hpp"

class Loader_3DS : public MeshLoader {
	public:
	MeshModel* load(const std::string& f, const Transform& conv, int hint);
};
