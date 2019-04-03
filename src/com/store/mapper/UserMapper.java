package com.store.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.store.pojo.Order;
import com.store.pojo.Safe;
import com.store.pojo.User;
import com.store.utils.Paging;

public interface UserMapper {
	public int insertUser(User user);
	public int deleteUser(int userID);
	public int recoverUser(int userID);
	public int grantAdmin(int userID);
	public int updateUser(User user);
	public List<User> findUsers(String username);
	public Integer countUserByFirstName(String firstName);
	public User login_annotation
	(@Param("userLoginName") String userLoginName,@Param("userPassword") String userPassword);
	public User isThereSameName(@Param("userLoginName") String userLoginName);
	public List<Order> findOrdersByUser(Long userID); 
	public User searchUserByID(@Param("userID") int userID);
	public List<User> showAllUsers(@Param("paging") Paging<User> paging);
	public int countAllUsers();
	public int updateUserInfo(@Param("userImg") String userImg,@Param("userSex") char userSex,
							@Param("userBirthday") String userBirthday,@Param("userPhone") String userPhone,
							@Param("userEmail") String userEmail,@Param("userID") int userID);
	public Safe findSafeInfo(int userID);
	public int insertIdentity(@Param("userID") int userID,@Param("identity") String identity);
	public int updateIdentity(@Param("userID") int userID,@Param("identity") String identity);
	public int insertProblem(@Param("userID") int userID,@Param("question1") char question1,
							@Param("answer1") String answer1,@Param("question2") char question2,
							@Param("answer2") String answer2);
	public int updateProblem(@Param("userID") int userID,@Param("question1") char question1,
							@Param("answer1") String answer1,@Param("question2") char question2,
							@Param("answer2") String answer2);
	public User checkPassword(@Param("userID") int userID,@Param("oldPassword") String oldPassword);
	public int editPassword(@Param("userID") int userID,@Param("newPassword") String newPassword);
	public int updateBalance(@Param("userID") int userID,@Param("userBalance") float userBalance);
	public float getBalance(@Param("userID") int userID);
}
