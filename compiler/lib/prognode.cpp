#include "prognode.hpp"
#include <map>
#include "codegen.hpp"
#include "declnode.hpp"
#include "environ.hpp"
#include "label.hpp"
#include "stmtnode.hpp"

#include <stdutil.hpp>

ProgNode::ProgNode(std::shared_ptr<DeclSeqNode> constants, std::shared_ptr<DeclSeqNode> structures,
				   std::shared_ptr<DeclSeqNode> functions, std::shared_ptr<DeclSeqNode> datas,
				   std::shared_ptr<StmtSeqNode> statements)
	: consts(constants), structs(structures), funcs(functions), datas(datas), stmts(statements)
{}

ProgNode::~ProgNode()
{
	this->consts.reset();
	this->structs.reset();
	this->funcs.reset();
	this->datas.reset();
	this->stmts.reset();
}

//////////////////
// The program! //
//////////////////
std::shared_ptr<Environ> ProgNode::semant(Environ* e)
{
	file_lab = genLabel();

	StmtSeqNode::reset(stmts->file, file_lab);

	std::shared_ptr<Environ> env = std::make_shared<Environ>(genLabel(), Type::int_type, 0, 0);

	consts->proto(env->decls, env);
	structs->proto(env->typeDecls, env);
	structs->semant(env);
	funcs->proto(env->funcDecls, env);
	stmts->semant(env);
	funcs->semant(env);
	datas->proto(env->decls, env);
	datas->semant(env);

	sem_env = env;
	return env;
}

void ProgNode::translate(Codegen* g, const std::vector<UserFunc>& usrfuncs)
{
	int k;

	if (g->debug)
		g->s_data(stmts->file, file_lab);

	//enumerate locals
	int size = enumVars(sem_env);

	//'Main' label
	g->enter("__MAIN", size);

	//reset data pointer
	g->code(call("__bbRestore", global("__DATA")));

	//load external libs
	g->code(call("__bbLoadLibs", global("__LIBS")));

	//call main program
	g->code(jsr(sem_env->funcLabel + "_begin"));
	g->code(jump(sem_env->funcLabel + "_leave"));
	g->label(sem_env->funcLabel + "_begin");

	//create locals
	TNode* t = createVars(sem_env);
	if (t)
		g->code(t);
	if (g->debug) {
		std::string t = genLabel();
		g->s_data("<main program>", t);
		g->code(call("__bbDebugEnter", local(0), iconst((int)sem_env), global(t)));
	}

	//no user funcs used!
	usedfuncs.clear();

	//program statements
	stmts->translate(g);

	//emit return
	g->code(ret());

	//check labels
	for (k = 0; k < sem_env->labels.size(); ++k) {
		if (sem_env->labels[k]->def < 0)
			ex("Undefined label '" + sem_env->labels[k]->name + "'", sem_env->labels[k]->ref, stmts->file);
	}

	//leave main program
	g->label(sem_env->funcLabel + "_leave");
	t = deleteVars(sem_env);
	if (g->debug)
		t = new TNode(IR_SEQ, call("__bbDebugLeave"), t);
	g->leave(t, 0);

	//structs
	structs->translate(g);

	//non-main functions
	funcs->translate(g);

	//data
	datas->translate(g);

	//library functions
	std::map<std::string, std::vector<int>> libFuncs;

	//lib ptrs
	g->flush();
	g->align_data(4);
	for (k = 0; k < usrfuncs.size(); ++k) {
		const UserFunc& fn = usrfuncs[k];

		if (!usedfuncs.count(fn.ident))
			continue;

		libFuncs[fn.lib].push_back(k);

		g->i_data(0, "_f" + fn.ident);
	}

	//LIBS chunk
	g->flush();
	g->label("__LIBS");
	std::map<std::string, std::vector<int>>::const_iterator lf_it;
	for (lf_it = libFuncs.begin(); lf_it != libFuncs.end(); ++lf_it) {
		//lib name
		g->s_data(lf_it->first);

		const std::vector<int>& fns = lf_it->second;

		for (int j = 0; j < fns.size(); ++j) {
			const UserFunc& fn = usrfuncs[fns[j]];

			//proc name
			g->s_data(fn.proc);

			g->p_data("_f" + fn.ident);
		}
		g->s_data("");
	}
	g->s_data("");

	//DATA chunk
	g->flush();
	g->align_data(4);
	g->label("__DATA");
	datas->transdata(g);
	g->i_data(0);

	//Thats IT!
	g->flush();
}

UserFunc::UserFunc(const UserFunc& t) : ident(t.ident), proc(t.proc), lib(t.lib) {}

UserFunc::UserFunc(const std::string& id, const std::string& pr, const std::string& lb) : ident(id), proc(pr), lib(lb)
{}
