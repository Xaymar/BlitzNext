#pragma once
#include <string>
#include <vector>
#include "node.hpp"
#include "type.hpp"

class Codegen;
class Environ;
struct Decl;
struct Label;
struct DeclNode;
struct ExprSeqNode;
struct ExprNode;

struct StmtNode : public Node {
	int pos; //offset in source stream
	StmtNode();
	void debug(int pos, Codegen* g);

	virtual void semant(Environ* e);
	virtual void translate(Codegen* g);
};

class StmtSeqNode : public Node {
	std::string            file;
	std::vector<StmtNode*> stmts;

	public:
	StmtSeqNode(const std::string& f);
	~StmtSeqNode();

	void semant(Environ* e);

	void translate(Codegen* g);

	void push_back(StmtNode* s);

	int  size();

	public:
	static void reset(const std::string& file, const std::string& lab);
};

class IncludeNode : public StmtNode {
	std::string file;	
	std::string label;
	std::shared_ptr<StmtSeqNode> stmts;

	public:
	IncludeNode(const std::string& t, std::shared_ptr<StmtSeqNode> ss);
	~IncludeNode();

	void semant(Environ* e);

	void translate(Codegen* g);
};

struct DeclStmtNode : public StmtNode {
	DeclNode* decl;
	DeclStmtNode(DeclNode* d);
	~DeclStmtNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct DimNode : public StmtNode {
	std::string  ident, tag;
	ExprSeqNode* exprs;
	ArrayType*   sem_type;
	Decl*        sem_decl;
	DimNode(const std::string& i, const std::string& t, ExprSeqNode* e);
	~DimNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct AssNode : public StmtNode {
	VarNode*  var;
	ExprNode* expr;
	AssNode(VarNode* var, ExprNode* expr);
	~AssNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct ExprStmtNode : public StmtNode {
	ExprNode* expr;
	ExprStmtNode(ExprNode* e);
	~ExprStmtNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct LabelNode : public StmtNode {
	std::string ident;
	int         data_sz;
	LabelNode(const std::string& s, int sz);
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct GotoNode : public StmtNode {
	std::string ident;
	GotoNode(const std::string& s);
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct GosubNode : public StmtNode {
	std::string ident;
	GosubNode(const std::string& s);
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct IfNode : public StmtNode {
	ExprNode*    expr;
	StmtSeqNode *stmts, *elseOpt;
	IfNode(ExprNode* e, StmtSeqNode* s, StmtSeqNode* o);
	~IfNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct ExitNode : public StmtNode {
	std::string sem_brk;
	void        semant(Environ* e);
	void        translate(Codegen* g);
};

struct WhileNode : public StmtNode {
	int          wendPos;
	ExprNode*    expr;
	StmtSeqNode* stmts;
	std::string  sem_brk;
	WhileNode(ExprNode* e, StmtSeqNode* s, int wp);
	~WhileNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct ForNode : public StmtNode {
	int          nextPos;
	VarNode*     var;
	ExprNode *   fromExpr, *toExpr, *stepExpr;
	StmtSeqNode* stmts;
	std::string  sem_brk;
	ForNode(VarNode* v, ExprNode* f, ExprNode* t, ExprNode* s, StmtSeqNode* ss, int np);
	~ForNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct ForEachNode : public StmtNode {
	int          nextPos;
	VarNode*     var;
	std::string  typeIdent;
	StmtSeqNode* stmts;
	std::string  sem_brk;
	ForEachNode(VarNode* v, const std::string& t, StmtSeqNode* s, int np);
	~ForEachNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct ReturnNode : public StmtNode {
	ExprNode*   expr;
	std::string returnLabel;
	ReturnNode(ExprNode* e);
	~ReturnNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct DeleteNode : public StmtNode {
	ExprNode* expr;
	DeleteNode(ExprNode* e);
	~DeleteNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct DeleteEachNode : public StmtNode {
	std::string typeIdent;
	DeleteEachNode(const std::string& t);
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct InsertNode : public StmtNode {
	ExprNode *expr1, *expr2;
	bool      before;
	InsertNode(ExprNode* e1, ExprNode* e2, bool b);
	~InsertNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct CaseNode : public Node {
	ExprSeqNode* exprs;
	StmtSeqNode* stmts;
	CaseNode(ExprSeqNode* e, StmtSeqNode* s);
	~CaseNode();
};

struct SelectNode : public StmtNode {
	ExprNode*              expr;
	StmtSeqNode*           defStmts;
	std::vector<CaseNode*> cases;
	VarNode*               sem_temp;
	SelectNode(ExprNode* e);
	~SelectNode();
	void push_back(CaseNode* c);
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct RepeatNode : public StmtNode {
	int          untilPos;
	StmtSeqNode* stmts;
	ExprNode*    expr;
	std::string  sem_brk;
	RepeatNode(StmtSeqNode* s, ExprNode* e, int up);
	~RepeatNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct ReadNode : public StmtNode {
	VarNode* var;
	ReadNode(VarNode* v);
	~ReadNode();
	void semant(Environ* e);
	void translate(Codegen* g);
};

struct RestoreNode : public StmtNode {
	std::string ident;
	Label*      sem_label;
	RestoreNode(const std::string& i);
	void semant(Environ* e);
	void translate(Codegen* g);
};
