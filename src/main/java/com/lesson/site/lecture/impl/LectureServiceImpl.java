package com.lesson.site.lecture.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lesson.site.lecture.GetMyLectureVO;
import com.lesson.site.lecture.LectureService;
import com.lesson.site.lecture.LectureVO;

@Service
public class LectureServiceImpl implements LectureService{
	
	@Autowired
	LectureDAO lectureDAO;
	
	//수업 추가하기
	@Override
	public int addLecture(LectureVO vo) {
		return lectureDAO.addLecture(vo);
	}
	
	//내가 수강 중인 수업 가져오기

	@Override
	public List<LectureVO> getMyLectureList(String m_code) {
		return lectureDAO.getMyLectureList(m_code);
	}

	@Override
	public List<GetMyLectureVO> lectureList(String m_code) {
		return lectureDAO.lectureList(m_code);
	}

	@Override
	public GetMyLectureVO lecture(String m_code) {
		return lectureDAO.lecture(m_code);
	}
	
	//특정 수강중인 강의 가져오기
	public LectureVO getLecture(String l_code) {
		return lectureDAO.getLecture(l_code);
	}
	//수강횟수 수정
	@Override
	public void updateNumberOfLecture(String log_code) {
		lectureDAO.updateNumberOfLecture(log_code);
	}
	
}
