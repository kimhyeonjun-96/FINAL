package com.lesson.site.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.lesson.site.Class.ClassService;
import com.lesson.site.Class.ClassVO;
import com.lesson.site.Class.GetAllClass;
import com.lesson.site.category.CategoryService;
import com.lesson.site.lecture.GetMyLectureVO;
import com.lesson.site.lecture.LectureService;
import com.lesson.site.lecture.LectureVO;
import com.lesson.site.member.MemberService;
import com.lesson.site.member.MemberVO;
import com.lesson.site.member.impl.KakaoAPI;
import com.lesson.site.member.impl.NaverLoginBO;
import com.lesson.site.pay.PayService;
import com.lesson.site.pay.PayVO;
import com.lesson.site.tutor.TutorService;
import com.lesson.site.tutor.TutorVO;


import org.json.simple.parser.ParseException;
import org.json.simple.parser.JSONParser;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService; // 로직 처리를 위한 변수
	@Autowired
	private KakaoAPI kakao; // 카카오 로그인을 위한 비즈니스 로직
	@Autowired
	private NaverLoginBO naverLoginBO; // 네이버 로그인을 위한 로직 처리

	private String apiResult = null; // 사용자 정보를 담는 스트링 값
	
	@Autowired
	private ClassService classService;
	@Autowired
	private TutorService tutorService;
	@Autowired
	private LectureService lectureService; 
	@Autowired
	private PayService payService; 
	@Autowired 
	CategoryService categoryService;
	
	//메인 페이지 이동
	@RequestMapping(value = "index")
	public String mainPageView(HttpSession session) {
		
		List<GetAllClass> list = classService.getAllClass();
		session.setAttribute("getAllClass", list);
		List<GetAllClass> list1 = categoryService.getCategoryList01();
		List<GetAllClass> list2 = categoryService.getCategoryList02();
		List<GetAllClass> list3 = categoryService.getCategoryList03();
		List<GetAllClass> list4 = categoryService.getCategoryList04();
		List<GetAllClass> list5 = categoryService.getCategoryList05();
		session.setAttribute("getAllClass", list);
		session.setAttribute("categoryList1", list1);
		session.setAttribute("categoryList2", list2);
		session.setAttribute("categoryList3", list3);
		session.setAttribute("categoryList4", list4);
		session.setAttribute("categoryList5", list5);
		
		return "index";
	}
	
	
	
	//메인 페이지 이동
	@RequestMapping(value = "index.do")
	public String mainPage(HttpSession session) {
		
		List<GetAllClass> list = classService.getAllClass();
		List<GetAllClass> list1 = categoryService.getCategoryList01();
		List<GetAllClass> list2 = categoryService.getCategoryList02();
		List<GetAllClass> list3 = categoryService.getCategoryList03();
		List<GetAllClass> list4 = categoryService.getCategoryList04();
		List<GetAllClass> list5 = categoryService.getCategoryList05();
		session.setAttribute("getAllClass", list);
		session.setAttribute("categoryList1", list1);
		session.setAttribute("categoryList2", list2);
		session.setAttribute("categoryList3", list3);
		session.setAttribute("categoryList4", list4);
		session.setAttribute("categoryList5", list5);
		
		return "index";
	}
	//튜터 페이지 이동
	@RequestMapping(value = "tutor.do")
	public String tutorPage() {
		return "tutor";
	}
	//faq페이지 이동
	@RequestMapping(value = "faq.do")
	public String faqPage() {
		return "faq";
	}
	//privacy-policy페이지 이동
	@RequestMapping(value = "privacy-policy.do")
	public String privacy_policy() {
		return "privacy-policy";
	}
	//company_introduce.do
	@RequestMapping(value = "company_introduce.do")
	public String company_introduce() {
		return "company_introduce";
	}
	
	//메인에서 로그인 요청시 들어오는 곳. 여기를 거쳐서 들어감. 이유는 네이버 naverAuthUrl를 요청 해주는 로직이 필요한데 이걸 어디서 해야할지 모르겠음.
	//지금보다 더 좋은 생각이 아직 안남.
	@RequestMapping(value = "/loginView.do", method = RequestMethod.GET)
	public String loginView(Model model, HttpSession session) {

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("Naver 확인 : " + naverAuthUrl);
		if (naverAuthUrl != null) {
			session.setAttribute("url", naverAuthUrl);
		}
		System.out.println("session url : " + session.getAttribute("url"));
		return "login";
	}

	// 로그인 하기(일반, 카카오, 네이버)
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginMember(MemberVO vo, HttpSession session, Model model) {
		System.out.println("MemberController객체 로그인 함수 실행");
		int x = 1; 
		/*
		 * 	
		 * x는 아이디, 비밀번호 확인을 위한  int 값
		 * 1 = 정상 로그인 성공
		 * 0 = 아이디 잘 못 입력
		 * -1 = 비밀번호 잘 못 입력
		 * 
		 */		
		
		MemberVO loginMember = memberService.loginMember(vo.getNickname(), vo.getPw());
		
		if (loginMember != null) {
			TutorVO tutor = memberService.getTutor(loginMember.getM_code());
			List<LectureVO> list = lectureService.getMyLectureList(loginMember.getM_code());
			
			/*
			 * 하나만 가져올때.
			 * GetMyLectureVO getvo = lectureService.lecture(loginMember.getM_code());
			 * System.out.println("getvo : " + getvo.getLecture());
			 */

			List<GetMyLectureVO> getvoList = lectureService.lectureList(loginMember.getM_code());
			System.out.println("getvoList : " + getvoList);
			
			
			List<PayVO> pList = payService.getPayList();
			if(tutor != null ) {
				session.setAttribute("tutor", tutor);
			}
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("myLectureList", list);
			session.setAttribute("myPayList", pList);
			session.setAttribute("myLecture", getvoList);
			
			return "index";
		}
		String nickName = vo.getNickname();
		String pw = vo.getPw();
		if(nickName != memberService.getMemberNick(vo.getM_code()) || pw != memberService.getMemberPw(vo.getM_code())) {
			x = 0;
			model.addAttribute("returnLogin", x);
		}else {
			x = 1;
			model.addAttribute("returnLogin", x);
		}
		System.out.println("x : " + x);
		/*
		 * 로그인이 안되는 이유... 1. 아이디 오타 2. 비밀번호 오타
		 * 
		 * 이 오류들을 알려주고 싶다!!! 이런 오류들을 알려주는건 뒷단이 아닌 앞단에서 알려줘야 하지 않을까?
		 */
		
		return "login";
	}

	// 카카오 로그인 하기
	@RequestMapping(value = "/kakaologin.do")
	public String login(@RequestParam("code") String code, HttpSession session) throws Exception {
		System.out.println("code : " + code);

		String access_Token = kakao.getAccessToken(code);
		System.out.println("controller access_Token: " + access_Token);

		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);
		MemberVO vo = new MemberVO();
		vo.setM_code("kakao_" + (String) userInfo.get("m_code"));
		vo.setNickname((String) userInfo.get("nickname"));
		vo.setEmail((String) userInfo.get("email"));

		MemberVO duplicateMember = memberService.checkSosialMember(vo.getM_code()); // 카카오 회원 중복 검사
		System.out.println("duplicateMember : " + duplicateMember);
		int result = 0;
		if (duplicateMember == null) {
			result = memberService.sosialJoinMember(vo); // DB저장
			System.out.println("result : " + result);
			if (result < 0) {
//				vo = memberService.getKakaoMember(vo.getM_code());
//				System.out.println("kakao vo : " + vo);
//				session.setAttribute("loginMember", vo);
				return "login";
			}
		}
		vo = memberService.getSosialMember(vo.getM_code());
		System.out.println("kakao vo : " + vo);
		session.setAttribute("loginMember", vo);

		return "index";

	}


	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {

		// System.out.println("callback.do");
		System.out.println("model : " + model);
		System.out.println("code : " + code);
		System.out.println("state : " + state);
		System.out.println("session : " + session);

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		System.out.println("oauthToken : " + oauthToken);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);

		org.json.simple.parser.JSONParser parser = new org.json.simple.parser.JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		
		String id = "naver_" + (String)apiResult.substring(57, 65);
		String nickname = (String) response_obj.get("nickname");
		String email = (String) response_obj.get("email");
		//값 확인
		System.out.println("callback() id : " + id);
		System.out.println("callback() nickname : " + nickname);
		System.out.println("callback() email : " + email);
		
		
		int result = 0;
		//네이버 중복 검사 확인
		MemberVO vo = memberService.checkSosialMember(id);
		if(vo != null) {
			//첫 로그인 아닌 사람 네이버 회원 정보 가져오기
			vo = memberService.getSosialMember(id);
			session.setAttribute("loginMember", vo);
			
			return "index";
		}
		vo = new MemberVO();
		vo.setM_code(id);
		vo.setNickname(nickname);
		vo.setEmail(email);
		//첫 로그인 시 DB저장
		result = memberService.sosialJoinMember(vo);
		System.out.println("result : " + result);
		if(result < 0) {
			return "login";
		}

		return "index";
		
	}
	
	//회원 로그아웃
	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		/*
		 * List<GetAllClass> list =
		 * (List<GetAllClass>)session.getAttribute("getAllClass");
		 * session.setAttribute("getAllClass",list);
		 */
		//그런데 소셜로 통한 로그인 한 사람들은 소셜에서 로그아웃을 하지 않으면 로그인이 완변히 되지 않는다.
		return "redirect:index.do";
	}

	// 회원가입 페이지 이동하기
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signupView() {
		System.out.println("MemberController객체 회원가입 페이지 이동 함수 실행");
		return "signup";
	}

	// 회원가입하기
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String signup(MemberVO vo) throws Exception {
		System.out.println("MemberController객체 회원가입 함수 실행");
		System.out.println("vo: " + vo);

		MemberVO duplicateMember = memberService.checkNickPw(vo.getNickname(), vo.getPw());

		if (duplicateMember == null) {
			int result = memberService.joinMember(vo); // 회원가입

			if (result > 0) {
				System.out.println("MemberController객체 회원가입 함수 끝");
				return "login";
			}
		}
		System.out.println("MemberController객체 회원가입 함수 끝");
		// 경고참으로 아이디 중복이라고 알려주고 싶은데 어떻게 하면 좋을까??
		return "signup";
	}

	// 이메일 인증 여부 확인하기
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String email, Model model) throws Exception {
		memberService.userAuth(email);
		model.addAttribute("email", email);

		return "/emailConfirm";
	}

	// 회원정보 페이지 이동하기
	@RequestMapping(value = "/updateMember.do", method = RequestMethod.GET)
	public String updateMemberview(MemberVO vo) {

		return "mypage";
	}
	
	// 회원 정보 수정하기
	@RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
	public String updateMember(MemberVO vo, HttpSession session) {
		System.out.println("MemberController객체 회원정보 수정 함수");

		System.out.println("updateMember MemberVO : " + vo);
		System.out.println("updateMember session.MemberVO : " + (MemberVO) session.getAttribute("loginMember"));

		// 수정된 정보를 다시 가져와서 session에 올려야 한다
		MemberVO updateMember = memberService.updateMember(vo, (MemberVO) session.getAttribute("loginMember")); // 회원정보
																												// 수정
		System.out.println("updateMember함수 updateMember : " + updateMember);
		session.setAttribute("loginMember", updateMember);
		System.out.println("updateMember session : " + session.getAttribute("loginMember"));
		// session.setAttribute("updateMemberPw", updateMember.getPw());
		return "mypage";
	}
	
	//결제 성공 후 회원정수 수정하기 페이지 이동
	@RequestMapping(value = "/updateSuccessMember.do")
	public String updateSucessMember(MemberVO vo, String pay_time, HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("updateSucessMember pay_time : " + pay_time);
		
		long at = Long.parseLong(pay_time);
		Date date = (Date) new java.util.Date(at * 1000L);
		SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	    sdf.setTimeZone(java.util.TimeZone.getTimeZone("GMT+9")); 
	    String formattedDate = sdf.format(date);
	    System.out.println("date : " + date);
	    System.out.println("formattedDate : " + formattedDate);
	    
	    
	    MemberVO mvo = (MemberVO)session.getAttribute("loginMember");
	    ClassVO cvo = (ClassVO)session.getAttribute("searchClass");
	    TutorVO tvo = (TutorVO)session.getAttribute("searchTutor");
	    
	    System.out.println("mvo : " + mvo );
	    System.out.println("cvo : " + cvo );
	    System.out.println("tvo : " + tvo );
	    
	    LectureVO lvo = new LectureVO();
	    lvo.setM_code(mvo.getM_code());
	    lvo.setS_code(cvo.getS_code());
	    lvo.setTotal_price(cvo.getPay());
	    
	    int result = lectureService.addLecture(lvo);
	    if(result > 0) {
	    	List<LectureVO> list = lectureService.getMyLectureList(lvo.getM_code());
	    	System.out.println("myLectureList : " + list);
	    	session.setAttribute("myLectureList", list);
	    	LectureVO duplLvo = new LectureVO();
	   
	    	
	    	if(list.size() == 0) {
	    		duplLvo= list.get(list.size());
	    	}else if(list.size() > 0){
	    		duplLvo= list.get(list.size() - 1);
	    	}
	    	 
	    	
	    	PayVO pvo = new PayVO();
	 	    pvo.setL_code(duplLvo.getL_code());
	 	    pvo.setT_code(tvo.getT_code());
	 	    pvo.setPay_time(formattedDate);
	 	    
	 	    int payResult = payService.addPay(pvo);
	 	    if(payResult > 0) {
	 	    	List<PayVO> plist = payService.getPayList();
	 	    	session.setAttribute("myPayList", plist);
	 	    }
	 	   List<GetMyLectureVO> getvoList = lectureService.lectureList(mvo.getM_code());
	 	   session.setAttribute("myLecture", getvoList);
	    }
		model.addAttribute("at", formattedDate);
		/* model.addAttribute("pay_time", pay_time); */
		
		return "mypage";
	}

	// 회원탈퇴 하기
	@RequestMapping(value = "/deleteMember.do")
	public String deleteMember(HttpSession session) {
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		TutorVO tvo = (TutorVO)session.getAttribute("tutor");
		System.out.println("mvo : " + vo);
		System.out.println("tvo : " + tvo);
		
		System.out.println("vo.m_code : " + vo.getM_code());
		if(tvo == null) {
			int result = memberService.deleteMember(vo.getM_code());
			if (result > 0 ) {
				session.invalidate();
				return "deleteMember";
			}else {
				return "mypage";
			}
			
		}
		System.out.println("tvo.t_code : " + tvo.getT_code());
		
		int result = memberService.deleteMember(vo.getM_code());
		int tutorResult = tutorService.deleteTutor(tvo.getT_code());
		
		System.out.println("deleteMember 함수 result : " + result);
		if (result > 0 ) {
			session.invalidate();
			return "deleteMember";
		}else if(result > 0 && tutorResult > 0) {
			session.invalidate();
			return "deleteTutor";
		}
		return "mypage";
	}
	
	
	//튜터되기 페이지 이동
	@RequestMapping(value = "beginningTutor.do", method=RequestMethod.GET)
	public String beinningTutorView(TutorVO tutorVO, HttpSession session) {
		System.out.println("TutorController 강사되기 페이지 이동 함수 실행");

		return "beinningTutor";
	}
	
	//튜터되기 
	@RequestMapping(value = "beginningTutor.do", method=RequestMethod.POST)
	public String beinningTutor(TutorVO tutorVO, HttpSession session, Model model) {
		System.out.println("TutorController 강사되기 함수 실행");
		System.out.println("tutorVO : " + tutorVO);
		System.out.println("session : " + session);
		
		//회원코드로 강사인지 먼저 확인한다. 
		TutorVO duplicateVO = memberService.checkTutor(tutorVO.getM_code());
		if(duplicateVO != null) {
			session.setAttribute("tutor",duplicateVO);
			return "tutorMypage";
		}
		
		//강사테이블에 저장을 해야한다.튜터코드 만들어야 한다. 이건 강사를 새로 insert할 때 값을 넣어주면 되지!!
		int result = memberService.joinTutor(tutorVO);
		if(result > 0) {
			//회원의 istutor컬럼을 true로 바꾸어야 한다.
			memberService.updateIstutor(tutorVO.getM_code());
			tutorVO = memberService.getTutor(tutorVO.getM_code());
		}
		session.setAttribute("tutor",tutorVO);
		//return "successTutor";
		return"successTutor";
	}
	
	//강의 구매하기 페이지 이동
	@RequestMapping(value = "buyClassView.do")
	public String buyClassView(HttpSession session) {
		System.out.println("buyClassView 함수 실행");
		return "buyClassView";
	}
	
	
	
	
	

}






