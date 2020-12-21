package com.lesson.site.category;

import java.util.List;

import com.lesson.site.Class.GetAllClass;

public interface CategoryService {
	
	//카테고리 등록 -- 이건 관리자에서 할 일! 그렇지만 우린 관리자가 없지옙! 몰랑~
	
	//카테고리 전체 리스트 가져오기
	public List<CategoryVO> getCategoryList();
	//특정 카테고리 가져오기
	public CategoryVO getCategory(String c_doe);
	//카테고리별 이름 전체 가져오기
	//카테고리별 특정 이름  가져오기
	
	
	//카테고리별 강의리스트 가져오기
	public List<GetAllClass> getCategoryList01();
	public List<GetAllClass> getCategoryList02();
	public List<GetAllClass> getCategoryList03();
	public List<GetAllClass> getCategoryList04();
	public List<GetAllClass> getCategoryList05();
}







