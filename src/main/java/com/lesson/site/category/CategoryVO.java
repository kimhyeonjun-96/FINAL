package com.lesson.site.category;

public class CategoryVO {
	
	private String c_code;
	private String category_name;
	

	public CategoryVO() {}

	public CategoryVO(String c_code, String category_name) {
		this.c_code = c_code;
		this.category_name = category_name;
	}
	
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	@Override
	public String toString() {
		return "CategoryVO [c_code=" + c_code + ", category_name=" + category_name + "]";
	}

}








