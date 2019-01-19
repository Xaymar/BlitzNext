#pragma once
#include <list>
#include <string>
#include <vector>
#include "node.hpp"
#include "type.hpp"

class Codegen;
class Environ;
struct DeclSeq;
struct Decl;
struct ConstNode; //is constant int,float or string
struct VarNode;

class ExprNode : public Node {
	std::shared_ptr<Type> sem_type;


	public:
	ExprNode();
	ExprNode(std::shared_ptr<Type> t);

	ExprNode* castTo(Type* ty, Environ* e);
	ExprNode* semant(Environ* e, Type* ty);

	virtual ExprNode*  semant(Environ* e)    = 0;
	virtual TNode*     translate(Codegen* g) = 0;
	virtual ConstNode* constNode()
	{
		return 0;
	}
};

class ExprSeqNode : public Node {
	std::list<std::shared_ptr<ExprNode>> exprs;

	public:
	~ExprSeqNode();

	void push_back(std::shared_ptr<ExprNode> e);

	int size();

	void semant(Environ* e);

	TNode* translate(Codegen* g, bool userlib);

	void castTo(DeclSeq* ds, Environ* e, bool userlib);

	void castTo(Type* t, Environ* e);
};

struct CastNode : public ExprNode {
	ExprNode* expr;
	Type*     type;
	CastNode(ExprNode* ex, Type* ty);
	~CastNode();
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

struct CallNode : public ExprNode {
	std::string  ident, tag;
	ExprSeqNode* exprs;
	Decl*        sem_decl;
	CallNode(const std::string& i, const std::string& t, ExprSeqNode* e);
	~CallNode();
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

struct VarExprNode : public ExprNode {
	VarNode* var;
	VarExprNode(VarNode* v);
	~VarExprNode();
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

struct ConstNode : public ExprNode {
	ExprNode*           semant(Environ* e);
	ConstNode*          constNode();
	virtual int         intValue()    = 0;
	virtual float       floatValue()  = 0;
	virtual std::string stringValue() = 0;
};

struct IntConstNode : public ConstNode {
	int value;
	IntConstNode(int n);
	TNode*      translate(Codegen* g);
	int         intValue();
	float       floatValue();
	std::string stringValue();
};

struct FloatConstNode : public ConstNode {
	float value;
	FloatConstNode(float f);
	TNode*      translate(Codegen* g);
	int         intValue();
	float       floatValue();
	std::string stringValue();
};

struct StringConstNode : public ConstNode {
	std::string value;
	StringConstNode(const std::string& s);
	TNode*      translate(Codegen* g);
	int         intValue();
	float       floatValue();
	std::string stringValue();
};

struct UniExprNode : public ExprNode {
	int       op;
	ExprNode* expr;
	UniExprNode(int op, ExprNode* expr);
	~UniExprNode();
	ExprNode* constize();
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

// and, or, eor, lsl, lsr, asr
struct BinExprNode : public ExprNode {
	int       op;
	ExprNode *lhs, *rhs;
	BinExprNode(int op, ExprNode* lhs, ExprNode* rhs);
	~BinExprNode();
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

// *,/,Mod,+,-
struct ArithExprNode : public ExprNode {
	int       op;
	ExprNode *lhs, *rhs;
	ArithExprNode(int op, ExprNode* lhs, ExprNode* rhs);
	~ArithExprNode();
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

//<,=,>,<=,<>,>=
struct RelExprNode : public ExprNode {
	int       op;
	ExprNode *lhs, *rhs;
	Type*     opType;
	RelExprNode(int op, ExprNode* lhs, ExprNode* rhs);
	~RelExprNode();
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

struct NewNode : public ExprNode {
	std::string ident;
	NewNode(const std::string& i);
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

struct FirstNode : public ExprNode {
	std::string ident;
	FirstNode(const std::string& i);
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

struct LastNode : public ExprNode {
	std::string ident;
	LastNode(const std::string& i);
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

struct AfterNode : public ExprNode {
	ExprNode* expr;
	AfterNode(ExprNode* e);
	~AfterNode();
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

struct BeforeNode : public ExprNode {
	ExprNode* expr;
	BeforeNode(ExprNode* e);
	~BeforeNode();
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

struct NullNode : public ExprNode {
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

struct ObjectCastNode : public ExprNode {
	ExprNode*   expr;
	std::string type_ident;
	ObjectCastNode(ExprNode* e, const std::string& t);
	~ObjectCastNode();
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};

struct ObjectHandleNode : public ExprNode {
	ExprNode* expr;
	ObjectHandleNode(ExprNode* e);
	~ObjectHandleNode();
	ExprNode* semant(Environ* e);
	TNode*    translate(Codegen* g);
};
