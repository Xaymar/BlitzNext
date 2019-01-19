#include "type.hpp"

Type::Type() {}

Type::~Type() {}

bool Type::intType()
{
	return false;
}

bool Type::floatType()
{
	return false;
}

bool Type::stringType()
{
	return false;
}

bool Type::canCastTo(std::shared_ptr<Type> t)
{
	return this == t.get();
}

std::shared_ptr<FuncType> Type::funcType()
{
	return std::shared_ptr<FuncType>();
}

std::shared_ptr<ArrayType> Type::arrayType()
{
	return std::shared_ptr<ArrayType>();
}

std::shared_ptr<StructType> Type::structType()
{
	return std::shared_ptr<StructType>();
}

std::shared_ptr<ConstType> Type::constType()
{
	return std::shared_ptr<ConstType>();
}

std::shared_ptr<VectorType> Type::vectorType()
{
	return std::shared_ptr<VectorType>();
}

FuncType::FuncType(std::shared_ptr<Type> return_type, std::shared_ptr<DeclSeq> parameters, bool is_userlib,
				   bool is_customfunction)
	: returnType(return_type), params(parameters), userlib(is_userlib), cfunc(is_customfunction)
{}

FuncType::~FuncType() {}

std::shared_ptr<FuncType> FuncType::funcType()
{
	return std::dynamic_pointer_cast<FuncType>(this->shared_from_this());
}

ArrayType::ArrayType(std::shared_ptr<Type> t, int n) : type(t), size(n) {}

ArrayType::~ArrayType() {}

std::shared_ptr<ArrayType> ArrayType::arrayType()
{
	return std::dynamic_pointer_cast<ArrayType>(this->shared_from_this());
}

StructType::StructType(const std::string& i) : ident(i) {}

StructType::StructType(const std::string& i, std::shared_ptr<DeclSeq> f) : ident(i), fields(f) {}

StructType::~StructType() {}

std::shared_ptr<StructType> StructType::structType()
{
	return std::dynamic_pointer_cast<StructType>(this->shared_from_this());
}

bool StructType::canCastTo(std::shared_ptr<Type> t)
{
	return (t.get() == this) || (t == Type::null_type)
		   || (this->shared_from_this() == Type::null_type && t->structType());
}

ConstType::ConstType(int32_t n) : intValue(n), valueType(Type::int_type) {}

ConstType::ConstType(float_t n) : floatValue(n), valueType(Type::float_type) {}

ConstType::ConstType(std::string const& n) : stringValue(n), valueType(Type::string_type) {}

ConstType::~ConstType() {}

std::shared_ptr<ConstType> ConstType::constType()
{
	return std::dynamic_pointer_cast<ConstType>(this->shared_from_this());
}

VectorType::VectorType(const std::string& l, Type* t, const std::vector<int>& szs)
	: label(l), elementType(t), sizes(szs)
{}

VectorType::~VectorType() {}

std::shared_ptr<VectorType> VectorType::vectorType()
{
	return std::dynamic_pointer_cast<VectorType>(this->shared_from_this());
}

bool VectorType::canCastTo(std::shared_ptr<Type> t)
{
	if (this == t.get()) {
		return true;
	}

	std::shared_ptr<VectorType> v = t->vectorType();
	if (!v) {
		return false;
	}
	if (elementType != v->elementType) {
		return false;
	}
	if (sizes.size() != v->sizes.size()) {
		return false;
	}
	for (int k = 0; k < sizes.size(); ++k) {
		if (sizes[k] != v->sizes[k]) {
			return false;
		}
	}

	return true;
}

class VoidType : public Type {
	virtual bool canCastTo(std::shared_ptr<Type> t) override {
		return t == Type::void_type;
	}
};
std::shared_ptr<Type> Type::void_type = std::make_shared<VoidType>();

class IntType : public Type {
	virtual bool intType() override {
		return true;
	}

	virtual bool canCastTo(std::shared_ptr<Type> t) override
	{
		return t == Type::int_type;
	}
};
std::shared_ptr<Type> Type::int_type = std::make_shared<IntType>();

class FloatType : public Type {
	virtual bool floatType() override
	{
		return true;
	}

	virtual bool canCastTo(std::shared_ptr<Type> t) override
	{
		return t == Type::float_type;
	}
};
std::shared_ptr<Type> Type::float_type = std::make_shared<FloatType>();

class StringType : public Type {
	virtual bool stringType() override
	{
		return true;
	}

	virtual bool canCastTo(std::shared_ptr<Type> t) override
	{
		return t == Type::string_type;
	}
};
std::shared_ptr<Type> Type::string_type = std::make_shared<StringType>();

std::shared_ptr<Type> Type::string_type = std::make_shared<StructType>("Null");
