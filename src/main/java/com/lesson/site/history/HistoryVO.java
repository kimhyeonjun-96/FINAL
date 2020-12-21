package com.lesson.site.history;

import java.sql.Date;

public class HistoryVO {
	
	private String log_code;
	private String l_code;
	private Date start_study_time;
	private Date end_study_time; 

	public HistoryVO() {}
	
	public HistoryVO(String log_code, String l_code, Date start_study_time, Date end_study_time) {
		this.log_code = log_code;
		this.l_code = l_code;
		this.start_study_time = start_study_time;
		this.end_study_time = end_study_time;
	}
	
	public String getLog_code() {
		return log_code;
	}
	public void setLog_code(String log_code) {
		this.log_code = log_code;
	}
	public String getL_code() {
		return l_code;
	}
	public void setL_code(String l_code) {
		this.l_code = l_code;
	}
	public Date getstart_study_time() {
		return start_study_time;
	}
	public void setstart_study_time(Date start_study_time) {
		this.start_study_time = start_study_time;
	}
	public Date getend_study_time() {
		return end_study_time;
	}
	public void setend_study_time(Date end_study_time) {
		this.end_study_time = end_study_time;
	}

	@Override
	public String toString() {
		return "HistoryVO [log_code=" + log_code + ", l_code=" + l_code + ", start_study_time=" + start_study_time + ", end_study_time="
				+ end_study_time + "]";
	}

	
}
