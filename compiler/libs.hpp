#pragma once
#include <string>
#include <vector>

class Linker;
class Runtime;
class Module;
class Environ;
struct UserFunc;

extern int bcc_ver;
extern int lnk_ver;
extern int run_ver;
extern int dbg_ver;

//openLibs
extern std::string home;
extern Linker*     linkerLib;
extern Runtime*    runtimeLib;

//linkLibs
extern Module*                  runtimeModule;
extern Environ*                 runtimeEnviron;
extern std::vector<std::string> keyWords;
extern std::vector<UserFunc>    userFuncs;

const char* openLibs();

const char* linkLibs();

void closeLibs();
