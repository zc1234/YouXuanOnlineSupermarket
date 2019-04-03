package com.store.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.store.mapper.CartMapper;
import com.store.mapper.GoodsMapper;
import com.store.mapper.UserMapper;
import com.store.pojo.CartItems;
import com.store.pojo.Goods;
import com.store.pojo.User;
import com.store.utils.SqlSessionFactoryUtils;

@Controller
public class CartController {
	@RequestMapping(value="/addToCart")
	public ModelAndView addToCart(int goodsID,int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		CartItems cartitem = new CartItems();
		CartItems existeditems = new CartItems();
		Goods goods = new Goods();
		User user = new User();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			goods = goodsMapper.searchGoodsByID(goodsID);
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			user = userMapper.searchUserByID(userID);
			cartitem.setGoodsID(goodsID);
			cartitem.setUserID(userID);
			existeditems = cartMapper.isThereSameGoods(userID, goodsID);
			if(existeditems != null) {
				float price = goods.getGoodsPrice();
				cartMapper.addCartItemsNumber(userID, goodsID, price);
				sqlSession.commit();
			}
			else {
				cartitem.setNumber(1);
				cartitem.setPriceSum(goods.getGoodsPrice());
				cartMapper.insertGoods(cartitem);
				sqlSession.commit();
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("userID",userID);
		mv.setViewName("/showCart");
		return mv;
	}
	@RequestMapping(value="/showCart")
	public ModelAndView showCart(@RequestParam(value="userID") int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<CartItems> cartitems = new ArrayList<CartItems>();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			cartitems = cartMapper.showCart(userID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("cartitems", cartitems);
		mv.addObject("userID",userID);
		mv.setViewName("/one/home/shopcart.jsp");
		return mv;	
	}
	@RequestMapping(value="/cartItemPlus1")
	public ModelAndView cartItemPlus1(int cartID,@RequestParam(value="userID") int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Goods goods = new Goods();
		User user = new User();
		int goodsID = 0;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			goodsID = cartMapper.getGoods(cartID);
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			goods = goodsMapper.searchGoodsByID(goodsID);
			int result = cartMapper.cartItemPlus1(cartID,goods.getGoodsPrice());
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);	
			user = userMapper.searchUserByID(userID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("userID",userID);
		mv.setViewName("/showCart");
		return mv;
	}
	@RequestMapping(value="/cartItemMinus1")
	public ModelAndView cartItemMinus1(int cartID,@RequestParam(value="userID") int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Goods goods = new Goods();
		User user = new User();
		int goodsID = 0;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			goodsID = cartMapper.getGoods(cartID);
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			goods = goodsMapper.searchGoodsByID(goodsID);
			int result = cartMapper.cartItemMinus1(cartID,goods.getGoodsPrice());
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);	
			user = userMapper.searchUserByID(userID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("userID",userID);
		mv.setViewName("/showCart");
		return mv;
	}
	@RequestMapping(value="/deleteGoods")
	public ModelAndView deleteGoods(@RequestParam("cartID") int cartID,@RequestParam(value="userID") int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		int result = 0;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			result = cartMapper.deleteGoods(cartID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("userID", userID);
		mv.setViewName("/showCart");
		return mv;
	}
}
