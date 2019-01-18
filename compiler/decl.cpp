
#include "std.hpp"
#include "decl.hpp"
#include "type.hpp"

Decl::~Decl(){
}

DeclSeq::DeclSeq(){
}

void Decl::getName( char *buff ){
	int sz=name.size();
	memcpy( buff,name.data(),sz );
	buff[sz]=0;
}

DeclSeq::~DeclSeq(){
	for( ;decls.size();decls.pop_back() ) delete decls.back();
}

Decl *DeclSeq::findDecl( const string &s ){
	vector<Decl*>::iterator it;
	for( it=decls.begin();it!=decls.end();++it ){
		if( (*it)->name==s ) return *it;
	}
	return 0;
}

Decl *DeclSeq::insertDecl( const string &s,Type *t,int kind,ConstType *d ){
	if( findDecl( s ) ) return 0;
	decls.push_back( new Decl( s,t,kind,d ) );
	return decls.back();
}

