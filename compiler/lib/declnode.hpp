#pragma once
#include <string>
#include <vector>
#include "node.hpp"
#include "type.hpp"

class Codegen;
class Environ;
struct StmtSeqNode;
struct DeclVarNode;
struct ExprNode;
struct ExprSeqNode;

struct DeclNode : public Node {
	int         pos;
	std::string file;
	DeclNode();
	virtual void proto(DeclSeq* d, Environ* e);
	virtual void semant(Environ* e);
	virtual void translate(Codegen* g);
	virtual void transdata(Codegen* g);
};

struct DeclSeqNode : public Node {
	std::vector<DeclNode*> decls;
	DeclSeqNode();
	~DeclSeqNode();
	void proto(DeclSeq* d, Environ* e);
	void semant(Environ* e);
	void translate(Codegen* g);
	void transdata(Codegen* g);
	void push_back(DeclNode* d);
	int  size();
};

//'kind' shouldn't really be in Parser...
//should probably be LocalDeclNode,GlobalDeclNode,ParamDeclNode
struct VarDeclNode : public DeclNode {
	std::string  ident, tag;
	int          kind;
	bool         constant;
	ExprNode*    expr;
	DeclVarNode* sem_var;
	VarDeclNode(const std::string& i, const std::string& t, int k, bool c, ExprNode* e);
	~VarDeclNode();
	void proto(DeclSeq* d, Environ* e);
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct FuncDeclNode : public DeclNode {
	std::string  ident, tag;
	DeclSeqNode* params;
	StmtSeqNode* stmts;
	FuncType*    sem_type;
	Environ*     sem_env;
	FuncDeclNode(const std::string& i, const std::string& t, DeclSeqNode* p, StmtSeqNode* ss);
	~FuncDeclNode();
	void proto(DeclSeq* d, Environ* e);
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct StructDeclNode : public DeclNode {
	std::string  ident;
	DeclSeqNode* fields;
	StructType*  sem_type;
	StructDeclNode(const std::string& i, DeclSeqNode* f);
	~StructDeclNode();
	void proto(DeclSeq* d, Environ* e);
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct DataDeclNode : public DeclNode {
	ExprNode*   expr;
	std::string str_label;
	DataDeclNode(ExprNode* e);
	~DataDeclNode();
	void proto(DeclSeq* d, Environ* e);
	void semant(Environ* e);
	void translate(Codegen* g);
	void transdata(Codegen* g);
};

struct VectorDeclNode : public DeclNode {
	std::string  ident, tag;
	ExprSeqNode* exprs;
	int          kind;
	VectorType*  sem_type;
	VectorDeclNode(const std::string& i, const std::string& t, ExprSeqNode* e, int k);
	~VectorDeclNode();
	void proto(DeclSeq* d, Environ* e);
	void translate(Codegen* g);
};
