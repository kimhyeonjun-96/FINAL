package com.lesson.site.tutor.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lesson.site.Class.ClassVO;
import com.lesson.site.tutor.TutorVO;

@Repository
public class TutorDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//강사 정보 가져오기
	public TutorVO getTutor(String t_code) {
		return mybatis.selectOne("tutor.getTutor",t_code);
	}
	//모든 강사 가져오기
	public List<TutorVO> getTutorList() {
		return mybatis.selectList("tutor.getTutorList");
	}
	
	//강사 정보 수정
	public TutorVO updateTutor(TutorVO tvo, TutorVO sessionvo) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("career", tvo.getCareer());
		map.put("introduction", tvo.getintroduction());
		map.put("t_code", sessionvo.getT_code());
		
		mybatis.update("tutor.updateTutor", map);
		TutorVO vo = mybatis.selectOne("tutor.getTutor", sessionvo.getT_code());
		
		return vo;
	}
	
	//강사 탈퇴
	public int deleteTutor(String t_code) {
		return mybatis.delete("tutor.deleteTutor", t_code);
	}
	
	//강의 등록하기 
	public int addClass(ClassVO vo) {
		int result = mybatis.insert("tutor.addClass", vo);
		
		return result;
	}
	
	//강의 전체 조회
	public List<ClassVO> getClassList(String t_code) {
		return mybatis.selectList("tutor.getClassList", t_code);
	}
	//내 특정강의 삭제
	public void deleteClass(String s_code) {
		mybatis.delete("tutor.deleteClass", s_code);
	}
	//내 특정강의 수정
	public void modifyClass(ClassVO vo) {
		mybatis.update("tutor.modifyClass", vo);
	}
	//내 특정 강의 가져오기
	public ClassVO getClassOne(String s_code) {
		return mybatis.selectOne("tutor.getClassOne", s_code);
	}
	

	

}
