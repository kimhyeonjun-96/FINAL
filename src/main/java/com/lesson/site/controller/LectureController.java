package com.lesson.site.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lesson.site.history.HistoryService;
import com.lesson.site.history.HistoryVO;
import com.lesson.site.lecture.GetMyLectureVO;
import com.lesson.site.lecture.LectureService;
import com.lesson.site.lecture.LectureVO;
import com.lesson.site.member.MemberVO;

@Controller
public class LectureController {
	
	@Autowired
	HistoryService historyService;
	@Autowired
	LectureService lectureService;
	
	@RequestMapping(value = "startAt.do")
	public String startAt(HttpSession session) {
		System.out.println("startAt 함수 실행");
		String l_code = (String)session.getAttribute("l_code");
		System.out.println("l_code : " + l_code );
		HistoryVO history = (HistoryVO)session.getAttribute("histiry");
		System.out.println("history : " + history);
		
		if(history != null) {
			return "mypage";
		}
		
		history = new HistoryVO();
		history.setstart_study_time(new Date(System.currentTimeMillis()));
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startAt =  transFormat.format(history.getstart_study_time());
		System.out.println("start_time : " + startAt);
		int result = historyService.startAt(l_code, startAt);
		List<HistoryVO> list = null;
		if(result > 0) {
			list = historyService.getHistroyList();
		}
		HistoryVO hvo = list.get(list.size()-1);
		session.setAttribute("history" , hvo);
		return "mypage"; 
	}
	
	@RequestMapping(value = "endAt.do")
	public String endAt(HttpSession session, Model model) {
		String log_code = (String)session.getAttribute("log_code");
		System.out.println("log_code : " + log_code );
		String l_code = (String)session.getAttribute("l_code");
		System.out.println("l_code : " + l_code );
		HistoryVO checkhvo = (HistoryVO) session.getAttribute("history");
		
		if(checkhvo.getstart_study_time() == null) {
			return "redirect:updateMember.do";
		}
		
		int index = (int)session.getAttribute("index");
		System.out.println("index : " + index);
		List<GetMyLectureVO> list = (List<GetMyLectureVO>)session.getAttribute("myLecture");
		LectureVO vo = list.get(index).getLecture();
		lectureService.updateNumberOfLecture(vo.getL_code());
		
		List<GetMyLectureVO> relist = lectureService.lectureList(list.get(index).getMember().getM_code());
		session.setAttribute("myLecture", relist);
		
		HistoryVO historyVO = new HistoryVO();
		historyVO.setend_study_time(new Date(System.currentTimeMillis()));
		System.out.println("끝나는 시간 : " + historyVO.getend_study_time());
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String endtAt =  transFormat.format(historyVO.getend_study_time());
		System.out.println("end_time : " + endtAt);
		
		HistoryVO hvo = historyService.endAt(checkhvo.getLog_code(), endtAt);
		session.setAttribute("history" , hvo);
		
		LectureVO lvo = lectureService.getLecture(l_code);
		lvo.setNumberOfLecture(lvo.getNumberOfLecture() + 1);
		model.addAttribute("lec", lvo);
		
		return "redirect:updateMember.do";
	}
}
