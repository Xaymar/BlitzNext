#pragma once
#include <string>

struct BlitzException {
	std::string ex;  //what happened
	int    pos; //source offset
	std::string file;
	BlitzException(const std::string& ex) : ex(ex), pos(-1) {}
	BlitzException(const std::string& ex, int pos, const std::string& t) : ex(ex), pos(pos), file(t) {}
};
