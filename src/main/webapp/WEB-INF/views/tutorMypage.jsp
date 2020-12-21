<%@page import="org.springframework.ui.Model"%>
<%@page import="com.lesson.site.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TutorMyapge</title>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    

    <!-- MDB icon -->
    <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mdb.min.css">
    <!-- Your custom styles (optional) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <!-- MDBootstrap Datatables  -->
    <link href="css/addons/datatables2.min.css" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/final.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">

<script type="text/javascript">
	function watchClass(){
		alert("강의보기 실행");
		window.open('https://192.168.0.3:3000');
		/* window.open('https://192.168.0.191:3000'); */
		/* window.open('https://192.168.0.136:3000'); */
		location.href='startAt.do';
			
		
		/* 
			
			countClass.do로 가서 시간 측정하고 DB에 저장하고 model로 넘겨오자.
			즉, 강의 시작 시간만 눌러서 확인하자.
			
		*/
		
		/* location.replace('https://192.168.0.191:3000'); */
		
	} 
	
	function endClass(){

		location.href = 'endAt.do';
	}

</script>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand mb-0 h1 font-weight-bold" href="index.do">
                <img src="${pageContext.request.contextPath}/resources/images/logo2.png" width="150" height="50" class="d-inline-block align-top" alt="" loading="lazy">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

			 <div class="collapse navbar-collapse font-weight-bold" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a class="nav-link" href="index.do">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/searchAllClassView.do" >Class</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/tutor.do">Tutor</a></li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/faq.do">FAQ</a>
					</li>
				</ul>
				<!-- Sign up -->
				<!-- Login -->
				<c:choose>
					<c:when test="${loginMember == null}">
						 <button type="button" class="btn btn-light ml-3 font-weight-bold" onclick="location.href='signup.do'">
			                <i class="fas fa-user-circle mr-2"></i>Sign Up
			            </button>
						<button class="btn btn-light font-weight-bold ml-3" type="button" onclick="location.href='loginView.do'" formmethod="GET">
							 <i class="fas fa-sign-in-alt mr-2"></i>Login
						</button>
					</c:when>
	
					<c:when test="${loginMember != null}">
							<button type="button" class="btn btn-light ml-3 font-weight-bold" onclick="location.href = 'logout.do'">
								<i class="fas fa-sign-in-alt mr-2"></i>Logout
							</button>
						<c:if test="${loginMember.istutor == false}">
							<button type="button" class="btn btn-light ml-3 font-weight-bold" onclick="location.href='updateMember.do'" method="GET">
								<i class="fas fa-sign-in-alt mr-2"></i>Mypage
							</button>
						</c:if>
						<c:if test="${loginMember.istutor != false}">
							<button type="button" class="btn btn-light ml-3 font-weight-bold" onclick="location.href='tutorMypage.do'"method="GET">
								<i class="fas fa-sign-in-alt mr-2"></i>Mypage
							</button>
						</c:if>
					</c:when>
				</c:choose>
				<!-- <form class="form-inline my-2 my-lg-0">
	            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	          </form> -->
			</div>			
		</div> 		 
	</nav>
	
	
	<!-- MyPage -->
    <h2 class="text-center font-weight-bold pt-4 mt-3">
        ✋ Tutor My Page ✋
    </h2>
    <div class="container my-5 py-5 z-depth-1">
        <!--Section: Content-->
        <section class="px-md-5 mx-md-5 text-center text-lg-left dark-grey-text">
            <!--Grid row-->
            <div class="row d-flex justify-content-center">
                <!--Grid column-->
                <div class="col-md-6">
                    <!-- Default form subscription -->
                    <form class="text-center" action="updateTutor.do" method="POST">
                        <p class="h4 mb-4 font-weight-bold">나의 정보 😄</p>
                        <!-- Name -->
                        <input type="text" id="defaultSubscriptionFormPassword" 
                        	   class="form-control mb-4" placeholder="Nickname" name="nickname"
							   value="${loginMember.nickname }" disabled="disabled">
                        <!-- Password -->
                        <input type="text" id="defaultSubscriptionFormPassword" 
                        	   class="form-control mb-4" placeholder="Password" name="pw"
						       value="${loginMember.pw }">
                        <!-- Email -->
                        <input type="email" id="defaultSubscriptionFormEmail" 
                        	   class="form-control mb-4" placeholder="Email" name="email"
					           value="${loginMember.email }">
                        <!-- Email Check -->
                        <input type="email" id="defaultSubscriptionFormEmail" 
                        	   class="form-control mb-4" placeholder="Email Check"
                        	   name="memberCertification" value="${loginMember.isCheckEmaile() }" disabled="disabled">
                   	   	<c:if test="${loginMember.isCheckEmaile() eq 'false'}">
							작성하여 주신 이메일로 인증번호가 발송되었습니다.<br> 이메일 인증을 하여 주세요!<br>
							<input class="btn btn-info btn-block mb-3 font-weight-bold" type="submit" value="인증완료">
					  	 </c:if>
                        <!-- buttons -->
                        <!-- <button class="btn btn-info btn-block mb-3 font-weight-bold" type="button">수정하기</button> -->
                        <!-- <button class="btn btn-info btn-block mb-3 font-weight-bold" type="button">탈퇴하기</button> -->
                        <!-- <button class="btn btn-info btn-block mb-3 font-weight-bold" type="button" onclick="location.href='tutor_accept.html'">튜터하기</button> -->
                        <input class="btn btn-info btn-block mb-3 font-weight-bold" type="submit" value="수정하기">
						<button class="btn btn-info btn-block mb-3 font-weight-bold" type="button" onclick="location.href='deleteMember.do'">탈퇴하기</button>
                    </form>
                    <!-- Default form subscription -->
                </div>
                <!--Grid column-->
            </div>
            <!--Grid row-->
        </section>
        <!--Section: Content-->
    </div>
    
    
    <div class="container my-5 py-5 z-depth-1">
        <!--Section: Content-->
        <section class="px-md-5 mx-md-5 text-center text-lg-left dark-grey-text">
            <!--Grid row-->
            <div class="row d-flex justify-content-center">
                <!-- Default form subscription -->
                <div class="text-center" action="#!">
                    <p class="h4 mb-4 font-weight-bold">현재 공고중인 강의 📖</p>
                    <div class="container">
                        <table id="dtBasicExample" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="th-lg">
                                        	강의명
                                    </th>
                                    <th class="th-lg">
                                        	강의 금액
                                    </th>
                                    <th class="th-lg">
                                        	강의 계획
                                    </th>
                                    <th class="th-lg">
                                       	 강의 횟수
                                    </th>
                                    <th class="th-lg">
                                       	 강의 보기
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <!-- <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>
                                        <button type="button" class="btn btn-info btn-md m-0 font-weight-bold">강의 보기</button>
                                    </td> -->
                                    <c:forEach var="classVO" items="${myClassList }" varStatus="status">
										<form action="myClassViewPage.do" method="POST" >
										
											<%-- <input type="text" name="index" value="${status.count }"> --%>
											<tr>
												<c:if test="${status.count <= 0}">
													<input type="hidden" value="${status.index }" name="index" >
												</c:if>
												<c:if test="${status.count > 0}">
													<input type="hidden" value="${status.index }" name="index" >
												</c:if>
												<input type="hidden" name="s_code" value="${classVO.s_code }">
												<td>
													<label> 
														<input type="text" value="${classVO.class_name }" name="subject_name" readonly="readonly">
													</label>
												</td>
												<td>
													<label> 
														<input type="text" value="${classVO.pay }" name="pay" style="width: 100px;" readonly="readonly"><span>원</span>
													</label>
												</td>
												<td>
													<label> 
														<input type="text" value="${classVO.class_plan }" name="class_plan" style="width: 150px;" readonly="readonly">
													</label>
												</td>
												<td>
													<label>
														<input type="text" value="${classVO.class_totla_number }" name="class_totla_number" style="width: 50px;" readonly="readonly"><span>회</span>
													</label>
													
												</td>
												<td>
													<input type="submit" class="btn btn-info btn-md m-0 font-weight-bold" value="강의 보기">
												</td>	
											</tr>
										</form>
									</c:forEach>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <button type="button" class="btn btn-info btn-lg mb-3 font-weight-bold" onclick="location.href='addClass.do'">강의 추가</button>
                </div>
            </div>
        </section>
    </div>
		
	<div class="container my-5 py-5 z-depth-1">
        <!--Section: Content-->
        <section class="px-md-5 mx-md-5 text-center text-lg-left dark-grey-text">
            <!--Grid row-->
            <div class="row d-flex justify-content-center">
                <!-- Default form subscription -->
                <div class="text-center" action="#!">
                    <p class="h4 mb-4 font-weight-bold">현재 수강중인 강의 📖</p>
                    <div class="container">
                        <table id="dtBasicExample" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="th-lg">
                                        	강의명
                                    </th>
                                    <th class="th-lg">
                                        Tutor
                                    </th>
                                    <th class="th-lg">
                                        Tutor Email
                                    </th>
                                    <th class="th-lg">
                                        	수강 횟수
                                    </th>
                                    <th class="th-lg">
                                        	강의 보기
                                    </th>
                                    <th class="th-lg">
                                        	강의 끝내기
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <!-- <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td> -->
                                    <c:choose>
										<c:when test="${empty myLecture }">
											<tr>
												<td colspan="5">
													<h2>수강 중인 강의가 없습니다.</h2>
													<input type="button" onclick="location.href='searchAllClassView.do'" value="강의 보러가기">
												<td>
											</tr>
										</c:when>
										<c:when test="${not empty myLecture }">
											<c:forEach var="lecture" items="${myLecture }" varStatus="status">
												<tr>	
													<c:set var="index" value="${status.index }" scope="session"/>
													<c:set var="l_code" value="${lecture.getLecture().l_code }" scope="session" />
													<c:set var="log_code" value="${history.log_code }" scope="session" />
													<td>
														<input type="text" name="" value="${lecture.getClasss().class_name }" readonly="readonly">
													</td>
													<td>
														<input type="text" name="" value="${lecture.getMember().nickname }" readonly="readonly">
													</td>
													<td>
														<input type="text" name="" value="${lecture.getMember().email }" readonly="readonly">
													</td>
													<td>
														<input type="text" name="" value="${lecture.getLecture().numberOfLecture }" readonly="readonly">
													</td>
													<td>
														<input type="button" value="강의 보기" onclick="watchClass()">
													</td>
													<td>
														<input type="button" value="강의 끝내기" onclick="endClass()">
													</td>
												<tr>	
											</c:forEach>
										</c:when>
										<c:when test="${not empty searchMember }">
											<c:forEach var="lecture" items="${myLectureList }" varStatus="status">
												<tr>	
													<input type="hidden" name="index" value="${status.count }">
													
													<c:set var="l_code" value="${lecture.l_code }" scope="session" />
													<td>
														<input type="text" name="" value="${searchClass.class_name }" readonly="readonly">
													</td>
													<td>
														<input type="text" name="" value="${searchMember.nickname }" readonly="readonly">
													</td>
													<td>
														<input type="text" name="" value="${searchMember.email }" readonly="readonly">
													</td>
													<td>
														<input type="text" name="" value="${lecture.getLecture().numberOfLecture }" readonly="readonly">
													</td>
													<!-- <td>
														<input type="button" value="강의 보기" onclick="watchClass()">
													</td> -->
													<td>
				                                        <button type="button" class="btn btn-info btn-md m-0 font-weight-bold" onclick="watchClass()">강의 보기</button>
				                                    </td>
													<!-- <td>
														<input type="button" value="강의 끝내기" onclick="endClass()" >
													</td> -->
													<td>
				                                        <button type="button" class="btn btn-info btn-md m-0 font-weight-bold" onclick="endClass()">강의 끝내기</button>
				                                    </td>
												<tr>	
											</c:forEach>
										</c:when>
									</c:choose>
                                    <!-- <td>
                                        <button type="button" class="btn btn-info btn-md m-0 font-weight-bold">강의 보기</button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-info btn-md m-0 font-weight-bold">강의 끝내기</button>
                                    </td> -->
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </div>
	
	<div class="container my-5 py-5 z-depth-1">
	        <!--Section: Content-->
	        <section class="px-md-5 mx-md-5 text-center text-lg-left dark-grey-text">
	            <!--Grid row-->
	            <div class="row d-flex justify-content-center">
	                <!-- Default form subscription -->
	                <div class="text-center" action="#!">
	                    <p class="h4 mb-4 font-weight-bold">내 구매 내역 💳</p>
	                    <div class="container">
	                        <table id="dtBasicExample" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
	                            <thead>
	                                <tr>
	                                    <th class="th-lg">
	                                        	강의명
	                                    </th>
	                                    <th class="th-lg">
	                                        Tutor
	                                    </th>
	                                    <th class="th-lg">
	                                        	결재 금액
	                                    </th>
	                                    <th class="th-lg">
	                                       	 결제 시간
	                                    </th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <c:forEach var="payVO" items="${myPayList }" varStatus="status">
											<tr>
												<c:if test="${myLecture[status.index].getClasss().class_name != null}">
													<td>
														<input type="text" name="" value="${myLecture[status.index].getClasss().class_name }" readonly="readonly">
													</td>
													<td>
														<input type="text" name="" value="${myLecture[status.index].getMember().nickname }" readonly="readonly">
													</td>
													<td>
														<input type="text" name="" value="${myLecture[status.index].getLecture().total_price }" readonly="readonly">
													</td>
													
													<td>
														<input type="text" name="" value="${payVO.pay_time }" readonly="readonly">
													</td>
												</c:if>	
											</tr>
										</c:forEach>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	            </div>
	        </section>
	    </div>
	
	<%-- 
	내 회원정보 : ${loginMember }
	<br> 내 강사 정보 : ${tutor }
	<br> 내 강의 공고 : ${myClassList }
	<br> 수강 중인 강의들 : ${myLecture }
	<br>
	강사회원 : ${searchMember }
	<br>
	강사정보 : ${searchTutor }
	<br>
	강사의 강의 : ${searchClass }
	<br>
	결제 시각 : ${at }	
	<br>
	내 구매 강의 전체 리스트 : ${myLectureList }
	<br>
	내 구매내역 : ${myPayList }
	<br>
	<div class="mypage_container">
		<h1>${loginMember.nickname }강사님의MyPage입니다.</h1>

		<form action="updateTutor.do" method="POST">
			<ul>
				<li><label>아이디</label> <input type="text" name="nickname"
					value="${loginMember.nickname }" disabled="disabled"></li>
				<br>
				<br>
				<li><label>비밀번호</label> <input type="text" name="pw"
					value="${loginMember.pw }"></li>
				<br>
				<br>
				<li><label>이메일</label> <input type="text" name="email"
					value="${loginMember.email }"></li>
				<br>
				<br>
				<li><label>이메일 인증 여부</label> <input type="text"
					name="memberCertification" value="${loginMember.isCheckEmaile() }"
					disabled="disabled"></li>
				<c:if test="${loginMember.isCheckEmaile() eq 'false'}">
					작성하여 주신 이메일로 인증번호가 발송되었습니다. 이메일 인증을 하여 주세요!
					<input type="submit" value="인증완료">
				</c:if>
				<br>
				<br>
			</ul>
			<ul>
				<li><label>경력</label> <br> <textarea class=".DOC_TEXT"
						rows="" cols="" minlength="100"
						style="resize: none; width: 400px; height: 300px;"
						autofocus="autofocus" name="career">
						${tutor.career }
					</textarea></li>
				<li><label>자기소개</label> <br> <textarea
						class="DOC_TEXT_intro" rows="" cols="" minlength="100"
						style="resize: none; width: 400px; height: 300px;"
						autofocus="autofocus" name="introduction">
						${tutor.introduction }
					</textarea></li>
			</ul>
			<input type="submit" value="수정하기">
			<button type="button" onclick="location.href='deleteMember.do'">탈퇴하기</button>
			<!-- <button type="button" onclick="location.href='beginningTutor.do'" method="GET">튜터되기</button> -->
		</form>
		
		<div>
			<h1>내 수강 공고</h1>
			<table>
				<tr>
					<th>강의 제목</th>
					<th>강의 가격</th>
					<th>강의 계획서</th>
					<th>강의횟수</th>
				</tr>
			
					<c:forEach var="classVO" items="${myClassList }" varStatus="status">
						<form action="myClassViewPage.do" >
						
							<input type="text" name="index" value="${status.count }">
							<tr>
								<c:if test="${status.count <= 0}">
									<input type="hidden" value="${status.count }" name="index" >
								</c:if>
								<c:if test="${status.count > 0}">
									<input type="hidden" value="${status.index }" name="index" >
								</c:if>
								
								
								<input type="hidden" name="s_code" value="${classVO.s_code }">
		
								<td>
									<label> 
										<input type="text" value="${classVO.class_name }" name="subject_name" readonly="readonly">
									</label>
								</td>
								<td>
									<label> 
										<input type="text" value="${classVO.pay }" name="pay" style="width: 100px;" readonly="readonly"><span>원</span>
									</label>
								</td>
								<td>
									<label> 
										<input type="text" value="${classVO.class_plan }" name="class_plan" style="width: 150px;" readonly="readonly">
									</label>
								</td>
								<td>
									<label>
										<input type="text" value="${classVO.class_totla_number }" name="class_totla_number" style="width: 50px;" readonly="readonly"><span>회</span>
									</label>
									
								</td>
								<td>
									<input type="submit"  value="보러가기">
								</td>	
							</tr>
						</form>
					</c:forEach>
			</table>
			<input type="button" onclick="location.href='addClass.do'" value="강의등록">
		</div>
			
		<div>
			<h1>수강 중인 수업</h1>
			<table>
				<tr>
					<c:choose>
						<c:when test="${empty myLecture }">
							<h2>수강 중인 강의가 없습니다.</h2>
							<input type="button" onclick="location.href='searchAllClassView.do'" value="강의 보러가기">
						</c:when>
						
						<c:when test="${not empty myLecture }">
							<c:forEach var="lecture" items="${myLecture }" varStatus="status">
								<tr>	
									<input type="hidden" name="index" value="${status.count }">
									<c:set var="l_code" value="${lecture.getLecture().l_code }" scope="session" />
									<td>
										<input type="text" name="" value="${lecture.getClasss().class_name }" readonly="readonly">
									</td>
									<td>
										<input type="text" name="" value="${lecture.getMember().nickname }" readonly="readonly">
									</td>
									<td>
										<input type="text" name="" value="${lecture.getMember().email }" readonly="readonly">
									</td>
									<td>
										<input type="text" name="" value="${lecture.getLecture().numberOfLecture }" readonly="readonly">
									</td>
									<td>
										<input type="button" value="강의 보기" onclick="location.href='https://192.168.0.191:3000'">
									</td>
									<td>
										<input type="button" value="강의 끝내기" onclick="">
									</td>
								<tr>	
							</c:forEach>
						</c:when>
						
						<c:when test="${not empty searchMember }">
							<c:forEach var="lecture" items="${myLectureList }" varStatus="status">
								<tr>	
									<input type="hidden" name="index" value="${status.count }">
									<c:set var="l_code" value="${lecture.l_code }" scope="session" />
									<td>
										<input type="text" name="" value="${searchClass.class_name }" readonly="readonly">
									</td>
									<td>
										<input type="text" name="" value="${searchMember.nickname }" readonly="readonly">
									</td>
									<td>
										<input type="text" name="" value="${searchMember.email }" readonly="readonly">
									</td>
									<td>
										<input type="text" name="" value="${lecture.numberOfLecture }" readonly="readonly">
									</td>
									<td>
										<input type="button" value="강의 보기" onclick="location.href='https://192.168.0.191:3000'">
									</td>
									<td>
										<input type="button" value="강의 끝내기" onclick="">
									</td>
								<tr>	
							</c:forEach>
						</c:when>
					</c:choose>
				</tr>
			</table>
		</div>
		
		
		<div>
			<h1>구매내역</h1>
			<c:choose>
				<c:when test="${empty myLecture }">
					<h2>구매한 강의가 없습니다.</h2>
				</c:when>
				<c:when test="${not empty myLecture }">
					<table>
						<tr>
							<th>
								강의제목
							</th>
							<th>
								강사
							</th>
							<th>
								결제금액
							</th>
							<th>
								결제시간
							</th>				
						</tr>
							
						<tr>
							<c:forEach var="payVO" items="${myPayList }" varStatus="status">
								<tr>
									<c:if test="${myLecture[status.index].getClasss().class_name != null}">
										<td>
											<input type="text" name="" value="${myLecture[status.index].getClasss().class_name }" readonly="readonly">
										</td>
										<td>
											<input type="text" name="" value="${myLecture[status.index].getMember().nickname }" readonly="readonly">
										</td>
										<td>
											<input type="text" name="" value="${myLecture[status.index].getLecture().total_price }" readonly="readonly">
										</td>
										
										<td>
											<input type="text" name="" value="${payVO.pay_time }" readonly="readonly">
										</td>
									</c:if>	
								</tr>
							</c:forEach>
						</tr>
					</table>
				</c:when>
			</c:choose>
		</div>

	</div> --%>
	
	
	<!-- footer -->
    <footer class="page-footer font-small unique-color-dark">
        <!-- Footer Links -->
        <div class="container text-center text-md-left mt-5 py-4">
            <!-- Grid row -->
            <div class="row mt-3">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <!-- Content -->
                    <h6 class="text-uppercase font-weight-bold">Learnup studio</h6>
                    <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                    <p>
			                        교육하세요!<br>
			                        나만이 가진 재능을 공유하는 공간<br>
			                        배워보세요!<br>
			                        언제 어디서든 누구든지<br>
			                        지금 바로 시작하세요!
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase font-weight-bold">About</h6>
                    <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                    <p>
                        <a href="${pageContext.request.contextPath}/company_introduce.do">회사 소개</a>
                    </p>
                    <p>
                        <a href="${pageContext.request.contextPath}/privacy-policy.do">개인정보처리방침</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase font-weight-bold">menu</h6>
                    <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                    <p>
                        <a href="index.do">Home</a>
                    </p>
                    <p>
                        <a href="${pageContext.request.contextPath}/searchAllClassView.do">Class</a>
                    </p>
                    <p>
                        <a href="${pageContext.request.contextPath}/tutor.do">Tutor</a>
                    </p>
                    <p>
                        <a href="${pageContext.request.contextPath}/faq.do">FAQ</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-4 col-lg-4 col-xl-4 mx-auto mb-md-0 mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase font-weight-bold">Contact</h6>
                    <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                    <p>
                        <i class="fas fa-home mr-3"></i> 459, Gangnam-daero, Seocho-gu, Seoul, Republic of Korea</p>
                    <p>
                        <i class="fas fa-envelope mr-3"></i> info@example.com</p>
                    <p>
                        <i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
                    <p>
                        <i class="fas fa-print mr-3"></i> + 01 234 567 89</p>
            
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->  
        </div>
        <!-- Footer Links -->
            
        <!-- Copyright -->
        <div class="footer-copyright text-center py-3">© 2020 Copyright:
            <a href="index.do"> Learnup.com</a>
        </div>
        <!-- Copyright -->
            
    </footer>
    
      <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Your custom scripts (optional) -->
    <script type="text/javascript"></script>
    <!-- MDBootstrap Datatables  -->
    <script type="text/javascript" src="js/addons/datatables2.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>

</body>
</html>

