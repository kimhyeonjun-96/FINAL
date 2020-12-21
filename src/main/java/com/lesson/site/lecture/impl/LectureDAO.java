package com.lesson.site.lecture.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lesson.site.lecture.GetMyLectureVO;
import com.lesson.site.lecture.LectureVO;

@Repository
public class LectureDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	
	//구매한 수업 추가하기
	public int addLecture(LectureVO vo) {
		return mybatis.insert("lecture.addLecture",vo);
	}

	//전체 수강 중인 수업 가져오기
	public List<LectureVO> getMyLectureList(String m_code) {
		return mybatis.selectList("lecture.getMyLectureList", m_code);
	}
	//회원의 수강중인 강의 가져오기
	public List<GetMyLectureVO> lectureList(String m_code){
		return mybatis.selectList("lecture.lectureList" , m_code);
	}
	//회원의 특정 수강 중인 강의 가져오기
	public GetMyLectureVO lecture(String m_code) {
		return mybatis.selectOne("lecture.lecture",m_code);
	}
	//특정 수강강의 가져오기
	public LectureVO getLecture(String l_code) {
		return mybatis.selectOne("lecture.GetLecture",l_code);
	}
	//수강횟수 증가
	public void updateNumberOfLecture(String log_code) {
		mybatis.update("lecture.updateNumberOfLecture", log_code);
	}
	
}









