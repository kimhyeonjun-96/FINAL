package com.lesson.site.history.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lesson.site.history.HistoryService;
import com.lesson.site.history.HistoryVO;

@Service
public class historyServiceImpl implements HistoryService{
	
	@Autowired
	HistoryDAO historyDAO;
	
	//시작 시간 저장하기
	@Override
	public int startAt(String l_code, String date) {
		return historyDAO.startAt(l_code, date);
	}
	//시작 시간 저장한 클래스 가져오기
	@Override
	public HistoryVO getStartAtClass(String log_code) {
		return historyDAO.getStartAtClass(log_code);
	}
	
	//끝나는 시간 저장하기
	@Override
	public HistoryVO endAt(String log_code, String endtAt) {
		return historyDAO.endAt(log_code, endtAt);
	}
	//전체 기록 가져오기
	@Override
	public List<HistoryVO> getHistroyList() {
		return historyDAO.getHistroyList();
	}
	

}
