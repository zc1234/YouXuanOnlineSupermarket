package com.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.pojo.Goods;
import com.store.pojo.Type;
import com.store.utils.Paging;

public interface GoodsMapper {
	public List<Goods> searchGoods(String goodsname);
	public int countSearchResults(String goodsname);
	public Goods searchGoodsByID(int goodsID);
	public List<Goods> goodsPaging(
		@Param("goodsName") String goodsName,
		@Param("paging") Paging<Goods> paging);
	public List<Goods> searchGoodsByType(@Param("typeID") int typeID);
	public int countSearchGoodsByTypeResults(int typeID);
	public List<Goods> goodsByTypePaging(
			@Param("typeID") int typeID,
			@Param("paging") Paging<Goods> paging);
	public List<Type> istherechildtypes(int typeID);
	public Type istherefathertype(int typeID);
	public List<Goods> searchGoodsByMultipleTypes
				(@Param("typelist") List<Type> typelist);
	public int countSearchGoodsByMultipleTypes
				(@Param("typelist") List<Type> typelist);
	public List<Goods> goodsPagingByMultipleTypes(
		@Param("typelist") List<Type> typelist,
		@Param("paging") Paging<Goods> paging);
	public List<Goods> showAllGoods(@Param("paging") Paging<Goods> paging);
	public List<Goods> showSomeGoods(@Param("param") int param,@Param("paging") Paging<Goods> paging);
	public int countAllGoods();
	public int countSomeGoods(int param);
	public int deleteGoods(int goodsID);
	public int recoverGoods(int goodsID);
	public int insertGoods(Goods goods);
	public int insertScoreGoods(Goods goods);
	public int updateGoods(Goods goods);
	public int updateScoreGoods(Goods goods);
	public float getGoodsAvgPoints(int goodsID);
	public int getGoodsSaleNumber(int goodsID);
	public int getGoodsSale(int goodsID);
	public int getMonthGoodsSaleNumber(int goodsID);
	public int getMonthGoodsSale(int goodsID);
	public int getCommentNumberSum(int goodsID);
	public int getCommentNumber(@Param("goodsID") int goodsID,@Param("score") int score);
	public int recoverPrice(@Param("goodsPrice") float goodsPrice,@Param("goodsID") int goodsID);
	public int updatePrice(@Param("goodsPrice") float goodsPrice,@Param("goodsOriginalPrice") float goodsOriginalPrice,@Param("goodsID") int goodsID);
	public int updateScore(@Param("goodsScore") int goodsScore,@Param("goodsID") int goodsID);
	public int addToFavorite(@Param("price") float price,@Param("userID") int userID,@Param("goodsID") int goodsID);
	public int isThereExistedFavorite(@Param("userID") int userID,@Param("goodsID") int goodsID);
	public int updateGoodsStock(@Param("goodsNumber") int goodsNumber,@Param("goodsID") int goodsID);
	public int countScoreGoods();
	public List<Goods> searchScoreGoods();
	public int minusScore(@Param("score") int score,@Param("userID") int userID);
}
