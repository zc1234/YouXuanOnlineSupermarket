package com.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.pojo.Favorite;

public interface FavoriteMapper {
	public List<Favorite> favoritelist(@Param("userID") int userID,@Param("status") int status);
	public int countFavorite(int userID);
	public int updateMonthSaleAndAvgPoint(@Param("monthSale") int monthSale,@Param("favoriteID") int favoriteID,@Param("avgPoint") float avgPoint);
	public int deleteFavorite(int favoriteID);
}
