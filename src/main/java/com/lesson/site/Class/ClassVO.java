package com.lesson.site.Class;

import org.springframework.web.multipart.MultipartFile;

public class ClassVO {

	private String s_code;
	private String t_code;
	private String c_code;
	private String class_name;
	private String pay;
	private String class_plan;
	private String class_totla_number;
	private String subject_name;
	private String class_level;
	private String class_img;
	
	public ClassVO() {}

	public ClassVO(String s_code, String t_code, String c_doe, String subject_name, String class_totla_number,
			String class_plan, String pay) {
		this.s_code = s_code;
		this.t_code = t_code;
		this.c_code = c_doe;
		this.subject_name = subject_name;
		this.class_totla_number = class_totla_number;
		this.class_plan = class_plan;
		this.pay = pay;
	}

	public String getS_code() {
		return s_code;
	}

	public void setS_code(String s_code) {
		this.s_code = s_code;
	}

	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_doe) {
		this.c_code = c_doe;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public String getclass_totla_number() {
		return class_totla_number;
	}

	public void setclass_totla_number(String class_totla_number) {
		this.class_totla_number = class_totla_number;
	}

	public String getclass_plan() {
		return class_plan;
	}

	public void setclass_plan(String class_plan) {
		this.class_plan = class_plan;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getClass_level() {
		return class_level;
	}

	public void setClass_level(String class_level) {
		this.class_level = class_level;
	}
	
	public String getClass_img() {
		return class_img;
	}

	public void setClass_img(String bs) {
		this.class_img = bs;
	}

	@Override
	public String toString() {
		return "ClassVO [s_code=" + s_code + ", t_code=" + t_code + ", c_code=" + c_code + ", class_name=" + class_name
				+ ", pay=" + pay + ", class_plan=" + class_plan + ", class_totla_number=" + class_totla_number
				+ ", subject_name=" + subject_name + ", class_level=" + class_level + "]";
	}

}
