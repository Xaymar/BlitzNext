#pragma once
#include <amstream.h> // DirectShow multimedia stream interfaces
#include <ddstream.h> // DirectDraw multimedia stream interfaces
#include <mmstream.h> // multimedia stream interfaces

class gxGraphics;
class gxCanvas;

class gxMovie {
	public:
	gxMovie(gxGraphics* gfx, IMultiMediaStream* mm_stream);
	~gxMovie();

	private:
	bool                     playing;
	RECT                     src_rect;
	gxGraphics*              gfx;
	gxCanvas*                canvas;
	IDirectDrawSurface*      dd_surf;
	IMediaStream*            vid_stream;
	IDirectDrawMediaStream*  dd_stream;
	IDirectDrawStreamSample* dd_sample;
	IMultiMediaStream*       mm_stream;

	/***** GX INTERFACE *****/
	public:
	bool draw(gxCanvas* dest, int x, int y, int w, int h);

	inline bool isPlaying() const
	{
		return playing;
	}

	inline int getWidth() const
	{
		return src_rect.right;
	}

	inline int getHeight() const
	{
		return src_rect.bottom;
	}
};
