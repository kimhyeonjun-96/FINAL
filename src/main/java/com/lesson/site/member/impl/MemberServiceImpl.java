package com.lesson.site.member.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.lesson.site.member.MemberService;
import com.lesson.site.member.MemberVO;
import com.lesson.site.tutor.TutorVO;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO memberDAO;
	@Inject
    private JavaMailSender mailSender;

	//일반 회원 로그인
	@Override
	public MemberVO loginMember(String nickname, String pw) {
		System.out.println("MemberServiceImpl 객채의 로그인 함수 실행");
		MemberVO loginMember = memberDAO.loginMember(nickname,pw);
		System.out.println("loginMember : " + loginMember);
		return loginMember;
	}
	//일반회원 로그인 시 아이디 확인
	@Override
	public String getMemberNick(String m_code) {
		return memberDAO.getMemberNick(m_code);
	}
	//일반회원 로그인 시 비밀번호 확인
	@Override
	public String getMemberPw(String m_code) {
		return memberDAO.getMemberPw(m_code);
	}
	
	
	//일반 회원 회원가입 
	@Override
	public int joinMember(MemberVO vo) throws Exception {
		System.out.println("MemberServiceImpl 객채의 회원가입 함수 실행");
		
		
		String key = new TempKey().getKey(50, false); //이메일 인증 키 만들기
		memberDAO.createAuthKey(vo.getEmail(), key); //이메일 인증 키를 이메일로 보내기
		MailHandler sendMail = new MailHandler(mailSender); 
		
		sendMail.setSubject("[홈페이지 이메일 인증]"); //메일 제목
		sendMail.setText(						  //메일 내용
				"<h1>메일인증</h1>" +
				"<a href='http://localhost:8090/site/emailConfirm.do?email=" + vo.getEmail() +
				"&key=" + key +
				"' target='_blenk'>이메일 인증 확인</a>");
		sendMail.setFrom("khjlove8427@gmail.com", "김현준"); //보내는 이
		sendMail.setTo(vo.getEmail()); // 받는 이
		sendMail.send(); //보내기
		int result = memberDAO.joinMember(vo);
		return result;
	}
	
	//호원정보 수정, 수정된 정보 가져오기
	@Override
	public MemberVO updateMember(MemberVO vo, MemberVO sessionVO) {
		System.out.println("MemberServiceImpl 객채의 회원정보수정 함수 실행");
		
		MemberVO updateMember = memberDAO.updateMember(vo,sessionVO);
		return updateMember;
	}
	//회원 탈퇴
	@Override
	public int deleteMember(String m_code) {
		System.out.println("MemberServiceImpl 객채의 회원탈퇴 함수 실행");
		return  memberDAO.deleteMember(m_code);
		
	}
	//일반 회원 중복 검사
	@Override
	public MemberVO checkNickPw(String nickname, String pw) {
		System.out.println("MemberServiceImpl 객채의 중복검사 함수 실행");
		return memberDAO.checkNickPassword(nickname, pw);
	}

//	@Override
//	public void createAuthKey(String email, String authKey) throws Exception {
//		memberDAO.createAuthKey(email, authKey);
//	}
	
	//이메일 인증 
	@Override
	public void userAuth(String email) throws Exception {
		memberDAO.userAuth(email);
	}
	
//	
//	//카카오 회원 중복 검사
//	@Override
//	public MemberVO checkKakao(String m_code) {
//		
//		return memberDAO.checkKakao(m_code);
//	}
//	//카카오 회원 첫 로그인 DB에 저장
//	@Override
//	public int kakaoJoinMember(MemberVO vo) {
//
//		return memberDAO.kakaoJoinMember(vo);
//	}
//	//카카오 회원 가져오기
//	@Override
//	public MemberVO getKakaoMember(String m_code) {
//		
//		return memberDAO.getKakaoMember(m_code);
//	}
	
	
	
	//소셯 회원
	//소셜회원 중복 검사
	@Override
	public MemberVO checkSosialMember(String m_code) {
		return memberDAO.checkSosialMember(m_code);
	}
	//소셜회원 첫 로그인 시 DB저장
	@Override
	public int sosialJoinMember(MemberVO vo) {
		return memberDAO.sosialJoinMember(vo);
	}
	//소셜 회원 정보 가져오기
	@Override
	public MemberVO getSosialMember(String m_code) {
		return memberDAO.getSosialMember(m_code);
	}
	
	
	
	//회원의 강사되기
	//강사 중복 검사
	@Override
	public TutorVO checkTutor(String m_code) {
		return memberDAO.checkTutor(m_code);
	}
	//강사등록
	@Override
	public int joinTutor(TutorVO tutorVO) {
		return memberDAO.joinTutor(tutorVO);
	}
	//회원읜 istutor컬럼 값 변경
	@Override
	public void updateIstutor(String m_code) {
		memberDAO.updateIstutor(m_code);
	}
	//튜터정보 가져오기
	@Override
	public TutorVO getTutor(String m_code) {
		return memberDAO.getTutor(m_code);
	}
	
	//모든 회원 가져오기 -> 강사 회원만 가져와야함.
	@Override
	public List<MemberVO> getMemberList() {
		return memberDAO.getMemberList();
	}

	


}
