package com.lesson.site.tutor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.lesson.site.Class.ClassVO;

public interface TutorService {
	
	/*튜터*/
	TutorVO updateTutor(TutorVO vo ,TutorVO sessionvo); //강사 정보 수정
	TutorVO getTutor(String t_code); //강사 정보 가져오기
	List<TutorVO> getTutorList(); //모든 강사 가져오기
	
	//강사의 강의 
	//특정 강의만 조회
	int addClass(ClassVO vo); //강의 등록
	List<ClassVO> getClassList(String t_code);//내 강의 전체 조회
	void modifyClass(ClassVO vo); //강의 정보 수정
	void deleteClass(String s_code); //강의 삭제
	ClassVO getClassOne(String s_code);//내 특정 강의 조회
	int deleteTutor(String t_code); //강사 그만하기 
	
	
	
	
	
	
}
