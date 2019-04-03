package com.store.pojo;

import java.io.Serializable;
import java.util.List;

public class Type implements Serializable{
	private static final long serialVersionUID = 1L;
	private int typeID;
	private String typeName;
	private int typeLast;
	private List<Type> childTypes;	//当前类别有可能是父类别，包含一个或多个子类别
	private Type fatherType;		//当前类别有可能是子类别，包含一个父类别
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getTypeID() {
		return typeID;
	}
	public void setTypeID(int typeID) {
		this.typeID = typeID;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getTypeLast() {
		return typeLast;
	}
	public void setTypeLast(int typeLast) {
		this.typeLast = typeLast;
	}
	public List<Type> getChildTypes() {
		return childTypes;
	}
	public void setChildTypes(List<Type> childTypes) {
		this.childTypes = childTypes;
	}
	public Type getFatherType() {
		return fatherType;
	}
	public void setFatherType(Type fatherType) {
		this.fatherType = fatherType;
	}
}
