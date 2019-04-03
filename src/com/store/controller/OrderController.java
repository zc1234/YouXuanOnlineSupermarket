	package com.store.controller;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.store.mapper.AddressMapper;
import com.store.mapper.CartMapper;
import com.store.mapper.CommentMapper;
import com.store.mapper.FavoriteMapper;
import com.store.mapper.GoodsMapper;
import com.store.mapper.OrderMapper;
import com.store.mapper.UserMapper;
import com.store.pojo.Address;
import com.store.pojo.CartItems;
import com.store.pojo.Comment;
import com.store.pojo.Favorite;
import com.store.pojo.Goods;
import com.store.pojo.Order;
import com.store.pojo.OrderItems;
import com.store.pojo.Refund;
import com.store.pojo.User;
import com.store.utils.Paging;
import com.store.utils.SqlSessionFactoryUtils;

@Controller
public class OrderController {
	@RequestMapping(value="/balancePage")
	public ModelAndView balancePage(@RequestParam(value="userID") int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<CartItems> cartitemslist = new ArrayList<CartItems>();
		List<Address> addressList = new ArrayList<Address>();
		int orderNumber = 0;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			cartitemslist = cartMapper.showCart(userID);
			orderNumber = cartMapper.CartSums(userID);
			AddressMapper addressMapper = sqlSession.getMapper(AddressMapper.class);
			addressList = addressMapper.findAddressByUserID(userID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		if(addressList.size()==0) {
			mv.addObject("message","注意:请先添加一个地址");
			mv.setViewName("/one/person/address.jsp");
		}
		else {
			mv.addObject("cartitemslist",cartitemslist);
			mv.addObject("addressList",addressList);
			mv.setViewName("/one/home/pay.jsp");
		}
		return mv;
	}
	@RequestMapping(value="/balance")
	public ModelAndView balance(@RequestParam(value="userID") int userID,
							@RequestParam(value="priceSum") float priceSum,
							String addressidsubmit,String deliverysubmit,
							String footstarttime,String footendtime,
							String footusernote) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		SqlSession sqlSession1 = null;
		SqlSession sqlSession2 = null;
		List<CartItems> cartitemslist = new ArrayList<CartItems>();
		List<OrderItems> orderItemsList = new ArrayList<OrderItems>();
		OrderItems orderItems = new OrderItems();
		Goods goods = new Goods();
		int orderNumber = 0;
		float balance = 0;
		String balance1 = null;
		Order order = new Order();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date startTime = null;
		Date endTime = null;
		Address address = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			cartitemslist = cartMapper.showCart(userID);
			orderNumber = cartMapper.CartSums(userID);
			order.setOrderNumber(orderNumber);
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			order.setUser(userMapper.searchUserByID(userID));
			AddressMapper addressMapper = sqlSession.getMapper(AddressMapper.class);
			address = addressMapper.findAddressByAddressID(Integer.parseInt(addressidsubmit));
			order.setAddress(address);
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			order.setOrderNote(footusernote);
			order.setDelivery(deliverysubmit.charAt(0));
			order.setOrderStatus(deliverysubmit.charAt(0));
			order.setPriceSum(priceSum);
			balance = userMapper.getBalance(userID);
			NumberFormat nf = NumberFormat.getNumberInstance();
			nf.setMaximumFractionDigits(2);
			balance1 = nf.format(balance);
			balance = Float.parseFloat(balance1);
			if(deliverysubmit.charAt(0)=='0'&&balance>=priceSum) {
				float userBalance = balance - priceSum;
				userMapper.updateBalance(userID, userBalance);
				order.setOrderStatus('1');
			}
			startTime = format1.parse(footstarttime);
			endTime = format1.parse(footendtime);
			order.setStartTime(startTime);
			order.setEndTime(endTime);
			orderMapper.insertOrder(order);
			sqlSession.commit();
			sqlSession.close();
			sqlSession1 = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession1.getMapper(GoodsMapper.class);
			OrderMapper orderMapper1 = sqlSession1.getMapper(OrderMapper.class);
			CartMapper cartMapper1 = sqlSession1.getMapper(CartMapper.class);
			for(int i=0;i<cartitemslist.size();i++) {
				int goodsNumber = cartitemslist.get(i).getNumber();
				int goodsID = cartitemslist.get(i).getGoods().getGoodsID();
				orderItems.setGoodsNumber(goodsNumber);
				goods = goodsMapper.searchGoodsByID(goodsID);
				orderItems.setGoods(goods);
				orderItems.setOrder(order);
				orderItems.setPriceSum(cartitemslist.get(i).getPriceSum());
				orderMapper1.insertOrderItems(orderItems);
				cartMapper1.deleteGoods(cartitemslist.get(i).getCartID());
				goodsMapper.updateGoodsStock(goodsNumber, goodsID);
				sqlSession1.commit();
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
			else if(sqlSession1!=null)
				sqlSession1.close();
		}
		mv.addObject("priceSum",priceSum);
		mv.addObject("address",address);
		mv.addObject("delivery",deliverysubmit.charAt(0));
		mv.addObject("status",order.getOrderStatus());
		mv.setViewName("/one/home/success.jsp");
		return mv;
	}
	@RequestMapping(value="/BackOrder")
	public ModelAndView BackOrder(int CurrentPage,int param) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Order> orderList = new ArrayList<Order>();
		Paging<Order> ordersPaging = new Paging<Order>();
		int count = 0;
		int pageSize = 8;
		int index = 0;
		int remainingTime = 0;
		ordersPaging.setPageSize(pageSize);
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			if(param!=7)
				count = orderMapper.countOrders(param);
			else
				count = orderMapper.countAllOrders();
			ordersPaging.setCurrentPage(CurrentPage);
			ordersPaging.setTotalRecords(count);
			index = (CurrentPage-1) * pageSize;
			ordersPaging.setIndex(index);
			if(param==7)
				orderList = orderMapper.showAllOrders(ordersPaging);
			else
				orderList = orderMapper.showSomeOrders(param, ordersPaging);
			for(int i=0;i<orderList.size();i++) {
				remainingTime = orderMapper.remainingTime(orderList.get(i).getOrderID());
				orderList.get(i).setRemainingTime(remainingTime);
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("orderList",orderList);
		mv.addObject("param",param);
		mv.addObject("number",ordersPaging.getTotalPages());
		mv.setViewName("background/manage/BackOrder.jsp");
		return mv;
	}
	@RequestMapping(value="/BackOrderDetail")
	public ModelAndView BackOrderDetail(int orderID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<OrderItems> orderItemsList = new ArrayList<OrderItems>();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			orderItemsList = orderMapper.findOrderItemsByID(orderID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("orderItemsList",orderItemsList);
		mv.setViewName("background/manage/BackOrderDetail.jsp");
		return mv;
	}
	@RequestMapping(value="/SendOutGoods")
	public ModelAndView SendOutGoods(int orderID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			orderMapper.sendOutGoods(orderID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("BackOrder?CurrentPage=1&param=7");
		return mv;
	}
	@RequestMapping(value="/ReceiveGoods")
	public ModelAndView ReceiveGoods(int orderID,int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		int userScore = 0;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			float pricesum = orderMapper.getPriceSumByOrderID(orderID);
			NumberFormat nf = NumberFormat.getNumberInstance();
			nf.setMaximumFractionDigits(0);
			String score = nf.format(pricesum);
			userScore = Integer.parseInt(score);
			orderMapper.updateScore(userID, userScore);
			orderMapper.receiveGoods(orderID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/showOrder?userID="+userID);
		return mv;
	}
	@RequestMapping(value="/PersonalCenter")
	public ModelAndView PersonalCenter(int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		int status_0 = 0;	//待付款
		int status_1 = 0;	//待发货
		int status_2 = 0;	//待收货
		int status_3 = 0;	//待评价
		int status_4 = 0;	//退款中
		int status_5 = 0;	//已删除
		String datetime = null;
		User user = new User();
		List<Favorite> favoritelist = new ArrayList<Favorite>();
		List<Goods> scoregoodslist = new ArrayList<Goods>();
		int favoritenum = 0;	//收藏商品数
		int status = 0;		//判断收藏商品数是否超过8个，超过为1，未超过为0
		int scoregoodsnum = 0;	//积分兑换商品数
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			datetime = orderMapper.datetime();
			status_0 = orderMapper.countOrder(userID, 0);
			status_1 = orderMapper.countOrder(userID, 1);
			status_2 = orderMapper.countOrder(userID, 2);
			status_3 = orderMapper.countOrder(userID, 3);
			status_4 = orderMapper.countOrder(userID, 4);
			status_5 = orderMapper.countOrder(userID, 5);
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			user = userMapper.searchUserByID(userID);
			FavoriteMapper favoriteMapper = sqlSession.getMapper(FavoriteMapper.class);
			favoritenum = favoriteMapper.countFavorite(userID);
			if(favoritenum<=8) {
				favoritelist = favoriteMapper.favoritelist(userID,status);
			}
			else {
				status = 1;
				favoritelist = favoriteMapper.favoritelist(userID,status);
			}
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			scoregoodsnum = goodsMapper.countScoreGoods();
			scoregoodslist = goodsMapper.searchScoreGoods();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("status_0", status_0);
		mv.addObject("status_1", status_1);
		mv.addObject("status_2", status_2);
		mv.addObject("status_3", status_3);
		mv.addObject("status_4", status_4);
		mv.addObject("status_5", status_5);
		mv.addObject("datetime", datetime);
		mv.addObject("user", user);
		mv.addObject("favoritelist", favoritelist);
		mv.addObject("favoritenum", favoritenum);
		mv.addObject("scoregoodslist", scoregoodslist);
		mv.addObject("scoregoodsnum", scoregoodsnum);
		mv.setViewName("one/person/index.jsp");
		return mv;
	}
	@RequestMapping(value="/addCommentPage")
	public ModelAndView addCommentPage(int orderitemsID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		OrderItems orderItem = new OrderItems();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			orderItem = orderMapper.findOrderItemAndGoodsbyOrderItemID(orderitemsID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("orderItem", orderItem);
		mv.setViewName("one/person/commentlist.jsp");
		return mv;
	}
	@RequestMapping(value="/addComment")
	public ModelAndView addComment(int orderitemsID,int userID,int score,String text) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Comment comment = new Comment();
		OrderItems orderItems = new OrderItems();
		User user = new User();
		int goodsID = 0;
		comment.setScore(score);
		comment.setCommenttext(text);
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			user = userMapper.searchUserByID(userID);
			comment.setUser(user);
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			orderItems = orderMapper.findOrderItembyOrderItemID(orderitemsID);
			comment.setOrderItems(orderItems);
			goodsID = orderMapper.findGoodsIDbyOrderItemID(orderitemsID);
			comment.setGoodsID(goodsID);
			CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
			commentMapper.insertComment(comment);
			orderMapper.updateStatus(orderitemsID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/showOrder?userID="+userID);
		return mv;
	}
	@RequestMapping(value="/showOrder")
	public ModelAndView showOrder(int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Order> orders = new ArrayList<Order>();
		List<OrderItems> orderItemsList = new ArrayList<OrderItems>();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			orders = orderMapper.findOrdersbyUserID(userID);
			for(int i=0;i<orders.size();i++) {
				orderItemsList = orderMapper.findOrderItemsByID(orders.get(i).getOrderID());
				orders.get(i).setOrderitems(orderItemsList);
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("orders", orders);
		mv.setViewName("one/person/order.jsp");
		return mv;
	}
	@RequestMapping(value="/favoritePage")
	public ModelAndView favoritePage(int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Favorite> favoriteList = new ArrayList<Favorite>();
		int status = 0;
		int goodsID = 0;
		int favoriteID = 0;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			FavoriteMapper favoriteMapper = sqlSession.getMapper(FavoriteMapper.class);
			favoriteList = favoriteMapper.favoritelist(userID, status);
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			for(int i=0;i<favoriteList.size();i++) {
				int monthSale = 0;
				int goodsMonthSaleNumber = 0;
				int goodsCommentNumber = 0;
				float avgPoint = 0;
				favoriteID = favoriteList.get(i).getFavoriteID();
				goodsID = favoriteList.get(i).getGoods().getGoodsID();
				goodsMonthSaleNumber = goodsMapper.getMonthGoodsSaleNumber(goodsID);
				if(goodsMonthSaleNumber != 0) {
					monthSale = goodsMapper.getMonthGoodsSale(goodsID);
				}
				goodsCommentNumber = goodsMapper.getCommentNumberSum(goodsID);
				if(goodsCommentNumber != 0) {
					avgPoint = goodsMapper.getGoodsAvgPoints(goodsID);
				}
				favoriteMapper.updateMonthSaleAndAvgPoint(monthSale, favoriteID, avgPoint);
				sqlSession.commit();
				favoriteList.get(i).setMonthSale(monthSale);
				favoriteList.get(i).setAvgPoint(avgPoint);
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("favoriteList", favoriteList);
		mv.setViewName("one/person/collection.jsp");
		return mv;
	}
	@RequestMapping(value="/DeleteFavorite")
	public ModelAndView deleteFavorite(int favoriteID,int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			FavoriteMapper favoriteMapper = sqlSession.getMapper(FavoriteMapper.class);
			favoriteMapper.deleteFavorite(favoriteID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/favoritePage?userID="+userID);
		return mv;
	}
	@RequestMapping(value="/GetAllComment")
	public ModelAndView GetAllComment(int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Comment> commentList = new ArrayList<Comment>();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
			commentList = commentMapper.findCommentByUserID(userID);
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			for(int i=0;i<commentList.size();i++) {
				int goodsID = commentList.get(i).getGoodsID();
				Goods goods = new Goods();
				goods = goodsMapper.searchGoodsByID(goodsID);
				commentList.get(i).setGoods(goods);
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("commentList", commentList);
		mv.setViewName("one/person/comment.jsp");
		return mv;
	}
	@RequestMapping(value="/orderDetail")
	public ModelAndView orderDetail(int orderID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Order order = new Order();
		List<OrderItems> orderItems = new ArrayList<OrderItems>();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			order = orderMapper.orderDetail(orderID);
			orderItems = orderMapper.findOrderItemsByID(orderID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("order", order);
		mv.addObject("orderItems", orderItems);
		mv.setViewName("one/person/orderinfo.jsp");
		return mv;
	}
	@RequestMapping(value="/Refund")
	public ModelAndView Refund(int orderitemsID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		OrderItems orderItem = new OrderItems();
		Refund refund = new Refund();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			refund = orderMapper.isThereRefund(orderitemsID);
			orderItem = orderMapper.refundInfo(orderitemsID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		if(refund != null) {
			mv.addObject("refund", refund);
		}
		mv.addObject("orderItem", orderItem);
		mv.setViewName("one/person/refund.jsp");
		return mv;
	}
	@RequestMapping(value="/SubmitRefund")
	public ModelAndView SubmitRefund(int orderitemsID,String refundType,String refundReason,String refundDetail) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Refund refund = new Refund();
		char type = refundType.charAt(0);
		char reason = refundReason.charAt(0);
		int orderID = 0;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			orderMapper.submitRefund(orderitemsID, type, reason, refundDetail);
			orderID = orderMapper.getOrderIDbyOrderItemsID(orderitemsID);
			orderMapper.orderItemRefund(orderitemsID);
			orderMapper.orderRefund(orderID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/Refund?orderitemsID="+orderitemsID);
		return mv;
	}
	@RequestMapping(value="/BackRefund")
	public ModelAndView BackRefund(int orderitemsID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Refund refund = new Refund();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			refund = orderMapper.isThereRefund(orderitemsID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("refund", refund);
		mv.setViewName("background/manage/BackOrderItemDetail.jsp");
		return mv;
	}
	@RequestMapping(value="/BackRefundSubmit")
	public ModelAndView BackRefundSubmit(int refundID,String refundStatus,String refundResponse) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		char status = refundStatus.charAt(0);
		int orderitemsID = 0;
		int orderID = 0;
		int sum = 0;    //订单中未处理退款的项目
		List<Integer> orderItemsStatusList = new ArrayList<Integer>();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			orderMapper.backSubmitRefund(status, refundResponse, refundID);
			orderitemsID = orderMapper.getOrderItemsIDbyRefundID(refundID);
			orderMapper.changeRefundStatus(orderitemsID);
			orderID = orderMapper.getOrderIDbyOrderItemsID(orderitemsID);
			orderItemsStatusList = orderMapper.isThereRefundItems(orderID);
			for(int i=0;i<orderItemsStatusList.size();i++) {
				int a = orderItemsStatusList.get(i);
				if(a==0)
					sum = sum + 1;
			}
			if(sum==0) {
				orderMapper.updateOrderStatus(orderID);
			}
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/BackRefund?orderitemsID="+orderitemsID);
		return mv;
	}
	@RequestMapping(value="/UserRefund")
	public ModelAndView UserRefund(int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Order> orders = new ArrayList<Order>();
		List<OrderItems> orderItemsList = new ArrayList<OrderItems>();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			orders = orderMapper.findRefundOrdersbyUserID(userID);
			for(int i=0;i<orders.size();i++) {
				orderItemsList = orderMapper.findOrderItemsByID(orders.get(i).getOrderID());
				orders.get(i).setOrderitems(orderItemsList);
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("orders", orders);
		mv.setViewName("one/person/change.jsp");
		return mv;
	}
	@RequestMapping(value="/SubmitOrder")
	public ModelAndView SubmitOrder(int orderID,int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			orderMapper.submitOrder(orderID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/showOrder?userID="+userID);
		return mv;
	}
	@RequestMapping(value="/DeleteOrder")
	public ModelAndView DeleteOrder(int orderID,int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			orderMapper.deleteOrder(orderID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/showOrder?userID="+userID);
		return mv;
	}
}
