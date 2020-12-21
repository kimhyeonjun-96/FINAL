package com.lesson.site.history.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lesson.site.history.HistoryVO;

@Repository
public class HistoryDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	//시작시간 저장하시
	public int startAt(String l_code,String date) {
		HistoryVO vo = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("l_code", l_code);
		map.put("start_time",date);
		int result = mybatis.insert("history.startAt", map);
		return result ;
	}
	//시작시간 저장한 클래스 가져오기
	public HistoryVO getStartAtClass(String log_code) {
		return mybatis.selectOne("history.getStartAtClass",log_code);
	}
	
	//끝나는 시간 저장하기 
	public HistoryVO endAt(String log_code, String endtAt) {
		HistoryVO vo = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("log_code", log_code);
		map.put("end_time",endtAt);
		int result = mybatis.insert("history.endAt", map);
		
		if(result > 0) {
			vo = mybatis.selectOne("history.getUpdateHistory", log_code);
			System.out.println("vo.getLog_code-2 : " + vo.getLog_code());
			System.out.println("vo.getL_code-2 : " + vo.getL_code());
			System.out.println("vo.getStart_time-2 : " + vo.getstart_study_time());
			System.out.println("vo.getEnd_time-2 : " + vo.getend_study_time());
		}
		
		return vo;
	}
	public List<HistoryVO> getHistroyList() {
		return mybatis.selectList("history.getHistroyList");
	}
	
	
	
	
	
}
