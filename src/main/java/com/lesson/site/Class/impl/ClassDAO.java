package com.lesson.site.Class.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lesson.site.Class.ClassVO;
import com.lesson.site.Class.GetAllClass;
import com.lesson.site.member.MemberVO;
import com.lesson.site.tutor.TutorVO;

@Repository
public class ClassDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	//모든 수업 검색
	public List<ClassVO> searchAllClass() {
		List<ClassVO>list = mybatis.selectList("class.searchAllClass");
		System.out.println("list" + list);
		return list;
	}
	//모든 수업 검색 조인문
	public List<GetAllClass> getAllClass() {
		return mybatis.selectList("class.getAllClass");
	}
	
	
	//특정강의 회원 갑 가져오기
	public MemberVO searchMember(String s_code) {
		return mybatis.selectOne("class.searchMember",s_code);
	}
	//특정강의 강사 값 가져오기
	public TutorVO searchTutor(String s_code) {
		return mybatis.selectOne("class.searchTutor",s_code);
	}
	//특정강의 강의 값 가져오기
	public ClassVO searchClass(String s_code) {
		return mybatis.selectOne("class.searchClass",s_code);
	}
	
	
	
	
}
