package com.store.mapper;

import java.util.List;

import com.store.pojo.Type;

public interface TypeMapper {
	public List<Type> getFatherTypes();
	public int countFatherTypes();
	public List<Type> getChildTypes(int fatherTypeID);
	public Type getFatherType(int fatherTypeID);
}
