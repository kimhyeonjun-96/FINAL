package com.lesson.site.member;

public class MemberVO {
	
	private String m_code; //회원코드
	private String nickname; //닉네임
	private String pw; //비밀번호
	private String email; //이메일
	private boolean istutor; //강사여부 '0' 이면 아님, '1'이면 강사임
	private boolean memberCertification; // 이메일 인증 여부 '0' 이면 인증X, '1'이면 인증 O
	
	
	
	public boolean isCheckEmaile() {
		return memberCertification;
	}

	public void setCheckEmaile(boolean memberCertification) {
		this.memberCertification = memberCertification;
	}



	public MemberVO() {} // 프레임워크는 기본 생성자 없이는 작동하지 않는다.



	public MemberVO(String m_code, String nickname, String pw, String email, boolean istutor) {
		super();
		this.m_code = m_code;
		this.nickname = nickname;
		this.pw = pw;
		this.email = email;
		this.istutor = istutor;
	}



	public String getM_code() {
		return m_code;
	}



	public void setM_code(String m_code) {
		this.m_code = m_code;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getPw() {
		return pw;
	}



	public void setPw(String pw) {
		this.pw = pw;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public boolean isIstutor() {
		return istutor;
	}



	public void setIstutor(boolean istutor) {
		this.istutor = istutor;
	}



	@Override
	public String toString() {
		return "MemberVO [m_code=" + m_code + ", nickname=" + nickname + ", pw=" + pw + ", email=" + email
				+ ", istutor=" + istutor + ", memberCertification=" + memberCertification + "]";
	}
	
	
	
	
	
}
