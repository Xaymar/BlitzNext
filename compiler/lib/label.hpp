#pragma once
#include <string>

struct Label {
	std::string name;     //name of label
	int    def, ref; //pos of defn and goto/restore src
	int    data_sz;  //size of data at this label.

	Label(const std::string& n, int d, int r, int sz) : name(n), def(d), ref(r), data_sz(sz) {}
};
