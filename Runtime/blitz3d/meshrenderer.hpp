
#ifndef MESHRENDERER_H
#define MESHRENDERER_H

#include "mesh.hpp"
#include "model.hpp"

class MeshRenderer {
	public:
	MeshRenderer(const Mesh& t);
	~MeshRenderer();

	void render(Camera* c, Model* m) const;

	private:
	Box box;
	struct Surface;
	vector<Surface*> surfs;

	MeshRenderer(const MeshRenderer& t);
	MeshRenderer& operator=(const MeshRenderer&);
};

#endif