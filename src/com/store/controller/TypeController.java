package com.store.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.store.mapper.TypeMapper;
import com.store.pojo.Type;
import com.store.utils.SqlSessionFactoryUtils;

@Controller
public class TypeController {
	@RequestMapping(value="/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		SqlSession sqlSession = null;
		List<Type> fatherTypes = new ArrayList<Type>();
		List<Type> childTypes = new ArrayList<Type>();
		List<Type> secondChildTypes = new ArrayList<Type>();
		int countFatherTypes = 0;
		int firstparam = 0;
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
		mv.addObject("firstparam", firstparam);
		mv.setViewName("/one/home/home.jsp");
		return mv;
	}
}
