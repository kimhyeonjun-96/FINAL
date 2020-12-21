package com.lesson.site.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lesson.site.Class.ClassVO;
import com.lesson.site.category.CategoryService;
import com.lesson.site.category.CategoryVO;
import com.lesson.site.member.MemberService;
import com.lesson.site.member.MemberVO;
import com.lesson.site.tutor.TutorService;
import com.lesson.site.tutor.TutorVO;

@Controller
public class TutorController {
	
	@Autowired
	TutorService tutorService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	MemberService memberService;

	//튜터정보 페이지 이동
	@RequestMapping(value = "tutorMypage.do", method = RequestMethod.GET)
	public String updateTutorView(HttpSession session) {
		System.out.println("updateTutorView() session.getAttribute('tutor') : " + session.getAttribute("tutor"));
		
		TutorVO vo = (TutorVO)session.getAttribute("tutor");
		session.setAttribute("myClassList", tutorService.getClassList(vo.getT_code()));
		
		return "tutorMypage";
	}
	//강사정보 수정
	@RequestMapping(value = "updateTutor.do", method = RequestMethod.POST)
	public String updateTutor(MemberVO vo, TutorVO tvo, HttpSession session) {
		System.out.println("TutorController updateTutor() 실행");
		System.out.println("memberVO : " + vo);
		System.out.println("tutorVO : " + tvo);
		System.out.println("session : " + session);
		MemberVO memvo = (MemberVO)session.getAttribute("loginMember");
		TutorVO tuvo = (TutorVO)session.getAttribute("tutor");
		
		
		System.out.println("memvo : " + memvo);
		System.out.println("tuvo : " + tuvo);
		
		MemberVO updateMember = memberService.updateMember(vo, memvo);
		TutorVO updateTutor = tutorService.updateTutor(tvo,tuvo);
		
		session.setAttribute("loginMember", updateMember);
		session.setAttribute("tutor", updateTutor);
		
		return "tutorMypage";
	}
	
	//강의 등록하기 페이지 이동
	@RequestMapping(value = "addClass.do", method=RequestMethod.GET)
	public String addClassView(Model model) {
		System.out.println("addClassView 페이지 이동 함수 실행");
		
		List<CategoryVO> list = categoryService.getCategoryList();
		
		model.addAttribute("categoryList", list);
		
		return "addClass";
	}
	
	//강의 등록하기
	@RequestMapping(value = "addClass.do", method=RequestMethod.POST)
	public String addClass(ClassVO vo, Model model, HttpSession session, String class_img) {
		
		System.out.println("addClass()  실행");
		
		System.out.println("class_img : " + class_img);
		int result = tutorService.addClass(vo); //강의 등록
		TutorVO tvo = tutorService.getTutor(vo.getT_code()); //강사정보 가져오기
		System.out.println("tvo : " + tvo);
		System.out.println("session tutor : " + (TutorVO)session.getAttribute("tutor"));
		
		if(result > 0) {
			List<ClassVO> list = tutorService.getClassList(tvo.getT_code()); //가져온 강사정보로 강사의 전체 강의 조회
			model.addAttribute("myClassList", list);
			return "redirect:tutorMypage.do";
		}
		//등록 실패시 가는 페이지 -> 바로 tutorMypage로 이동 할거 alert으로 알리고 이동!
		/* return "failAddClass"; */
		return "";
	}
	
	//강의 수정하기
	@RequestMapping(value = "modifyClass.do", method=RequestMethod.POST)
	public String modifyClass(ClassVO vo, HttpSession session) {
		System.out.println("특정 강의 수정 함수 실행");
		System.out.println("수정 class 객체 : " + vo);
		System.out.println("session myClassList index : " + session.getAttribute("index"));
		
		List<ClassVO> list = (List<ClassVO>) session.getAttribute("myClassList");
		ClassVO cvo = new ClassVO();
//		int index = (int)session.getAttribute("index");
//		if(index >= 1) {
//			cvo = list.get(index - 1 );
//		}
		cvo = (ClassVO)session.getAttribute("myClass");
		System.out.println("cvo : " + cvo);
//		else {
//			session.setAttribute("myClassList", tutorService.getClassList(cvo.getT_code()));
//			return "tutorMypage";
//		}
		tutorService.modifyClass(vo);
		
		session.setAttribute("myClassList", tutorService.getClassList(cvo.getT_code()));
		return "tutorMypage";
	}
	@RequestMapping(value = "deleteClassView.do", method=RequestMethod.GET)
	public String delteClassView(ClassVO vo, HttpSession session) {
		return "deleteClass";
	}
	
	
	//특정 강의 지우기
	@RequestMapping(value = "deleteClass.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteClass(ClassVO vo, HttpSession session) {
		System.out.println("강의 삭제 함수 실행");
		System.out.println("session myClassList index : " + session.getAttribute("index"));
		List<ClassVO> list = (List<ClassVO>) session.getAttribute("myClassList");
//		int index = (int)session.getAttribute("index");
		ClassVO cvo = new ClassVO();
//		if(index >= 1) {
//			cvo = list.get(index - 1 );
//		}
		cvo = (ClassVO) session.getAttribute("myClass");
		System.out.println("deleteClass cvo : " + cvo);
//		else {
//			session.setAttribute("myClassList", tutorService.getClassList(cvo.getT_code()));
//			return "redirect:tutorMypage,do";
//		}
		
		tutorService.deleteClass(cvo.getS_code());
		
		session.setAttribute("myClassList", tutorService.getClassList(cvo.getT_code()));
		return "redirect:tutorMypage.do";
	}
	//특정강의 자세히 보기
	@RequestMapping(value = "myClassViewPage.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myClassViewPage(HttpSession session, int index) {
		System.out.println("myClassViewPage 함수 실행");
	
		/* int in = index; */
		System.out.println("myClassViewPage.do index : "  + index);
		
		
		List<ClassVO> list = (List<ClassVO>)session.getAttribute("myClassList");
		System.out.println("1 : " + list.get(0));
		System.out.println("2 : " + list.get(1));
		System.out.println("3 : " + list.get(2));
		
		ClassVO cvo = new ClassVO();
		cvo = list.get(index);
		
		ClassVO vo = tutorService.getClassOne(cvo.getS_code());
		session.setAttribute("myClass", vo);
		
		return "announcementClass";
	}
	
}











