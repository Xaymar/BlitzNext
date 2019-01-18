
#ifndef CACHEDTEXTURE_H
#define CACHEDTEXTURE_H

#include "../gxruntime/gxcanvas.hpp"

class CachedTextureFactory{
public:
	CachedTextureFactory( int w,int h,int flags,int cnt );
	CachedTextureFactory( const string &f,int flags,int w,int h,int first,int cnt );
	CachedTextureFactory( const CachedTextureFactory &t );
	~CachedTextureFactory();

	CachedTextureFactory &operator=( const CachedTextureFactory &t );

	string getName()const;

	const vector<gxCanvas*> &getFrames()const;

	bool operator<( const CachedTextureFactory &t )const{ return rep<t.rep; }

	static void setPath( const string &t );

private:
	struct CachedTexture;
	CachedTexture *rep;

	CachedTexture *findRep( const string &f,int flags,int w,int h,int first,int cnt );

	static set<CachedTexture*> rep_set;
};

#endif
