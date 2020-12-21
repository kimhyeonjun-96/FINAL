package com.lesson.site.Class;

import java.util.List;

import com.lesson.site.member.MemberVO;
import com.lesson.site.tutor.TutorVO;

public interface ClassService {
	
	//모든 강의 보기
	List<ClassVO> searchAllClass();
	//모든 강의 보기 조인문
	List<GetAllClass> getAllClass();
	//분야별 강의 보기
	/*특정강의공고 보러가기*/
		//회원 값 가져오기
	MemberVO searchMember(String s_code);
		//강사 값 가져오기
	TutorVO searchTutor(String s_code);
		//강의 값 가져오기
	ClassVO searchClass(String s_code);
	
}
