package com.lesson.site.lecture;

import java.util.List;

public interface LectureService {
	
	//음....
	/*
	    0. 수업 추가하기
		1. 전체 결제 내역 확인하기
		2. 수강 중인 강의들 확인하기
		3. 특정 수강중인 강의 가져오기;
		4. 강의 환불하기 ->그냥 "환불 신청이 되었습니다." 로 퉁 치자
		5. 강의 횟수 바꾸기
		6. 강의 듣기
	*/
	//구매 이후 내 수강테이블에 추가가 되어야 하는거!!
	int addLecture(LectureVO vo);//수강 수업 추가 
	
	//수강 중인 강의 전체 확인하기 -> 그냥 Lecture테이블 가져오기임
	List<LectureVO> getMyLectureList(String m_code);
	
	List<GetMyLectureVO> lectureList(String m_code);
	GetMyLectureVO lecture(String m_code);
	
	LectureVO getLecture(String l_code);
	
	//수강 횟수 고치기
	void updateNumberOfLecture(String log_code);
}
