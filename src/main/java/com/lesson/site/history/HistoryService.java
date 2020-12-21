package com.lesson.site.history;

import java.sql.Date;
import java.util.List;

public interface HistoryService {
	
	//시작 시간 저장하기
	int startAt(String l_code,String date);
	//시작 시간 저장 객체 가져오기
	HistoryVO getStartAtClass(String log_code);
	//끝나는 시간 저장하기
	HistoryVO endAt(String log_code, String endtAt);
	//전체 기록 가져오기
	List<HistoryVO> getHistroyList();
	
	
}
