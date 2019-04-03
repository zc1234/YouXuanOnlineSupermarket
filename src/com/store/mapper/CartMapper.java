package com.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.pojo.CartItems;

public interface CartMapper {
	public int insertGoods(CartItems item);
	public CartItems isThereSameGoods
		(@Param("userID") int userID,@Param("goodsID") int goodsID);
	public int addCartItemsNumber
		(@Param("userID") int userID,@Param("goodsID") int goodsID,@Param("price") float price);
	public List<CartItems> showCart(@Param("userID") int userID);
	public int cartItemPlus1(@Param("cartID") int cartID,@Param("price") float price);
	public int cartItemMinus1(@Param("cartID") int cartID,@Param("price") float price);
	public int getGoods(@Param("cartID") int cartID);
	public int getUser(@Param("cartID") int cartID);
	public int CartSums(@Param("userID") int userID);
	public int deleteGoods(@Param("cartID") int cartID);
	public int countCartItems(@Param("userID") int userID);
}
