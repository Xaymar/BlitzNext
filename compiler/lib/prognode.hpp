#pragma once
#include <string>
#include <vector>
#include "node.hpp"

class Codegen;
class Environ;
struct DeclSeqNode;
struct StmtSeqNode;

struct UserFunc {
	std::string ident, proc, lib;
	UserFunc(const UserFunc& t);
	UserFunc(const std::string& id, const std::string& pr, const std::string& lb);
};

class ProgNode : public Node {
	std::shared_ptr<DeclSeqNode> consts;
	std::shared_ptr<DeclSeqNode> structs;
	std::shared_ptr<DeclSeqNode> funcs;
	std::shared_ptr<DeclSeqNode> datas;
	std::shared_ptr<StmtSeqNode> stmts;
	std::shared_ptr<Environ>     sem_env;

	std::string file_lab;

	public:
	ProgNode(std::shared_ptr<DeclSeqNode> constants, std::shared_ptr<DeclSeqNode> structures, std::shared_ptr<DeclSeqNode> functions,
			 std::shared_ptr<DeclSeqNode> datas, std::shared_ptr<StmtSeqNode> statements);
	~ProgNode();

	std::shared_ptr<Environ> semant(Environ* e);

	void translate(Codegen* g, const std::vector<UserFunc>& userfuncs);
};
