
#ifndef ENTITY_H
#define ENTITY_H

#include <list>

#include "geom.hpp"

class Entity;
class Object;
class Camera;
class Light;
class Model;
class Mirror;
class Listener;
class MeshModel;
class MD2Model;

class Entity {
	public:
	Entity();
	Entity(const Entity& e);
	virtual ~Entity();

	virtual Entity* clone() = 0;

	//ugly casts!
	virtual Object* getObject()
	{
		return nullptr;
	}
	virtual Camera* getCamera()
	{
		return nullptr;
	}
	virtual Light* getLight()
	{
		return nullptr;
	}
	virtual Model* getModel()
	{
		return nullptr;
	}
	virtual Mirror* getMirror()
	{
		return nullptr;
	}
	virtual Listener* getListener()
	{
		return nullptr;
	}

	void        SetName(const std::string& t);
	std::string getName() const
	{
		return m_name;
	}

	void    SetParent(Entity* parent);
	Entity* getParent() const
	{
		return m_parent;
	}

	void SetVisible(bool vis);
	bool IsVisible() const
	{
		return m_isVisible;
	}
	void EnumerateVisible(std::list<Object*>& out);

	void SetEnabled(bool ena);
	bool IsEnabled() const
	{
		return m_isEnabled;
	}
	void EnumerateEnabled(std::list<Object*>& out);

	void             SetLocalPosition(const Vector& v);
	const Vector&    GetLocalPosition() const;
	void             SetLocalScale(const Vector& v);
	const Vector&    GetLocalScale() const;
	void             SetLocalRotation(const Quat& q);
	const Quat&      GetLocalRotation() const;
	void             SetLocalTransform(const Transform& t);
	const Transform& GetLocalTransform() const;

	void             SetWorldPosition(const Vector& v);
	const Vector&    GetWorldPosition() const;
	void             SetWorldScale(const Vector& v);
	const Vector&    GetWorldScale() const;
	void             SetWorldRotation(const Quat& q);
	const Quat&      GetWorldRotation() const;
	void             SetWorldTransform(const Transform& t);
	const Transform& GetWorldTransform() const;

	Entity* GetChildren() const
	{
		return m_children;
	}
	Entity* GetSuccessor() const
	{
		return m_listNext;
	}

	static Entity* GetEntityOrphans()
	{
		return _orphans;
	}

	private:
	Entity *m_listNext, *m_listPrev, *m_parent, *m_children, *m_last_child;

	static Entity *_orphans, *_last_orphan;

	bool m_isVisible, m_isEnabled;

	std::string m_name;

	mutable int invalid;

	Quat              m_localRotation;
	Vector            m_localPosition, m_localScale;
	mutable Transform m_localTransform;

	mutable Quat      m_worldRotation;
	mutable Vector    m_worldPosition, m_worldScale;
	mutable Transform m_worldTransform;

	void InsertChildToParent();
	void RemoveParent();
	void invalidateLocal();
	void InvalidateWorldTransform();
};

#endif
