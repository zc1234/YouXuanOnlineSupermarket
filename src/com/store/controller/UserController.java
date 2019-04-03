package com.store.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.store.mapper.AddressMapper;
import com.store.mapper.CartMapper;
import com.store.mapper.UserMapper;
import com.store.pojo.Address;
import com.store.pojo.AddressParams;
import com.store.pojo.Order;
import com.store.pojo.Safe;
import com.store.pojo.User;
import com.store.utils.Paging;
import com.store.utils.SqlSessionFactoryUtils;

@Controller
@SessionAttributes("user")
public class UserController {
	@RequestMapping(value="/login")
	public ModelAndView login(String userLoginName,String userPassword,Model model) {
		ModelAndView mv = new ModelAndView();
		User user = new User();
		SqlSession sqlSession = null;
		int countCartItems = 0;	
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			user = userMapper.login_annotation(userLoginName, userPassword);
			if(user!=null&&user.getUserStatus()=='1') {
				CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
				countCartItems = cartMapper.countCartItems(user.getUserID());
				if(countCartItems!=0) {
					model.addAttribute(user);
				}
				else
					model.addAttribute(user);
			}
			else if(user!=null&&user.getUserStatus()=='2') {
				model.addAttribute(user);
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		if(user!=null&&user.getUserStatus()=='1') {
			mv.addObject("message", userLoginName);
			mv.setViewName("/index");
		}
		else if(user!=null&&user.getUserStatus()=='2') {
			mv.addObject("message", userLoginName);
			mv.setViewName("/background/manage/back.jsp");
		}
		else if(user!=null&&user.getUserStatus()=='0') {
			mv.addObject("message", "该用户已被禁用");
			mv.setViewName("/one/home/login.jsp");
		}
		else {
			mv.addObject("message", "提示：用户名或密码不正确");
			mv.setViewName("/one/home/login.jsp");
		}
		return mv;
	}
	@RequestMapping(value="/register")
	public ModelAndView register(User user) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		User user1 = new User();
		int result = 0;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			user1 = userMapper.isThereSameName(user.getUserLoginName());
			if(user1==null) {
				result = userMapper.insertUser(user);
				sqlSession.commit();
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		if(result==0&&user1!=null) {
			mv.addObject("message", "提示：用户名已存在");
			mv.setViewName("/one/home/register.jsp");
		}
		else if(result==1&&user1==null){
			mv.addObject("message", "提示：注册成功");
			mv.setViewName("/one/home/login.jsp");
		}
		else{
			mv.addObject("message", "提示：出现其他错误");
			mv.setViewName("/one/home/register.jsp");
		}
		return mv;
	}
	@RequestMapping(value="/findOrdersByUser")
	public ModelAndView findOrdersByUser(Long userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Order> order = new ArrayList<Order>();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			order = userMapper.findOrdersByUser(userID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("order", order);
		mv.setViewName("/WEB-INF/content/list.jsp");
		return mv;
	}
	@RequestMapping(value="/BackUsers")
	public ModelAndView BackUsers(int CurrentPage) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<User> usersList = new ArrayList<User>();
		Paging<User> paging = new Paging<User>();
		int count = 0;
		int pageSize = 8;
		int index = 0;
		paging.setPageSize(pageSize);
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			count = userMapper.countAllUsers();
			paging.setCurrentPage(CurrentPage);
			paging.setTotalRecords(count);
			index = (CurrentPage-1) * pageSize;
			paging.setIndex(index);
			usersList = userMapper.showAllUsers(paging);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("usersList",usersList);
		mv.addObject("number",paging.getTotalPages());
		mv.setViewName("background/manage/BackUsers.jsp");
		return mv;
	}
	@RequestMapping(value="/DeleteUser")
	public ModelAndView DeleteUser(int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.deleteUser(userID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("BackUsers?CurrentPage=1");
		return mv;
	}
	@RequestMapping(value="/RecoverUser")
	public ModelAndView RecoverUser(int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.recoverUser(userID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("BackUsers?CurrentPage=1");
		return mv;
	}
	@RequestMapping(value="/GrantAdmin")
	public ModelAndView GrantAdmin(int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.grantAdmin(userID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("BackUsers?CurrentPage=1");
		return mv;
	}
	@RequestMapping(value="/GetUserAddress")
	public ModelAndView GetUserAddress(int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Address> address = new ArrayList<Address>();
		try{
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			AddressMapper addressMapper = sqlSession.getMapper(AddressMapper.class);
			address = addressMapper.findAddressByUserID(userID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("address", address);
		mv.setViewName("one/person/address.jsp");
		return mv;
	}
	@RequestMapping(value="/InsertAddress")
	public ModelAndView InsertAddress(int userID,AddressParams addressParams) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Address insertAddress = new Address();
		Address defaultAddress = new Address();
		User user = new User();
		String addressUserName = addressParams.getAddressUserName();
		String phoneNumber = addressParams.getPhoneNumber();
		String province = addressParams.getProvince();
		String city = addressParams.getCity();
		String area = addressParams.getArea();
		String address = addressParams.getAddress();
		String completeAddress = null;
		if(province.equals(city)) {
			completeAddress =  city + area + address;
		}
		else{
			completeAddress = province + city + area + address;
		}
		insertAddress.setAddressUserName(addressUserName);
		insertAddress.setPhoneNumber(phoneNumber);
		insertAddress.setAddress(completeAddress);
		try{
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			user = userMapper.searchUserByID(userID);
			insertAddress.setUser(user);
			AddressMapper addressMapper = sqlSession.getMapper(AddressMapper.class);
			defaultAddress = addressMapper.findDefaultAddress(userID);
			if(defaultAddress==null) {
				insertAddress.setIsDefault('1');
				addressMapper.insertAddress(insertAddress);
				sqlSession.commit();
			}
			else {
				insertAddress.setIsDefault('0');
				addressMapper.insertAddress(insertAddress);
				sqlSession.commit();
			}	
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/GetUserAddress?userID="+userID);
		return mv;
	}
	@RequestMapping(value="/InsertAddress1")
	public ModelAndView InsertAddress1(int userID,AddressParams addressParams) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Address insertAddress = new Address();
		Address defaultAddress = new Address();
		User user = new User();
		String addressUserName = addressParams.getAddressUserName();
		String phoneNumber = addressParams.getPhoneNumber();
		String province = addressParams.getProvince();
		String city = addressParams.getCity();
		String area = addressParams.getArea();
		String address = addressParams.getAddress();
		String completeAddress = null;
		if(province.equals(city)) {
			completeAddress =  city + area + address;
		}
		else{
			completeAddress = province + city + area + address;
		}
		insertAddress.setAddressUserName(addressUserName);
		insertAddress.setPhoneNumber(phoneNumber);
		insertAddress.setAddress(completeAddress);
		try{
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			user = userMapper.searchUserByID(userID);
			insertAddress.setUser(user);
			AddressMapper addressMapper = sqlSession.getMapper(AddressMapper.class);
			defaultAddress = addressMapper.findDefaultAddress(userID);
			if(defaultAddress==null) {
				insertAddress.setIsDefault('1');
				addressMapper.insertAddress(insertAddress);
				sqlSession.commit();
			}
			else {
				insertAddress.setIsDefault('0');
				addressMapper.insertAddress(insertAddress);
				sqlSession.commit();
			}	
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/balancePage?userID="+userID);
		return mv;
	}
	@RequestMapping(value="/ChangeDefaultAddress")
	public ModelAndView ChangeDefaultAddress(int userID,int addressID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Address previousAddress = new Address();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			AddressMapper addressMapper = sqlSession.getMapper(AddressMapper.class);
			previousAddress = addressMapper.findDefaultAddress(userID);
			addressMapper.changeDefaultAddress(previousAddress.getAddressID());
			addressMapper.setDefaultAddress(addressID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/GetUserAddress?userID="+userID);
		return mv;
	}
	@RequestMapping(value="/EditAddressPage")
	public ModelAndView EditAddressPage(int userID,int addressID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Address editaddress = new Address();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			AddressMapper addressMapper = sqlSession.getMapper(AddressMapper.class);
			editaddress = addressMapper.findAddressByAddressID(addressID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("editaddress", editaddress);
		mv.setViewName("redirect:/GetUserAddress?userID="+userID);
		return mv;
	}
	@RequestMapping(value="/DeleteAddress")
	public ModelAndView DeleteAddress(int userID,int addressID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			AddressMapper addressMapper = sqlSession.getMapper(AddressMapper.class);
			addressMapper.deleteAddress(addressID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/GetUserAddress?userID="+userID);
		return mv;
	}
	@RequestMapping(value="/GetUserInfo")
	public ModelAndView GetUserInfo(int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		User user = new User();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			user = userMapper.searchUserByID(userID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("user", user);
		mv.setViewName("one/person/information.jsp");
		return mv;	
	}
	@RequestMapping(value="/UpdateUserInfo")
	public ModelAndView UpdateUserInfo(MultipartFile file,String userSex,String userBirthday,String userPhone,String userEmail,int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		String userImg = null;
		if(userSex!=null) {
			if(userSex.equals("male"))
				userSex = "1";
			else if(userSex.equals("female"))
				userSex = "0";
			else
				userSex = "2";
		}
		if(userSex==null)
			userSex = "3";
		if(file!=null) {
			mv.setView(new MappingJackson2JsonView());
			String fileName = "C:\\Users\\淳\\eclipse-workspace\\Test\\WebContent\\UserImg\\" + file.getOriginalFilename();
			file.getContentType();
			File dest = new File(fileName);
			try {
				file.transferTo(dest);
				mv.addObject("success",true);
				userImg = "UserImg/" + file.getOriginalFilename();
			} catch (IllegalStateException | IOException e) {
				mv.addObject("success",false);
			}
		}
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.updateUserInfo(userImg, userSex.charAt(0), userBirthday, userPhone, userEmail, userID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/GetUserInfo?userID="+userID);
		return mv;
	}
	@RequestMapping(value="/GetSafeInfo")
	public ModelAndView GetSafeInfo(int userID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Safe safe = new Safe();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			safe = userMapper.findSafeInfo(userID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("safe", safe);
		mv.setViewName("one/person/safety.jsp");
		return mv;	
	}
	@RequestMapping(value="/SetIdentity")
	public ModelAndView SetIdentity(int userID,String identity) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Safe safe = new Safe();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			safe = userMapper.findSafeInfo(userID);
			if(safe==null) {
				userMapper.insertIdentity(userID, identity);
				sqlSession.commit();
			}
			else {
				userMapper.updateIdentity(userID, identity);
				sqlSession.commit();
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("safe", safe);
		mv.setViewName("redirect:/GetSafeInfo?userID="+userID);
		return mv;	
	}
	@RequestMapping(value="/SetProblem")
	public ModelAndView SetProblem(int userID,String question1,String answer1,
											String question2,String answer2) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		char question01 = question1.charAt(0);
		char question02 = question2.charAt(0);
		Safe safe = new Safe();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			safe = userMapper.findSafeInfo(userID);
			if(safe==null) {
				userMapper.insertProblem(userID, question01, answer1, question02, answer2);
				sqlSession.commit();
			}
			else {
				userMapper.updateProblem(userID, question01, answer1, question02, answer2);
				sqlSession.commit();
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("safe", safe);
		mv.setViewName("redirect:/GetSafeInfo?userID="+userID);
		return mv;
	}
	@RequestMapping(value="/GetQuestionsOrIdentity")
	public ModelAndView GetQuestionsOrIdentity(int userID,int status) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Safe safe = new Safe();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			safe = userMapper.findSafeInfo(userID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("safe", safe);
		if(status==1)
			mv.setViewName("one/person/question.jsp");
		else if(status==2)
			mv.setViewName("one/person/idcard.jsp");
		return mv;
	}
	@RequestMapping(value="/EditPassword")
	public ModelAndView EditPassword(int userID,String oldPassword,String newPassword) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		User user = new User();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			user = userMapper.checkPassword(userID, oldPassword);
			if(user!=null) {
				userMapper.editPassword(userID, newPassword);
				sqlSession.commit();
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		if(user==null) {
			mv.addObject("message", "提示：原密码不正确");
			mv.setViewName("one/person/password.jsp");
		}
		else if(user!=null) {
			mv.addObject("message", "提示：密码已修改");
			mv.addObject("status", '1');
			mv.setViewName("one/person/password.jsp");
		}
		return mv;
	}
}
