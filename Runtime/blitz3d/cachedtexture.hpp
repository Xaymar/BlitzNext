#pragma once
#include <set>
#include <string>
#include <vector>

class gxCanvas;

class CachedTexture {
	public:
	CachedTexture(int w, int h, int flags, int cnt);
	CachedTexture(const std::string& f, int flags, int w, int h, int first, int cnt);
	CachedTexture(const CachedTexture& t);
	~CachedTexture();

	CachedTexture& operator=(const CachedTexture& t);

	std::string getName() const;

	const std::vector<gxCanvas*>& getFrames() const;

	bool operator<(const CachedTexture& t) const
	{
		return rep < t.rep;
	}

	static void setPath(const std::string& t);

	private:
	struct CTInstance;
	CTInstance* rep;

	CTInstance* findRep(const std::string& f, int flags, int w, int h, int first, int cnt);

	static std::set<CTInstance*> rep_set;
};
