package com.lesson.site.pay;


public class PayVO {
	
	private String p_code;
	private String l_code;
	private String t_code;
	private String pay_time;
	

	
	public PayVO() {}
	
	public PayVO(String p_code, String l_code, String t_code, String pay_time) {
		this.p_code = p_code;
		this.l_code = l_code;
		this.t_code = t_code;
		this.pay_time = pay_time;
	}
	
	
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getL_code() {
		return l_code;
	}
	public void setL_code(String l_code) {
		this.l_code = l_code;
	}
	public String getT_code() {
		return t_code;
	}
	public void setT_code(String t_code) {
		this.t_code = t_code;
	}
	public String getPay_time() {
		return pay_time;
	}
	public void setPay_time(String String) {
		this.pay_time = String;
	}

	@Override
	public String toString() {
		return "PayVO [p_code=" + p_code + ", l_code=" + l_code + ", t_code=" + t_code + ", pay_time=" + pay_time + "]";
	}
	
	
}








