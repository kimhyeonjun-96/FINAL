package com.lesson.site.member.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lesson.site.member.MemberVO;
import com.lesson.site.tutor.TutorVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//회원가입시 아이디, 비밀번호 중복 검사...비밀번호는 안해도 될 것 같다! 아냐!! 해야해해해ㅐ해해해해
	public MemberVO checkNickPassword(String nickname, String pw) {
		System.out.println("MemberDAO 객체의 중복검사 확인 함수 실행 - 1");
		System.out.println("nickname : " + nickname);
		String nickname_dao = nickname;
		MemberVO vo = mybatis.selectOne("checkNickPassword", nickname_dao);
		System.out.println("MemberDAOd의 vo: " + vo);
		return vo;
	}
	
	//회원가입
	public int joinMember(MemberVO vo) {
		
		return mybatis.insert("member.joinMember", vo);
	}
	
	//로그인 
	public MemberVO loginMember(String nickname, String pw) { 
		System.out.println("MemberDAO nickname : " + nickname);
		System.out.println("MemberDAO pw : " + pw);
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickname", nickname);
		map.put("pw", pw);
		MemberVO loginMember = mybatis.selectOne("member.loginMember", map);
		
		System.out.println("loginMember: " + loginMember);
		return loginMember; 
	}
	//로그인 시 닉네임 확인
	public String getMemberNick(String m_code) {
		return mybatis.selectOne("member.getMemberNick", m_code);
	}
	//로그인 시 비번 확인
	public String getMemberPw(String m_code) {
		return mybatis.selectOne("member.getMemberPw", m_code);
	}
	
	
	//이메일 인증을 위한 DAO처리
	public void createAuthKey(String email, String authKey) throws Exception { // 인증키 DB에 넣기
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("email", email);
		map.put("authKey", authKey);

		mybatis.insert("member.createAuthKey", map);
	}
	//이메일 인증 여부 확인시 변경처리
	public void userAuth(String email) throws Exception { // 인증키 일치시 DB칼럼(인증여부) false->true 로 변경
		mybatis.update("member.memberAuth", email);
	}

	//회원정보 수정
	public MemberVO updateMember(MemberVO vo, MemberVO sessionVO) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_code", sessionVO.getM_code());
		map.put("pw", vo.getPw());
		map.put("email",vo.getEmail());
		mybatis.update("member.updateMember", map); //회원정보 수정
		MemberVO updateMemberVO = mybatis.selectOne("member.getUpdateMember",sessionVO.getM_code()); //수정된 회원정보 가져오기
		return updateMemberVO;
	}
	//회원 탈퇴
	public int deleteMember(String m_code) {
		
		return mybatis.delete("member.deleteMember", m_code);
		
	}
	
	
	
//	//카카오 회원 중복 검사
//	public MemberVO checkKakao(String m_code) {
//		MemberVO vo = mybatis.selectOne("member.checkKakao", m_code);
//		System.out.println("MemberDAO checkKakao vo : " + vo);
//		return vo;
//	}
//	//카카오 회원 첫 로그인 시 DB저장
//	public int kakaoJoinMember(MemberVO vo) {
//		
//		return mybatis.insert("member.kakaoJoinMember", vo);
//	}
//	//카카오 회원 가져오기
//	public MemberVO getKakaoMember(String m_code) {
//		return mybatis.selectOne("member.getKakaoMember",m_code);
//	}
//	
//	
//	//네이버 회원 중복 검사
//	public MemberVO checkNaver(String m_code) {
//		MemberVO vo = mybatis.selectOne("member.checkNaver",m_code);
//		System.out.println("MemberDAO checkNaver : " + vo);
//		return vo;
//	}
	
	//소셜회원 중복 검사
	public MemberVO checkSosialMember(String m_code) {
		MemberVO vo = mybatis.selectOne("member.checkSosialMember", m_code);
		System.out.println("MemberDAO checkSosialMember vo : " + vo);
		return vo;
	}
	//소셜 회원 첫 로그인 시 DB저장
	public int sosialJoinMember(MemberVO vo) {
		
		return mybatis.insert("member.sosialJoinMember", vo);
	}
	//소셜 회원 가져오기
	public MemberVO getSosialMember(String m_code) {
		return mybatis.selectOne("member.getSosialMember",m_code);
	}
	
	
	//회원의 강사되기
	//강사 등록 전 중복 검사
	public TutorVO checkTutor(String m_code) {
		return mybatis.selectOne("member.checkTutor", m_code);
	}
	//강사 등록
	public int joinTutor(TutorVO tutorVO) {
		return mybatis.insert("member.joinTutor", tutorVO);
	}
	//호원 istutor값 변경
	public void updateIstutor(String m_code) {
		mybatis.update("member.updateIstutor",m_code);
	}
	//튜터 정보 가져오기
	public TutorVO getTutor(String m_code) {
		return mybatis.selectOne("member.getTutor",m_code);
	}
	
	//모든 회원 가져오기
	public List<MemberVO> getMemberList() {
		return mybatis.selectList("member.getMemberList");
	}

	
	
	
	
}
