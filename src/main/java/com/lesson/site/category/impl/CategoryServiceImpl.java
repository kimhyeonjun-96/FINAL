package com.lesson.site.category.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lesson.site.Class.GetAllClass;
import com.lesson.site.category.CategoryService;
import com.lesson.site.category.CategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	CategoryDAO categoryDAO;
	
	
	
	
	//카테고리들 가져오기
	@Override
	public List<CategoryVO> getCategoryList() {
		System.out.println("CategoryServiceImpl getCategorList 실행");
		return categoryDAO.getCategoryList();
	}
	
	
	//특정 카테고리 가져오기
	@Override
	public CategoryVO getCategory(String c_code) {
		//return categoryDAO.getCategory(c_code);
		return null;
	}


	@Override
	public List<GetAllClass> getCategoryList01() {
		return categoryDAO.getCategoryList01();
	}


	@Override
	public List<GetAllClass> getCategoryList02() {
		return categoryDAO.getCategoryList02();
	}


	@Override
	public List<GetAllClass> getCategoryList03() {
		return categoryDAO.getCategoryList03();
	}


	@Override
	public List<GetAllClass> getCategoryList04() {
		return categoryDAO.getCategoryList04();
	}


	@Override
	public List<GetAllClass> getCategoryList05() {
		return categoryDAO.getCategoryList05();
	}
	
}












