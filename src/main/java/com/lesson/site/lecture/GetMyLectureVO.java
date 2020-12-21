package com.lesson.site.lecture;

import com.lesson.site.lecture.LectureVO;
import com.lesson.site.Class.ClassVO;
import com.lesson.site.member.MemberVO;
import com.lesson.site.tutor.TutorVO;

public class GetMyLectureVO {
	
	
	//내가 수강 중인 강의 가져오기! LIST에 담겨져 온다!
	//가져오는 값
	// l_code, s_code, t_code, m_code, subject_name, nickname, email
	private LectureVO lecture;
	private ClassVO classs;
	private TutorVO tutor;
	private MemberVO member;
	
	
	
	
	public LectureVO getLecture() {
		return lecture;
	}
	public void setLecture(LectureVO lecture) {
		this.lecture = lecture;
	}
	public ClassVO getClasss() {
		return classs;
	}
	public void setClasss(ClassVO classs) {
		this.classs = classs;
	}
	public TutorVO getTutor() {
		return tutor;
	}
	public void setTutor(TutorVO tutor) {
		this.tutor = tutor;
	}
	public MemberVO getMember() {
		return member;
	}
	public void setMember(MemberVO member) {
		this.member = member;
	}
	
	
	
	
	

}
