/*

  The parser builds an abstact syntax tree from input tokens.

*/

#pragma once
#include <map>
#include <memory>
#include <set>
#include <string>
#include "nodes.hpp"
#include "toker.hpp"

class Parser {
	std::string                     incfile;
	std::set<std::string>           included;
	std::map<std::string, DimNode*> arrayDecls;
	std::shared_ptr<Toker>          toker;
	std::shared_ptr<Toker>          main_toker;
	std::shared_ptr<DeclSeqNode>    consts;
	std::shared_ptr<DeclSeqNode>    structs;
	std::shared_ptr<DeclSeqNode>    funcs;
	std::shared_ptr<DeclSeqNode>    datas;

	std::shared_ptr<StmtSeqNode> parseStmtSeq(int scope);
	void                         parseStmtSeq(std::shared_ptr<StmtSeqNode> stmts, int scope);

	void ex(const std::string& s);
	void exp(const std::string& s);

	std::string parseIdent();
	void        parseChar(int c);
	std::string parseTypeTag();

	std::shared_ptr<VarNode>  parseVar();
	std::shared_ptr<VarNode>  parseVar(const std::string& ident, const std::string& tag);
	std::shared_ptr<CallNode> parseCall(const std::string& ident, const std::string& tag);
	std::shared_ptr<IfNode>   parseIf();

	std::shared_ptr<DeclNode> parseVarDecl(int kind, bool constant);
	std::shared_ptr<DimNode>  parseArrayDecl();
	std::shared_ptr<DeclNode> parseFuncDecl();
	std::shared_ptr<DeclNode> parseStructDecl();

	std::shared_ptr<ExprSeqNode> parseExprSeq();

	std::shared_ptr<ExprNode> parseExpr(bool opt);
	std::shared_ptr<ExprNode> parseExpr1(bool opt);   //And, Or, Eor
	std::shared_ptr<ExprNode> parseExpr2(bool opt);   //<,=,>,<=,<>,>=
	std::shared_ptr<ExprNode> parseExpr3(bool opt);   //+,-
	std::shared_ptr<ExprNode> parseExpr4(bool opt);   //Lsr,Lsr,Asr
	std::shared_ptr<ExprNode> parseExpr5(bool opt);   //*,/,Mod
	std::shared_ptr<ExprNode> parseExpr6(bool opt);   //^
	std::shared_ptr<ExprNode> parseUniExpr(bool opt); //+,-,Not,~
	std::shared_ptr<ExprNode> parsePrimary(bool opt);

	public:
	Parser(Toker& t);
	~Parser();

	std::shared_ptr<ProgNode> parse(std::string const& main);
};
