package com.lesson.site.member;

import java.util.List;

import com.lesson.site.tutor.TutorVO;

public interface MemberService {
	
	// 일반 회원
	MemberVO loginMember(String nickname, String pw); //로그인
	int joinMember(MemberVO vo) throws Exception; //회원가입
	MemberVO updateMember(MemberVO vo, MemberVO sessionVO); //회원정보 수정
	int deleteMember(String m_code); //회원탈퇴
	MemberVO checkNickPw(String nickname, String pw); //회원 중복 검사
	void userAuth(String email) throws Exception;// 이메일 인증이 완료시 인증여부를 바꾸기
	String getMemberNick(String m_code); //로그인 시 닉네임값을 확인
	String getMemberPw(String m_code); //로그인 시 비밀번호값을 확인
	
	//소셜회원 
	MemberVO checkSosialMember(String m_code); // 소셜회원 중복 검사 
	int sosialJoinMember(MemberVO vo); // 소셜 회원 첫 로그인 시 DB저장
	MemberVO getSosialMember(String m_code); //소셜회원 정보 가져오기

	//강사되기
	TutorVO checkTutor(String m_code); //튜터 중복 검사
	int joinTutor(TutorVO tutorVO); //튜터 등록
	void updateIstutor(String m_code); //회원의 istutor 컬럼값 변경 '0' -> '1'
	TutorVO getTutor(String m_code); //튜터 정보 가져오기
	
	//회원
	List<MemberVO> getMemberList();  // 모든 회원 가져오기 -> 강사회원만 가져와야 하는데...잘못함
}








