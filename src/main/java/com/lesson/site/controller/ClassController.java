package com.lesson.site.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lesson.site.Class.ClassService;
import com.lesson.site.Class.ClassVO;
import com.lesson.site.Class.GetAllClass;
import com.lesson.site.category.CategoryService;
import com.lesson.site.category.CategoryVO;
import com.lesson.site.member.MemberService;
import com.lesson.site.member.MemberVO;
import com.lesson.site.tutor.TutorService;
import com.lesson.site.tutor.TutorVO;

@Controller
public class ClassController {
	
	@Autowired
	ClassService classService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	MemberService memberService;
	@Autowired
	TutorService tutorService;
	
	//모든 강의 검색
	@RequestMapping(value = "searchAllClassView.do")
	public String searchAllCalss(HttpSession session) {
//		List<ClassVO> list = classService.searchAllClass();
//		List<CategoryVO> cList = categoryService.getCategoryList();
//		List<MemberVO> mList = memberService.getMemberList();
//		List<TutorVO> tList = tutorService.getTutorList();
//		
//		session.setAttribute("allClass", list);
//		session.setAttribute("category", cList);
//		session.setAttribute("allMember", mList);
//		session.setAttribute("allTutor", tList);
		
		  List<GetAllClass> list = classService.getAllClass();
		  session.setAttribute("getAllClass", list);
		 
		
		
		return "searchAllClass";
	}
	//특정 강의 자세히 보기 페이지 이동
	@RequestMapping(value = "searchAllClass.do", method = RequestMethod.GET)
	public String searchAllClassView() {
		return "searchAllClass";
	}

	//특정 강의 자세히 보기
	@RequestMapping(value = "searchAllClass_2.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchAllClass(HttpSession session, String s_code) {
		System.out.println("searchAllClass 함수 실행");
		
		System.out.println("s_code : " + s_code);
		
		MemberVO mvo = classService.searchMember(s_code);
		TutorVO tvo = classService.searchTutor(s_code);
		ClassVO cvo = classService.searchClass(s_code);
		System.out.println("mvo : " + mvo);
		System.out.println("tvo : " + tvo);
		System.out.println("cvo : " + cvo);

		
		if(!("".equals(mvo) && "".equals(tvo) && "".equals(cvo)) ){
			session.setAttribute("searchMember", mvo);
			session.setAttribute("searchTutor", tvo);
			session.setAttribute("searchClass", cvo);
			return "announcementClass";
		}
				
		return "searchAllClass";
	}
	
	
}
