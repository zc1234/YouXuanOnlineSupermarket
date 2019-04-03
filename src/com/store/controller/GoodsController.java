package com.store.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.store.mapper.CommentMapper;
import com.store.mapper.GoodsMapper;
import com.store.mapper.TypeMapper;
import com.store.mapper.UserMapper;
import com.store.pojo.Comment;
import com.store.pojo.Goods;
import com.store.pojo.GoodsParams;
import com.store.pojo.Type;
import com.store.pojo.User;
import com.store.utils.Paging;
import com.store.utils.SqlSessionFactoryUtils;

@Controller
public class GoodsController {
	@RequestMapping(value="/search")
	public ModelAndView search(String goodsname,int CurrentPage) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Goods> goodsList = new ArrayList<Goods>();
		Paging<Goods> paging = new Paging<Goods>();
		List<Goods> goodsPagingList = new ArrayList<Goods>();
		int count = 0;
		int pageSize = 12;
		int index = 0;
		paging.setPageSize(pageSize);
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			count = goodsMapper.countSearchResults(goodsname);
			goodsList = goodsMapper.searchGoods(goodsname);
			paging.setCurrentPage(CurrentPage);
			paging.setTotalRecords(count);
			index = (CurrentPage-1) * pageSize;
			paging.setIndex(index);
			goodsPagingList = goodsMapper.goodsPaging(goodsname, paging);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("goodsname",goodsname);
		mv.addObject("goodsList",goodsList);
		mv.addObject("goodsPagingList",goodsPagingList);
		mv.addObject("count",count);
		mv.addObject("number",paging.getTotalPages());
		mv.setViewName("/one/home/search.jsp");
		return mv;
	}
	@RequestMapping(value="/searchByType")
	public ModelAndView searchByType(int typeID,int CurrentPage) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Goods> goodsList = new ArrayList<Goods>();
		List<Goods> goodsPagingList = new ArrayList<Goods>();
		List<Type> childTypes = new ArrayList<Type>();
		Type fatherType = new Type();
		Paging<Goods> paging = new Paging<Goods>();
		int count = 0;
		int pageSize = 12;
		int index = 0;
		paging.setPageSize(pageSize);
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			childTypes = goodsMapper.istherechildtypes(typeID);
			if(childTypes.size()==0) {
				count = goodsMapper.countSearchGoodsByTypeResults(typeID);
				goodsList = goodsMapper.searchGoodsByType(typeID);
				paging.setCurrentPage(CurrentPage);
				paging.setTotalRecords(count);
				index = (CurrentPage-1) * pageSize;
				paging.setIndex(index);
				goodsPagingList = goodsMapper.goodsByTypePaging(typeID, paging);
			}
			else {
				List<Type> typelist=new ArrayList<Type>();
				fatherType = goodsMapper.istherefathertype(typeID);
				if(fatherType.getTypeLast()==0) {
					for(int i=0;i<childTypes.size();i++) {
						List<Type> secondChildTypes = new ArrayList<Type>();
						secondChildTypes = goodsMapper.istherechildtypes(childTypes.get(i).getTypeID());
						for(int j=0;j<secondChildTypes.size();j++) {
							typelist.add(secondChildTypes.get(j));
						}
					}
				}
				else {
					for(int i=0;i<childTypes.size();i++) {
						typelist.add(childTypes.get(i));
					}
				}
				for(int i=0;i<typelist.size();i++) {
					System.out.println(typelist.get(i).getTypeID()+" ");
				}
				count = goodsMapper.countSearchGoodsByMultipleTypes(typelist);
				goodsList = goodsMapper.searchGoodsByMultipleTypes(typelist);
				paging.setCurrentPage(CurrentPage);
				paging.setTotalRecords(count);
				index = (CurrentPage-1) * pageSize;
				paging.setIndex(index);
				goodsPagingList = goodsMapper.goodsPagingByMultipleTypes(typelist, paging);
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("goodsList",goodsList);
		mv.addObject("goodsPagingList",goodsPagingList);
		mv.addObject("count",count);
		mv.addObject("number",paging.getTotalPages());
		mv.setViewName("/one/home/search.jsp");
		return mv;
	}
	@RequestMapping(value="/detail")
	public ModelAndView detail(int goodsID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Goods goods = new Goods();
		List<Comment> commentlist = new ArrayList<Comment>();
		float avg = 0;		//综合评分
		int sum = 0;		//评论数
		int good = 0;		//好评数
		int normal = 0;		//中评数
		int bad = 0;		//差评数
		int sale = 0;		//累计销量
		int salenum = 0;
		int monthsale = 0;	//月销量
		int monthsalenum = 0;
		float price = 0;
		float originalprice = 0;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			goods = goodsMapper.searchGoodsByID(goodsID);
			price = goods.getGoodsPrice();
			originalprice = goods.getGoodsOriginalPrice();
			sum = goodsMapper.getCommentNumberSum(goodsID);
			if(sum!=0) {
				avg = goodsMapper.getGoodsAvgPoints(goodsID);
			}
			good = goodsMapper.getCommentNumber(goodsID, 5);
			normal = goodsMapper.getCommentNumber(goodsID, 3);
			bad = goodsMapper.getCommentNumber(goodsID, 1);
			salenum = goodsMapper.getGoodsSaleNumber(goodsID);
			if(salenum!=0) {
				sale = goodsMapper.getGoodsSale(goodsID);
			}
			monthsalenum = goodsMapper.getMonthGoodsSaleNumber(goodsID);
			if(monthsalenum != 0) {
				monthsale = goodsMapper.getMonthGoodsSale(goodsID);
			}
			CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
			commentlist = commentMapper.findCommentByGoodsID(goodsID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("goods",goods);
		mv.addObject("avg",avg);
		mv.addObject("sum",sum);
		mv.addObject("good",good);
		mv.addObject("normal",normal);
		mv.addObject("bad",bad);
		mv.addObject("price", price);
		mv.addObject("originalprice", originalprice);
		mv.addObject("monthsale", monthsale);
		mv.addObject("sale", sale);
		mv.addObject("commentlist", commentlist);
		mv.setViewName("one/home/introduction.jsp");
		return mv;
	}
	@RequestMapping(value="/BackGoods")
	public ModelAndView BackGoods(int CurrentPage,int param) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Goods> goodsList = new ArrayList<Goods>();
		Paging<Goods> paging = new Paging<Goods>();
		int count = 0;
		int pageSize = 8;
		int index = 0;
		paging.setPageSize(pageSize);
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			if(param==3)
				count = goodsMapper.countAllGoods();
			else
				count = goodsMapper.countSomeGoods(param);
			paging.setCurrentPage(CurrentPage);
			paging.setTotalRecords(count);
			index = (CurrentPage-1) * pageSize;
			paging.setIndex(index);
			if(param==3)
				goodsList = goodsMapper.showAllGoods(paging);
			else
				goodsList = goodsMapper.showSomeGoods(param, paging);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("goodsList",goodsList);
		mv.addObject("param",param);
		mv.addObject("number",paging.getTotalPages());
		mv.setViewName("background/manage/BackGoods.jsp");
		return mv;
	}
	@RequestMapping(value="/DeleteGoods")
	public ModelAndView DeleteGoods(int goodsID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			goodsMapper.deleteGoods(goodsID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("BackGoods?CurrentPage=1&param=3");
		return mv;
	}
	@RequestMapping(value="/RecoverGoods")
	public ModelAndView RecoverGoods(int goodsID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			goodsMapper.recoverGoods(goodsID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("BackGoods?CurrentPage=1&param=3");
		return mv;
	}
	@RequestMapping(value="/BackGoodsPage")
	public ModelAndView BackGoodsPage() {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Type> fatherTypes = new ArrayList<Type>();
		List<Type> childTypes = new ArrayList<Type>();
		List<Type> secondChildTypes = new ArrayList<Type>();
		int countFatherTypes = 0;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			TypeMapper typeMapper = sqlSession.getMapper(TypeMapper.class);
			fatherTypes = typeMapper.getFatherTypes();
			countFatherTypes = typeMapper.countFatherTypes();
			for(int i=0;i<fatherTypes.size();i++) {
				int fatherTypesID = fatherTypes.get(i).getTypeID();
				childTypes = typeMapper.getChildTypes(fatherTypesID);
				fatherTypes.get(i).setChildTypes(childTypes);
				for(int j=0;j<childTypes.size();j++) {
					int childTypesID = childTypes.get(j).getTypeID();
					secondChildTypes = typeMapper.getChildTypes(childTypesID);
					childTypes.get(j).setChildTypes(secondChildTypes);
				}
			}
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("fatherTypes", fatherTypes);
		mv.addObject("countFatherTypes", countFatherTypes);
		mv.addObject("childTypes",childTypes);
		mv.setViewName("background/manage/BackGoodsAdd.jsp");
		return mv;
	}
	@RequestMapping(value="/BackGoodsUpdatePricePage")
	public ModelAndView BackGoodsUpdatePricePage(int goodsID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Goods goods = new Goods();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper =sqlSession.getMapper(GoodsMapper.class);
			goods = goodsMapper.searchGoodsByID(goodsID);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("goods",goods);
		mv.setViewName("background/manage/BackGoodsUpdatePrice.jsp");
		return mv;
	}
	@RequestMapping(value="/BackGoodsRecoverPrice")
	public ModelAndView BackGoodsRecoverPrice(int goodsID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Goods goods = new Goods();
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper =sqlSession.getMapper(GoodsMapper.class);
			goods = goodsMapper.searchGoodsByID(goodsID);
			goodsMapper.recoverPrice(goods.getGoodsOriginalPrice(), goodsID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("BackGoods?CurrentPage=1&param=3");
		return mv;
	}
	@RequestMapping(value="/BackGoodsUpdatePrice")
	public ModelAndView BackGoodsUpdatePrice(int goodsID,float goodsNewPrice) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Goods goods = new Goods();
		float goodsOriginalPrice = 0;
		float goodsPrice = goodsNewPrice;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper =sqlSession.getMapper(GoodsMapper.class);
			goods = goodsMapper.searchGoodsByID(goodsID);
			if(goods.getGoodsStatus()!='2') {
				goodsOriginalPrice = goods.getGoodsPrice();
				goodsMapper.updatePrice(goodsPrice, goodsOriginalPrice, goodsID);
			}
			else {
				int goodsScore = (int) goodsNewPrice;
				goodsMapper.updateScore(goodsScore, goodsID);
			}
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("BackGoods?CurrentPage=1&param=3");
		return mv;
	}
	@RequestMapping(value="/GoodsAdd")
	public ModelAndView GoodsAdd(MultipartFile file,GoodsParams goodsParams) {
		ModelAndView mv = new ModelAndView();
		Goods goods = new Goods();
		String goodsName = goodsParams.getGoodsName();
		float goodsPrice = Float.parseFloat(goodsParams.getGoodsPrice());
		int goodsType = goodsParams.getGoodsType();
		int goodsStock = Integer.parseInt(goodsParams.getGoodsStock());
		char goodsStatus = goodsParams.getGoodsStatus();
		String goodsDetail = goodsParams.getGoodsDetail();
		mv.setView(new MappingJackson2JsonView());
		String fileName = "C:\\Users\\淳\\eclipse-workspace\\Test\\WebContent\\GoodsImg\\" + file.getOriginalFilename();
		file.getContentType();
		File dest = new File(fileName);
		String goodsImg = null;
		try {
			file.transferTo(dest);
			mv.addObject("success",true);
			mv.addObject("message","上传文件成功");
			goodsImg = "GoodsImg/" + file.getOriginalFilename();
		} catch (IllegalStateException | IOException e) {
			mv.addObject("success",false);
			mv.addObject("message","上传文件失败");
		}
		goods.setGoodsName(goodsName);
		goods.setGoodsPrice(goodsPrice);
		goods.setGoodsStatus(goodsStatus);
		goods.setGoodsStock(goodsStock);
		goods.setGoodsImg(goodsImg);
		goods.setGoodsType(goodsType);
		goods.setGoodsDetail(goodsDetail);
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			if(goodsStatus=='2')
				goodsMapper.insertScoreGoods(goods);
			else
				goodsMapper.insertGoods(goods);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("BackGoodsPage");
		return mv;
	}
	@RequestMapping(value="/BackGoodsUpdatePage")
	public ModelAndView BackGoodsUpdatePage(int goodsID) {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		Goods goods = new Goods();
		String filename = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper =sqlSession.getMapper(GoodsMapper.class);
			goods = goodsMapper.searchGoodsByID(goodsID);
			filename = goods.getGoodsImg().substring(9);
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.addObject("goods",goods);
		mv.addObject("filename", filename);
		mv.setViewName("BackGoodsPage");
		return mv;
	}
	@RequestMapping(value="/GoodsUpdate")
	public ModelAndView GoodsUpdate(MultipartFile file,GoodsParams goodsParams,int goodsID) {
		ModelAndView mv = new ModelAndView();
		Goods goods = new Goods();
		String goodsImg = null;
		String goodsName = goodsParams.getGoodsName();
		String goodsPrice = goodsParams.getGoodsPrice();
		String goodsStock = goodsParams.getGoodsStock();
		float price = 0;
		int stock = 0;
		if(!goodsPrice.equals(""))
			price = Float.parseFloat(goodsPrice);
		int goodsType = goodsParams.getGoodsType();
		if(!goodsStock.equals(""))
			stock = Integer.parseInt(goodsStock);
		char goodsStatus = goodsParams.getGoodsStatus();
		String goodsDetail = goodsParams.getGoodsDetail();
		if(file.getSize()!=0) {
			mv.setView(new MappingJackson2JsonView());
			String fileName = "C:\\Users\\淳\\eclipse-workspace\\Test\\WebContent\\GoodsImg\\" + file.getOriginalFilename();
			file.getContentType();
			File dest = new File(fileName);
			try {
				file.transferTo(dest);
				mv.addObject("success",true);
				mv.addObject("message","上传文件成功");
				goodsImg = "GoodsImg/" + file.getOriginalFilename();
			} catch (IllegalStateException | IOException e) {
				mv.addObject("success",false);
				mv.addObject("message","上传文件失败");
			}
		}
		goods.setGoodsID(goodsID);
		goods.setGoodsName(goodsName);
		goods.setGoodsPrice(price);
		goods.setGoodsStatus(goodsStatus);
		goods.setGoodsStock(stock);
		goods.setGoodsImg(goodsImg);
		goods.setGoodsType(goodsType);
		goods.setGoodsDetail(goodsDetail);
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			if(goodsStatus!='2')
				goodsMapper.updateGoods(goods);
			else
				goodsMapper.updateScoreGoods(goods);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("BackGoodsPage");
		return mv;
	}
	@RequestMapping(value="/addToFavorite")
	public ModelAndView addToFavorite(int userID,int goodsID) {
		ModelAndView mv = new ModelAndView();
		Goods goods = new Goods();
		SqlSession sqlSession = null;
		float price = 0;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			goods = goodsMapper.searchGoodsByID(goodsID);
			price = goods.getGoodsPrice();
			goodsMapper.addToFavorite(price, userID, goodsID);
			sqlSession.commit();
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/detail?goodsID="+goodsID);
		return mv;
	}
	@RequestMapping(value="/CreditsExchange")
	public ModelAndView CreditsExchange(int userID,int goodsID) {
		ModelAndView mv = new ModelAndView();
		Goods goods = new Goods();
		User user = new User();
		SqlSession sqlSession = null;
		try {
			sqlSession = SqlSessionFactoryUtils.openSqlSession();
			GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			goods = goodsMapper.searchGoodsByID(goodsID);
			user = userMapper.searchUserByID(userID);
			if(user.getUserScore()>=goods.getGoodsScore()) {
				goodsMapper.minusScore(goods.getGoodsScore(), userID);
				sqlSession.commit();
				mv.addObject("exchangemessage","兑换成功");
			}
			else
				mv.addObject("exchangemessage","兑换失败");
		}finally {
			if(sqlSession!=null)
				sqlSession.close();
		}
		mv.setViewName("redirect:/PersonalCenter?userID="+userID);
		return mv;
	}
}
