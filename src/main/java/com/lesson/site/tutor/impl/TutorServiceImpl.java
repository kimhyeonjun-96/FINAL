package com.lesson.site.tutor.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lesson.site.Class.ClassVO;
import com.lesson.site.tutor.TutorService;
import com.lesson.site.tutor.TutorVO;

@Service
public class TutorServiceImpl implements TutorService {
	
	@Autowired
	TutorDAO tutorDAO;
	
	//튜터
	//튜터 정보 가져오기
	@Override
	public TutorVO getTutor(String t_code) {
		return tutorDAO.getTutor(t_code);
	}
	// 튜터정보 수정
	@Override
	public TutorVO updateTutor(TutorVO vo, TutorVO sessionvo) {
		return tutorDAO.updateTutor(vo, sessionvo);
	}
	// 튜터 정보 삭제
	@Override
	public int deleteTutor(String t_code) {
		return tutorDAO.deleteTutor(t_code);
	}
	//모든 튜터 가져오기
	@Override
	public List<TutorVO> getTutorList() {
		return tutorDAO.getTutorList();
	}
	
	//강의
	//강의 등록 하기.
	@Override
	public int addClass(ClassVO vo) {
		return tutorDAO.addClass(vo);
	}
	//내 강의 전체 조회하기
	@Override
	public List<ClassVO> getClassList(String t_code) {
		return tutorDAO.getClassList(t_code);
	}
	//내 특정 강의 삭제하기
	@Override
	public void deleteClass(String s_code) {
		tutorDAO.deleteClass(s_code);
	}
	//내 특정 강의 수정하기
	@Override
	public void modifyClass(ClassVO vo) {
		tutorDAO.modifyClass(vo);
	}
	//내 특정 강의 가져오기
	@Override
	public ClassVO getClassOne(String s_code) {
		return tutorDAO.getClassOne(s_code);
	}
	
	

	
	
	
	
	
}








