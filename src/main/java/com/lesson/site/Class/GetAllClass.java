package com.lesson.site.Class;

import com.lesson.site.category.CategoryVO;
import com.lesson.site.member.MemberVO;
import com.lesson.site.tutor.TutorVO;

public class GetAllClass {
	
	private ClassVO classs;
	private CategoryVO category;
	private TutorVO tutor;
	private MemberVO member;
	

	
	public ClassVO getClasss() {
		return classs;
	}
	public void setClasss(ClassVO classs) {
		this.classs = classs;
	}
	public CategoryVO getCategory() {
		return category;
	}
	public void setCategory(CategoryVO category) {
		this.category = category;
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
