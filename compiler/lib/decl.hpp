#pragma once
#include <string>
#include <vector>

enum {
	DECL_FUNC   = 1,
	DECL_ARRAY  = 2,
	DECL_STRUCT = 4, //NOT vars
	DECL_GLOBAL = 8,
	DECL_LOCAL  = 16,
	DECL_PARAM  = 32,
	DECL_FIELD  = 64 //ARE vars
};

struct Type;
struct ConstType;

struct Decl {
	std::string name;
	Type*       type; //type
	int         kind, offset;
	ConstType*  defType; //default value
	Decl(const std::string& s, Type* t, int k, ConstType* d = 0);
	~Decl();

	virtual void getName(char* buff);
};

struct DeclSeq {
	std::vector<Decl*> decls;
	DeclSeq();
	~DeclSeq();
	Decl* findDecl(const std::string& s);
	Decl* insertDecl(const std::string& s, Type* t, int kind, ConstType* d = 0);
	int   size();
};
