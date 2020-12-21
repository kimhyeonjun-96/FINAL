package com.lesson.site.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lesson.site.category.impl.CategoryServiceImpl;
import com.lesson.site.category.CategoryVO;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryServiceImpl categoryService;
	
	@RequestMapping(value = "getCategoryList.do")
	public String  getCategoryList(Model model){
		System.out.println("getCategoryList() 실행");
		List<CategoryVO> list = categoryService.getCategoryList();
		System.out.println("list : " + list);
		
		model.addAttribute("categoryList", list);
		
		return "addClass";
	}
	
	
	
	
	
	
}











