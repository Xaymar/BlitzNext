#pragma once
#include <cinttypes>
#include <cfloat>
#include <memory>
#include <string>
#include <vector>
#include "decl.hpp"

class FuncType;
class ArrayType;
class StructType;
class ConstType;
class VectorType;
class DeclSeq;

class Type : public std::enable_shared_from_this<Type> {
	public:
	Type();
	virtual ~Type();

	virtual bool intType();
	virtual bool floatType();
	virtual bool stringType();

	//operators
	virtual bool canCastTo(std::shared_ptr<Type> t);

	//casts to inherited types
	virtual std::shared_ptr<FuncType>   funcType();
	virtual std::shared_ptr<ArrayType>  arrayType();
	virtual std::shared_ptr<StructType> structType();
	virtual std::shared_ptr<ConstType>  constType();
	virtual std::shared_ptr<VectorType> vectorType();

	public /* Built-in Types */:
	static std::shared_ptr<Type> void_type;
	static std::shared_ptr<Type> int_type;
	static std::shared_ptr<Type> float_type;
	static std::shared_ptr<Type> string_type;
	static std::shared_ptr<Type> null_type;
};

class FuncType : public Type {
	std::shared_ptr<Type>    returnType;
	std::shared_ptr<DeclSeq> params;
	bool                     userlib;
	bool                     cfunc;

	public:
	FuncType(std::shared_ptr<Type> return_type, std::shared_ptr<DeclSeq> parameters, bool is_userlib,
			 bool is_customfunction);
	virtual ~FuncType();

	virtual std::shared_ptr<FuncType> funcType() override;
};

class ArrayType : public Type {
	std::shared_ptr<Type> type;
	int                   size;

	public:
	ArrayType(std::shared_ptr<Type> type, int size);
	virtual ~ArrayType();

	virtual std::shared_ptr<ArrayType> arrayType() override;
};

class StructType : public Type {
	std::string              ident;
	std::shared_ptr<DeclSeq> fields;

	public:
	StructType(const std::string& name);
	StructType(const std::string& name, std::shared_ptr<DeclSeq> fields);
	virtual ~StructType();

	virtual std::shared_ptr<StructType> structType() override;

	virtual bool canCastTo(std::shared_ptr<Type> t) override;
};

class ConstType : public Type {
	std::shared_ptr<Type> valueType;

	int32_t     intValue;
	float_t     floatValue;
	std::string stringValue;

	public:
	ConstType(int32_t n);
	ConstType(float_t n);
	ConstType(std::string const& n);
	virtual ~ConstType();

	virtual std::shared_ptr<ConstType> constType() override;
};

class VectorType : public Type {
	std::string      label;
	Type*            elementType;
	std::vector<int> sizes;

	public:
	VectorType(const std::string& l, Type* t, const std::vector<int>& szs);
	virtual ~VectorType();

	virtual std::shared_ptr<VectorType> vectorType() override;

	virtual bool canCastTo(std::shared_ptr<Type> t) override;
};
