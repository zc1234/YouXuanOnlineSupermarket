package com.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.pojo.Order;
import com.store.pojo.OrderItems;
import com.store.pojo.Refund;
import com.store.utils.Paging;

public interface OrderMapper {
	public int insertOrder(Order order);
	public int insertOrderItems(OrderItems orderItems);
	public int submitOrder(@Param("orderID") int orderID);
	public List<Order> showAllOrders(@Param("ordersPaging") Paging<Order> ordersPaging);
	public List<Order> showSomeOrders(@Param("param") int param,@Param("ordersPaging") Paging<Order> ordersPaging);
	public int countAllOrders();
	public List<OrderItems> findOrderItemsByID(@Param("orderID") int orderID);
	public int updatePriceSum(@Param("priceSum") float priceSum,@Param("orderID") int orderID);
	public int sendOutGoods(int orderID);
	public int receiveGoods(int orderID);
	public int deleteOrder(int orderID);
	public int countOrder(@Param("userID") int userID,@Param("orderStatus") int orderStatus);
	public int countOrders(int orderStatus);
	public String datetime();
	public int remainingTime(@Param("orderID") int orderID);
	public List<Order> findOrdersbyUserID(@Param("userID") int userID);
	public List<Order> findRefundOrdersbyUserID(@Param("userID") int userID);
	public OrderItems findOrderItembyOrderItemID(@Param("orderitemsID") int orderitemsID);
	public int findGoodsIDbyOrderItemID(@Param("orderitemsID") int orderitemsID);
	public OrderItems findOrderItemAndGoodsbyOrderItemID(@Param("orderitemsID") int orderitemsID);
	public Order orderDetail(int orderID);
	public int updateStatus(int orderitemsID);
	public OrderItems refundInfo(@Param("orderitemsID") int orderitemsID);
	public int submitRefund(@Param("orderitemsID") int orderitemsID,@Param("type") char type,
							@Param("reason") char reason,@Param("refundDetail") String refundDetail);
	public Refund isThereRefund(@Param("orderitemsID") int orderitemsID);
	public int getOrderIDbyOrderItemsID(@Param("orderitemsID") int orderitemsID);
	public int orderRefund(@Param("orderID") int orderID);
	public int orderItemRefund(@Param("orderitemsID") int orderitemsID);
	public int backSubmitRefund(@Param("status") char status,@Param("refundResponse") String refundResponse,@Param("refundID") int refundID);
	public int changeRefundStatus(@Param("orderitemsID") int orderitemsID);
	public int getOrderItemsIDbyRefundID(@Param("refundID") int refundID);
	public List<Integer> isThereRefundItems(@Param("orderID") int orderID);
	public int updateOrderStatus(@Param("orderID") int orderID);
	public float getPriceSumByOrderID(@Param("orderID") int orderID);
	public int updateScore(@Param("userID") int userID,@Param("userScore") int userScore);
}
