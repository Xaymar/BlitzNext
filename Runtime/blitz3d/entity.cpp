#include "entity.hpp"

Entity *Entity::_orphans, *Entity::_last_orphan;

enum { INVALID_LOCALTFORM = 1, INVALID_WORLDTFORM = 2 };

void Entity::RemoveParent()
{
	if (m_parent) {
		if (m_parent->m_children == this)
			m_parent->m_children = m_listNext;
		if (m_parent->m_last_child == this)
			m_parent->m_last_child = m_listPrev;
	} else {
		if (_orphans == this)
			_orphans = m_listNext;
		if (_last_orphan == this)
			_last_orphan = m_listPrev;
	}
	if (m_listNext)
		m_listNext->m_listPrev = m_listPrev;
	if (m_listPrev)
		m_listPrev->m_listNext = m_listNext;
}

void Entity::InsertChildToParent()
{
	m_listNext = 0;
	if (m_parent) {
		if (m_listPrev = m_parent->m_last_child)
			m_listPrev->m_listNext = this;
		else
			m_parent->m_children = this;
		m_parent->m_last_child = this;
	} else {
		if (m_listPrev = _last_orphan)
			m_listPrev->m_listNext = this;
		else
			_orphans = this;
		_last_orphan = this;
	}
}

Entity::Entity()
	: m_listNext(0), m_listPrev(0), m_parent(0), m_children(0), m_last_child(0), m_isVisible(true), m_isEnabled(true),
	  m_localScale(1, 1, 1), invalid(0)
{
	InsertChildToParent();
}

Entity::Entity(const Entity& e)
	: m_listNext(0), m_listPrev(0), m_parent(0), m_children(0), m_last_child(0), m_name(e.m_name),
	  m_isVisible(e.m_isVisible), m_isEnabled(e.m_isEnabled), m_localPosition(e.m_localPosition),
	  m_localScale(e.m_localScale), m_localRotation(e.m_localRotation), invalid(INVALID_LOCALTFORM | INVALID_WORLDTFORM)
{
	InsertChildToParent();
}

Entity::~Entity()
{
	while (GetChildren())
		delete GetChildren();
	RemoveParent();
}

void Entity::InvalidateWorldTransform()
{
	if (invalid & INVALID_WORLDTFORM)
		return;
	invalid |= INVALID_WORLDTFORM;
	for (Entity* e = m_children; e; e = e->m_listNext) {
		e->InvalidateWorldTransform();
	}
}

void Entity::invalidateLocal()
{
	invalid |= INVALID_LOCALTFORM;
	InvalidateWorldTransform();
}

const Transform& Entity::GetLocalTransform() const
{
	if (invalid & INVALID_LOCALTFORM) {
		m_localTransform.m = Matrix(m_localRotation);
		m_localTransform.m.i *= m_localScale.x;
		m_localTransform.m.j *= m_localScale.y;
		m_localTransform.m.k *= m_localScale.z;
		m_localTransform.v = m_localPosition;
		invalid &= ~INVALID_LOCALTFORM;
	}
	return m_localTransform;
}

const Transform& Entity::GetWorldTransform() const
{
	if (invalid & INVALID_WORLDTFORM) {
		m_worldTransform = m_parent ? m_parent->GetWorldTransform() * GetLocalTransform() : GetLocalTransform();
		invalid &= ~INVALID_WORLDTFORM;
	}
	return m_worldTransform;
}

void Entity::SetParent(Entity* p)
{
	if (m_parent == p)
		return;

	RemoveParent();

	m_parent = p;

	InsertChildToParent();

	InvalidateWorldTransform();
}

void Entity::SetName(const std::string& t)
{
	m_name = t;
}

void Entity::SetVisible(bool visible)
{
	m_isVisible = visible;
}

void Entity::SetEnabled(bool enabled)
{
	m_isEnabled = enabled;
}

void Entity::EnumerateVisible(std::list<Object*>& out)
{
	if (!m_isVisible)
		return;
	if (Object* o = getObject())
		out.push_back(o);
	for (Entity* e = m_children; e; e = e->m_listNext) {
		e->EnumerateVisible(out);
	}
}

void Entity::EnumerateEnabled(std::list<Object*>& out)
{
	if (!m_isEnabled)
		return;
	if (Object* o = getObject())
		out.push_back(o);
	for (Entity* e = m_children; e; e = e->m_listNext) {
		e->EnumerateEnabled(out);
	}
}

void Entity::SetLocalPosition(const Vector& v)
{
	m_localPosition = v;
	invalidateLocal();
}

void Entity::SetLocalScale(const Vector& v)
{
	m_localScale = v;
	invalidateLocal();
}

void Entity::SetLocalRotation(const Quat& q)
{
	m_localRotation = q.normalized();
	invalidateLocal();
}

void Entity::SetLocalTransform(const Transform& t)
{
	m_localPosition = t.v;
	m_localScale    = Vector(t.m.i.length(), t.m.j.length(), t.m.k.length());
	m_localRotation = matrixQuat(t.m);
	invalidateLocal();
}

void Entity::SetWorldPosition(const Vector& v)
{
	SetLocalPosition(m_parent ? -m_parent->GetWorldTransform() * v : v);
}

void Entity::SetWorldScale(const Vector& v)
{
	SetLocalScale(m_parent ? v / m_parent->GetWorldScale() : v);
}

void Entity::SetWorldRotation(const Quat& q)
{
	SetLocalRotation(m_parent ? -m_parent->GetWorldRotation() * q : q);
}

void Entity::SetWorldTransform(const Transform& t)
{
	SetLocalTransform(m_parent ? -m_parent->GetWorldTransform() * t : t);
}

const Vector& Entity::GetLocalPosition() const
{
	return m_localPosition;
}

const Vector& Entity::GetLocalScale() const
{
	return m_localScale;
}

const Quat& Entity::GetLocalRotation() const
{
	return m_localRotation;
}

const Vector& Entity::GetWorldPosition() const
{
	return GetWorldTransform().v;
}

const Vector& Entity::GetWorldScale() const
{
	m_worldScale = m_parent ? m_parent->GetWorldScale() * m_localScale : m_localScale;
	return m_worldScale;
}

const Quat& Entity::GetWorldRotation() const
{
	m_worldRotation = m_parent ? m_parent->GetWorldRotation() * m_localRotation : m_localRotation;
	return m_worldRotation;
}
