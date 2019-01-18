#pragma once
#include <vector>
#include "animation.hpp"

class Object;

class Animator {
	public:
	enum { ANIM_MODE_LOOP = 1, ANIM_MODE_PINGPONG = 2, ANIM_MODE_ONESHOT = 3 };

	Animator(Animator* animator);

	Animator(Object* tree, int frames);

	Animator(const std::vector<Object*>& objs, int frames);

	void addSeq(int frames);

	void addSeqs(Animator* t);

	void extractSeq(int first, int last, int seq);

	void setAnimTime(float time, int seq);

	void animate(int mode, float speed, int seq, float trans);

	void update(float elapsed);

	inline int animSeq() const
	{
		return _seq;
	}
	inline int animLen() const
	{
		return _seq_len;
	}
	inline float animTime() const
	{
		return _time;
	}
	inline bool animating() const
	{
		return !!_mode;
	}

	inline int numSeqs() const
	{
		return _seqs.size();
	}
	inline const std::vector<Object*>& getObjects() const
	{
		return _objs;
	}

	private:
	struct Seq {
		int frames;
	};

	struct Anim {
		//anim keys
		std::vector<Animation> keys;
		//for transitions...
		bool   pos, scl, rot;
		Vector src_pos, dest_pos;
		Vector src_scl, dest_scl;
		Quat   src_rot, dest_rot;
		Anim() : pos(false), scl(false), rot(false) {}
	};

	std::vector<Seq> _seqs;

	std::vector<Anim> _anims;
	std::vector<Object*> _objs;

	int   _seq, _mode, _seq_len;
	float _time, _speed, _trans_time, _trans_speed;

	void reset();
	void addObjs(Object* obj);
	void updateAnim();
	void beginTrans();
	void updateTrans();
};
