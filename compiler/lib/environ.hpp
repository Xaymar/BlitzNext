/* An environ represent a stack frame block. */

#pragma once
#include <vector>
#include <string>
#include <list>

struct Decl;
struct DeclSeq;
struct Label;
struct Type;

class Environ {
	public:
	int      level;
	DeclSeq* decls;
	DeclSeq* funcDecls;
	DeclSeq* typeDecls;

	std::vector<Type*> types;

	std::vector<Label*> labels;
	Environ*       globals;
	Type*          returnType;
	std::string         funcLabel, breakLabel;
	std::list<Environ*> children; //for delete!

	Environ(const std::string& f, Type* r, int l, Environ* gs);
	~Environ();

	Decl*  findDecl(const std::string& s);
	Decl*  findFunc(const std::string& s);
	Type*  findType(const std::string& s);
	Label* findLabel(const std::string& s);
	Label* insertLabel(const std::string& s, int def, int src, int sz);

	std::string setBreak(const std::string& s);
};
