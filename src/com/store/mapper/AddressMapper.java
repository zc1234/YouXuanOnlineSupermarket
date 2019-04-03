package com.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.pojo.Address;

public interface AddressMapper {
	public int insertAddress(Address insertAddress);
	public List<Address> findAddressByUserID (@Param("userID") int userID);
	public Address findAddressByAddressID (@Param("addressID") int addressID);
	public Address findDefaultAddress (@Param("userID") int userID);
	public int changeDefaultAddress (@Param("addressID") int addressID);
	public int setDefaultAddress (@Param("addressID") int addressID);
	public int deleteAddress (@Param("addressID") int addressID);
}
