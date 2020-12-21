package com.lesson.site.category.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lesson.site.Class.GetAllClass;
import com.lesson.site.category.CategoryVO;

@Repository
public class CategoryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	//카테고리들 가져오기
	public List<CategoryVO> getCategoryList(){
		System.out.println("CategoryDAO getCategorList() 함수 실행");
		//List<CategoryVO> list = mybatis.selectList("category.getCategoryList");
		//System.out.println("CategoryDAO 카테고리들 가져오기 : " + list);
		
		return mybatis.selectList("category.getCategoryList");
	}
	public List<GetAllClass> getCategoryList01() {
		return mybatis.selectList("category.getCategory01");
	}
	public List<GetAllClass> getCategoryList02() {
		return mybatis.selectList("category.getCategory02");
	}
	public List<GetAllClass> getCategoryList03() {
		return mybatis.selectList("category.getCategory03");
	}
	public List<GetAllClass> getCategoryList04() {
		return mybatis.selectList("category.getCategory04");
	}
	public List<GetAllClass> getCategoryList05() {
		return mybatis.selectList("category.getCategory05");
	}
	
}











