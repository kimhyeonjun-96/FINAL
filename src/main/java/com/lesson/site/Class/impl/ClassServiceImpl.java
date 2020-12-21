package com.lesson.site.Class.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lesson.site.Class.ClassService;
import com.lesson.site.Class.ClassVO;
import com.lesson.site.Class.GetAllClass;
import com.lesson.site.member.MemberVO;
import com.lesson.site.tutor.TutorVO;

@Service
public class ClassServiceImpl implements ClassService{
	
	@Autowired
	ClassDAO classDAO;
	
	//모든 클래스 검색
	@Override
	public List<ClassVO> searchAllClass() {
		
		return classDAO.searchAllClass();
	}
	//모든 클래스 검색 조인문
	@Override
	public List<GetAllClass> getAllClass() {
		return classDAO.getAllClass();
	}
	
	

	/*
		특정 강의공고 보러가기
	*/
	//회원 값 가지고 오기
	@Override
	public MemberVO searchMember(String s_code) {
		return classDAO.searchMember(s_code);
	}
	//강사 값 가지고 오기
	@Override
	public TutorVO searchTutor(String s_code) {
		return classDAO.searchTutor(s_code);
	}
	//강의 값 가져오기
	public ClassVO searchClass(String s_code) {
		return classDAO.searchClass(s_code);
	}

	
	
	
}
