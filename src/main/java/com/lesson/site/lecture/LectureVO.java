package com.lesson.site.lecture;

public class LectureVO {
	
	private String l_code;
	private String m_code;
	private String s_code;
	private String total_price;
	private int numberOfLecture;
	
	public LectureVO() {}

	public LectureVO(String l_code, String m_code, String s_code, String total_price,
			int numberOfLecture) {
		super();
		this.l_code = l_code;
		this.m_code = m_code;
		this.s_code = s_code;
		this.total_price = total_price;
		this.numberOfLecture = numberOfLecture;
	}
	
	public String getL_code() {
		return l_code;
	}
	public void setL_code(String l_code) {
		this.l_code = l_code;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public String getS_code() {
		return s_code;
	}
	public void setS_code(String s_code) {
		this.s_code = s_code;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public int getNumberOfLecture() {
		return numberOfLecture;
	}
	public void setNumberOfLecture(int numberOfLecture) {
		this.numberOfLecture = numberOfLecture;
	}

	@Override
	public String toString() {
		return "LectureVO [l_code=" + l_code + ", m_code=" + m_code + ", s_code=" + s_code + ", listen_time="
				+ ", total_price=" + total_price + ", numberOfLecture=" + numberOfLecture + "]";
	}
	
	
}
