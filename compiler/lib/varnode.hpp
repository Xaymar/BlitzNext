#pragma once
#include <string>
#include "node.hpp"
#include "type.hpp"

class Environ;
class Codegen;
struct TNode;
struct ExprNode;
struct ExprSeqNode;

struct VarNode : public Node {
	Type* sem_type;

	//get set var
	TNode*         load(Codegen* g);
	virtual TNode* store(Codegen* g, TNode* n);
	virtual bool   isObjParam();

	//addr of var
	virtual void   semant(Environ* e)    = 0;
	virtual TNode* translate(Codegen* g) = 0;
};

struct DeclVarNode : public VarNode {
	Decl* sem_decl;
	DeclVarNode(Decl* d = 0);
	void           semant(Environ* e);
	TNode*         translate(Codegen* g);
	virtual TNode* store(Codegen* g, TNode* n);
	bool           isObjParam();
};

struct IdentVarNode : public DeclVarNode {
	std::string ident, tag;
	IdentVarNode(const std::string& i, const std::string& t);
	void semant(Environ* e);
};

struct ArrayVarNode : public VarNode {
	std::string  ident, tag;
	ExprSeqNode* exprs;
	Decl*        sem_decl;
	ArrayVarNode(const std::string& i, const std::string& t, ExprSeqNode* e);
	~ArrayVarNode();
	void   semant(Environ* e);
	TNode* translate(Codegen* g);
};

struct FieldVarNode : public VarNode {
	ExprNode*   expr;
	std::string ident, tag;
	Decl*       sem_field;
	FieldVarNode(ExprNode* e, const std::string& i, const std::string& t);
	~FieldVarNode();
	void   semant(Environ* e);
	TNode* translate(Codegen* g);
};

struct VectorVarNode : public VarNode {
	ExprNode*    expr;
	ExprSeqNode* exprs;
	VectorType*  vec_type;
	VectorVarNode(ExprNode* e, ExprSeqNode* es);
	~VectorVarNode();
	void   semant(Environ* e);
	TNode* translate(Codegen* g);
};
