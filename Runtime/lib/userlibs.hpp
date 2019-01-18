#pragma once
#include "basic.hpp"

void _bbLoadLibs(char* p);

const char* _bbStrToCStr(BBStr* str);
BBStr*      _bbCStrToStr(const char* str);
