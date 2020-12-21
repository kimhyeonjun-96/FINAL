package com.lesson.site.tutor;

public class TutorVO {
	
	private String t_code;
	private String m_code;
	private String career;
	private String introduction;
	
	
	
	public TutorVO() {}

	public TutorVO(String t_code, String m_code, String career, String introduction) {
		super();
		this.t_code = t_code;
		this.m_code = m_code;
		this.career = career;
		this.introduction = introduction;
	}

	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getintroduction() {
		return introduction;
	}

	public void setintroduction(String introduction) {
		this.introduction = introduction;
	}

	@Override
	public String toString() {
		return "TutorVO [t_code=" + t_code + ", m_code=" + m_code + ", career=" + career + ", introduction="
				+ introduction + "]";
	}
	

	
}
















