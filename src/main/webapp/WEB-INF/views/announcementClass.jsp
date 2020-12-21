<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="css/final.css">
<title>수업</title>
</head>
<body>
<%-- 	로그인 회원 : ${loginMember }
	<br>
	로그인 강사 정보 : ${tutor }
	<br>
	로그인 강상의 특정 강의 : ${myClass }<!-- 여기서는 특정 강의만 가져와야 한다. -->
	<br>
	${index }
	
	${searchMember }
	<br>
	${searchTutor }
	<br>
	${searchClass } --%>
	<!-- 
		1. 일반적으로 검색을 해서 해당 공고를 클릭했을 때 넘어옴 -> 이게 감이 안온다.
		2. 일반회원이 수강 중인 수엽을 클릭했을 때 넘어옴 -> lecture 테이블에 s_code가 담겨짐.
		3. 강사가 내 수강공고를 클릭했을 때 넘어옴 -> 강사는 s_code가 있으니 쉽게 넘어 갈 수 있을 것 같다.
	 -->
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
	
	<!-- Class Deep -->
    <div class="container my-5 py-5 z-depth-1">
        <!--Section: Content-->
        <section class="text-center">
            <!-- Section heading -->
            <h3 class="font-weight-bold mb-5">강의 세부 페이지</h3>
            <div class="row">
                <div class="col-lg-6">
                    <!--Carousel Wrapper-->
                    <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails" data-ride="carousel">
                        <!--Slides-->
                        <div class="carousel-inner text-center text-md-left" role="listbox">
                        	<c:choose>
                        		<c:when test="${myClass != null }">
                        			<div class="carousel-item active">
		                                <img src="${pageContext.request.contextPath}/resources/classImg/${myClass.class_img }" alt="First slide" class="img-fluid" name="class_img">
		                            </div>
                        		</c:when>
                        		
                        		<c:when test="${searchClass != null }">
                        			<div class="carousel-item active">
		                                <img src="${pageContext.request.contextPath}/resources/classImg/${searchClass.class_img }" alt="First slide" class="img-fluid" name="class_img">
		                            </div>
                        		</c:when>
                        	</c:choose>
                        </div>
                        <!--/.Slides-->
                        
                        <!--Thumbnails-->
                        <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only"></span>
                        </a>
                        <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only"></span>
                        </a>
                        <!--/.Thumbnails-->
                    </div>
                    <!--/.Carousel Wrapper-->
                </div>
      			
      			
      			
                <div class="col-lg-5 text-center text-md-left">
                	<form action="modifyClass.do" method="POST">
			 			<c:choose>
			 				<c:when test="${myClass != null && tutor != null && loginMember != null}">
			 					<h2 class="h2-responsive text-center text-md-left product-name font-weight-bold dark-grey-text mb-1 ml-xl-0 ml-4">
			                        <input type="hidden" value="${myClass.class_name }" name="class_name"><strong>${myClass.class_name }</strong>
			                    </h2>
			                    <span class="badge badge-danger product mb-4 ml-xl-0 ml-4">bestTutor</span>
			 					<input type="hidden" name="s_code" value="${myClass.s_code }">
			 					<h3 class="h3-responsive text-center text-md-left mb-5 ml-xl-0 ml-4">
			                        <span class="red-text font-weight-bold">
			                            <input type="hidden" value="${myClass.pay }" name="pay" style="width: 100px;" ><strong>${myClass.pay }원</strong>
			                        </span>
			                        <!-- <span class="grey-text">
			                            <small>
			                                <s>50000원</s>
			                            </small>
			                        </span> -->
			                    </h3>
			                    <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">
			                    	<!-- Accordion card -->
			                    	<div class="card">
			                            <!-- Card header -->
			                            <div class="card-header" role="tab" id="headingOne1">
			                                <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
			                                    <h5 class="black-text font-weight-normal mb-0">
			                                        <input type="hidden" value="${loginMember.nickname }" name="nickname">
			                                        ${loginMember.nickname }Tutor 소개
			                                        <i class="fas fa-angle-down rotate-icon"></i>
			                                    </h5>
			                                </a>
			                            </div>
			                            <!-- Card body -->
			                            <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordionEx">
			                                <div class="card-body">
			                                    - 자기 소개 🤚<br>
			                                   <!--  &nbsp;학부는 수학을 전공하여 수학적 알고리즘 해석 능력을 가지고 있고, 석사를 연세대학교 의대에서 마치며 통계분석 방법에 대한 해외 저널 게제 및 딥 러닝에 관한 졸업논문을 작성하였습니다. 다수의 수학 및 코딩 과외 경력, 고등학교 외부강사 경력, 학원 강사 경력을 가지고 있습니다. -->
												<textarea minlength="100"
														style="resize: none; width: 200px; height: 100px;"
														autofocus="autofocus" name="introduction">
													${tutor.introduction }
												</textarea>
												<%-- <input type="hidden" name="class_plan" value="${tutor.introduction }">
												${tutor.introduction } --%>
			                                    <br><br>
			                                    - 경력 🕶️<br>
			                                    <!-- &nbsp;공주 사범대학교 수학교육과 학사 졸업<br>
			                                    &nbsp;연세대학교 의과대학 졸업<br>
			                                    &nbsp;다수의 수학 및 코딩 과외 경험 -->
												<input type="hidden" name="class_plan" value="${tutor.career }">
												${tutor.career }
			                                    <br><br>
			                                    - 이메일 📧<br>
			                                    <!-- &nbsp;khjlove8427@nvar.com -->
			                                    <input type="hidden" value="${loginMember.email }" name="email">
		                                        ${loginMember.email }
			                                </div>
			                            </div>
			                        </div>
			                        
			                        <!-- Accordion card -->
			                        <div class="card">
			                            <!-- Card header -->
			                            <div class="card-header" role="tab" id="headingTwo2">
			                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2">
			                                    <h5 class="black-text font-weight-normal mb-0">
			                                        Class 소개
			                                        <i class="fas fa-angle-down rotate-icon"></i>
			                                    </h5>
			                                </a>
			                            </div>
			                            <!-- Card body -->
			                            <div id="collapseTwo2" class="collapse" role="tabpanel" aria-labelledby="headingTwo2" data-parent="#accordionEx">
			                                <div class="card-body">
			                                    - 강의 계획 📅<br>
			                                   <!--  &nbsp;1. Python 설치 및 기본 설정<br>
			                                    &nbsp;2. Hello Python 출력해보기<br>
			                                    &nbsp;3. 연산자<br>
			                                    &nbsp;4. 조건문<br>
			                                    &nbsp;5. 반복문 -->
												<%-- <input type="hidden" name="class_plan" value="${myClass.class_plan }"> --%>
												<textarea minlength="100"
														style="resize: none; width: 200px; height: 100px;"
														autofocus="autofocus" name="class_plan">
													${myClass.class_plan }
												</textarea>
			                                    <br><br>
			                                    - 해당 강의 횟수 계획 🧮<br>
			                                    &nbsp;<input type="hidden" value="${myClass.class_totla_number }" name="class_totla_number">${myClass.class_totla_number }회
			                                </div>
			                            </div>
			                        </div>
			                        <!-- Accordion card -->
			                    </div>
							<%-- 	<label> 
									<p>강의명 : <input type="text" value="${myClass.subject_name }" name="subject_name"></p>
								</label>
								<br>
								<label> 
									<p>강의 가격 : <input type="text" value="${myClass.pay }" name="pay" style="width: 100px;" ><span>원</span></p>
								</label>
								<br>
								<label> 
									<p>강의 계획 : 
										<textarea minlength="100"
												style="resize: none; width: 200px; height: 100px;"
												autofocus="autofocus" name="introduction">
											${myClass.class_plan }
										</textarea>
									</p>
								</label>
								<br>
								<label>
									<p>강의 횟수 : <input type="text" value="${myClass.class_totla_number }" name="class_totla_number" style="width: 50px;"><span>회</span></p>
								</label>
								<br> --%>
			 				</c:when>
			 				
			 				<c:when test="${searchClass != null}">
			 					<<h2 class="h2-responsive text-center text-md-left product-name font-weight-bold dark-grey-text mb-1 ml-xl-0 ml-4">
			                        <input type="hidden" value="${searchClass.class_name }" name="subject_name"><strong>${searchClass.class_name }</strong>
			                    </h2>
			                    <span class="badge badge-danger product mb-4 ml-xl-0 ml-4">bestTutor</span>
			 					<input type="hidden" name="s_code" value="${searchClass.s_code }">
			 					<h3 class="h3-responsive text-center text-md-left mb-5 ml-xl-0 ml-4">
			                        <span class="red-text font-weight-bold">
			                            <input type="hidden" value="${searchClass.pay }" name="pay" style="width: 100px;" ><strong>${searchClass.pay }원</strong>
			                        </span>
			                        <!-- <span class="grey-text">
			                            <small>
			                                <s>50000원</s>
			                            </small>
			                        </span> -->
			                    </h3>
			                    <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">
			                    	<!-- Accordion card -->
			                    	<div class="card">
			                            <!-- Card header -->
			                            <div class="card-header" role="tab" id="headingOne1">
			                                <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
			                                    <h5 class="black-text font-weight-normal mb-0">
			                                        <input type="hidden" value="${searchMember.nickname }" name="nickname">
			                                        ${searchMember.nickname }Tutor 소개
			                                        <i class="fas fa-angle-down rotate-icon"></i>
			                                    </h5>
			                                </a>
			                            </div>
			                            <!-- Card body -->
			                            <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordionEx">
			                                <div class="card-body">
			                                    - 자기 소개 🤚<br>
			                                   <!--  &nbsp;학부는 수학을 전공하여 수학적 알고리즘 해석 능력을 가지고 있고, 석사를 연세대학교 의대에서 마치며 통계분석 방법에 대한 해외 저널 게제 및 딥 러닝에 관한 졸업논문을 작성하였습니다. 다수의 수학 및 코딩 과외 경력, 고등학교 외부강사 경력, 학원 강사 경력을 가지고 있습니다. -->
			                                  <%--   <textarea
													class="DOC_TEXT_intro" rows="" cols="" minlength="100"
													style="resize: none; width: 400px; height: 300px;"
													autofocus="autofocus" name="introduction">
													${searchtutor.introduction }
												</textarea> --%>
												<input type="hidden" name="introduction" value="${searchTutor.introduction }">
												${searchTutor.introduction }
			                                    <br><br>
			                                    - 경력 🕶️<br>
			                                    <!-- &nbsp;공주 사범대학교 수학교육과 학사 졸업<br>
			                                    &nbsp;연세대학교 의과대학 졸업<br>
			                                    &nbsp;다수의 수학 및 코딩 과외 경험 -->
			                                 <%--    <textarea class=".DOC_TEXT"
													rows="" cols="" minlength="100"
													style="resize: none; width: 400px; height: 300px;"
													autofocus="autofocus" name="career" readonly="readonly" >
													${searchTutor.career }
												</textarea> --%>
												<input type="hidden" name="introduction" value="${searchTutor.career }">
												${searchTutor.career }
			                                    <br><br>
			                                    - 이메일 📧<br>
			                                    <!-- &nbsp;khjlove8427@nvar.com -->
			                                    <input type="hidden" value="${searchMember.email }" name="email">
		                                        ${searchMember.email }
			                                </div>
			                            </div>
			                        </div>
			                        
			                        <!-- Accordion card -->
			                        <div class="card">
			                            <!-- Card header -->
			                            <div class="card-header" role="tab" id="headingTwo2">
			                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2">
			                                    <h5 class="black-text font-weight-normal mb-0">
			                                        Class 소개
			                                        <i class="fas fa-angle-down rotate-icon"></i>
			                                    </h5>
			                                </a>
			                            </div>
			                            <!-- Card body -->
			                            <div id="collapseTwo2" class="collapse" role="tabpanel" aria-labelledby="headingTwo2" data-parent="#accordionEx">
			                                <div class="card-body">
			                                    - 강의 계획 📅<br>
			                                   <!--  &nbsp;1. Python 설치 및 기본 설정<br>
			                                    &nbsp;2. Hello Python 출력해보기<br>
			                                    &nbsp;3. 연산자<br>
			                                    &nbsp;4. 조건문<br>
			                                    &nbsp;5. 반복문 -->
			                                    <%-- <textarea minlength="100"
														style="resize: none; width: 200px; height: 100px;"
														autofocus="autofocus" name="introduction">
													${searchClass.class_plan }
												</textarea> --%>
												<input type="hidden" value="${searchClass.class_plan }" name="email">
		                                        ${searchClass.class_plan }
			                                    <br><br>
			                                    - 해당 강의 횟수 계획 🧮<br>
			                                    &nbsp;<input type="hidden" value="${searchClass.class_totla_number }" name="class_totla_number">${searchClass.class_totla_number }회
			                                </div>
			                            </div>
			                        </div>
			                        <!-- Accordion card -->
			                    </div>
			 				</c:when>
			 			</c:choose>	
						<c:if test="${tutor.t_code == myClass.t_code}">
							<c:if test="${loginMember.istutor == true}">
								<input type="submit" class="w-30 h-75 text-center mx-auto p-3 mt-2 btn purple-gradient btn-lg btn-block" value="수정하기">
								<input type="button" class="w-30 h-75 text-center mx-auto p-3 mt-2 btn purple-gradient btn-lg btn-block" onclick="location.href='deleteClassView.do'" value="강의 삭제 " > 
						 	</c:if>
						</c:if>
		 			</form>
                    <!-- Add to Cart -->
                    <section class="color">
                        <div class="mt-5">
                            
                            <div class="row text-center text-md-center">
                            	<p class="grey-text">🔥 난이도 🔥</p>
                            	<c:choose>
                            		<c:when test="${myClass != null && myClass.class_level == '초급' }">
                            			 <div class="col-md-4 col-12">
		                                    <!-- Radio group -->
		                                    <div class="form-group">
		                                        <input class="form-check-input" name="class_level" type="hidden" id="radio100" checked="checked">
		                                        <label for="radio100" class="form-check-label dark-grey-text">${myClass.class_level }</label>
		                                    </div>
		                                </div>
                            		</c:when>
                            		
                            		<c:when test="${myClass != null && myClass.class_level == '중급' }">
                            			<div class="col-md-4 col-12">
		                                    <!-- Radio group -->
		                                    <div class="form-group">
		                                        <input class="form-check-input" name="class_level" type="hidden" id="radio100" >
		                                        <label for="radio100" class="form-check-label dark-grey-text">${myClass.class_level }</label>
		                                    </div>
		                                </div>
                            		</c:when>
                            		
                            		<c:when test="${myClass != null && myClass.class_level == '고급' }">
                            			<div class="col-md-4 col-12">
		                                    <!-- Radio group -->
		                                    <div class="form-group">
		                                        <input class="form-check-input" name="class_level" type="hidden" id="radio100" >
		                                        <label for="radio100" class="form-check-label dark-grey-text">${myClass.class_level }</label>
		                                    </div>
		                                </div>
                            		</c:when>
                            		
                            		<c:when test="${searchClass != null && searchClass.class_level == '초급' }">
                            			 <div class="col-md-4 col-12">
		                                    <!-- Radio group -->
		                                    <div class="form-group">
		                                        <input class="form-check-input" name="class_level" type="hidden" id="radio100" checked="checked">
		                                        <label for="radio100" class="form-check-label dark-grey-text">${searchClass.class_level }</label>
		                                    </div>
		                                </div>
                            		</c:when>
                            		
                            		<c:when test="${searchClass != null && searchClass.class_level == '중급' }">
                            			<div class="col-md-4 col-12">
		                                    <!-- Radio group -->
		                                    <div class="form-group">
		                                        <input class="form-check-input" name="class_level" type="hidden" id="radio100" checked="checked">
		                                        <label for="radio100" class="form-check-label dark-grey-text">${searchClass.class_level }</label>
		                                    </div>
		                                </div>
                            		</c:when>
                            		
                            		<c:when test="${searchClass != null && searchClass.class_level == '고급' }">
                            			<div class="col-md-4 col-12">
		                                    <!-- Radio group -->
		                                    <div class="form-group">
		                                        <input class="form-check-input" name="class_level" type="hidden" id="radio100" checked="checked">
		                                        <label for="radio100" class="form-check-label dark-grey-text">${searchClass.class_level }</label>
		                                    </div>
		                                </div>
                            		</c:when>
                            		
                            	</c:choose>
                            </div>
                            
                            <div class="row mt-3">
				               <div class="col-md-12 text-center text-md-left text-md-right">
				                   <c:if test="${searchMember != null }">
							 			<c:if test="${loginMember.m_code != searchMember.m_code }">
							 				<input type="button" class="w-30 h-75 text-center mx-auto p-3 mt-2 btn purple-gradient btn-lg btn-block" onclick="location.href='buyClassView.do'" value="결제하기">
							 			</c:if>
							 		</c:if>
				               </div>
				           </div>
				           
                        </div>
                    </section>
                    <!-- /.Add to Cart -->
                </div>
            </div>
        </section>
        <!--Section: Content-->
    </div>
	
	
	 
	 	
	 		<%-- <ul>
	 			<c:if test="${searchMember == null }">
	 				<c:if test="${loginMember != null }">
		 				<li>
							<label>아이디</label>
							<input type="text" name="nickname" value="${loginMember.nickname }" readonly="readonly">
						</li>
						<br>
						<li>
						<label>이메일</label>
							<input type="text" name="email" value="${loginMember.email }" readonly="readonly">
						</li>
	 				</c:if>
	 			</c:if>
	 			<c:if test="${searchMember != null }">
	 				<li>
						<label>아이디</label>
						<input type="text" name="nickname" value="${searchMember.nickname }" readonly="readonly">
					</li>
					<br>
					<li>
						<label>이메일</label>
						<input type="text" name="email" value="${searchMember.email }" readonly="readonly">
					</li>
	 			</c:if>
				
						
			</ul>
			<ul>
				<c:choose>
					<c:when test="${tutor != null}">
						<li>
							<label>경력</label> 
							<br> 
							<textarea class=".DOC_TEXT"
								rows="" cols="" minlength="100"
								style="resize: none; width: 400px; height: 300px;"
								autofocus="autofocus" name="career">
								${tutor.career }
							</textarea>
						</li>
						<li>
							<label>자기소개</label> 
							<br> 
							<textarea
								class="DOC_TEXT_intro" rows="" cols="" minlength="100"
								style="resize: none; width: 400px; height: 300px;"
								autofocus="autofocus" name="introduction">
								${tutor.introduction }
							</textarea>
						</li>			
					</c:when>
					<c:when test="${tutor == null}">
						<li>
							<label>경력</label> 
							<br> 
							<textarea class=".DOC_TEXT"
								rows="" cols="" minlength="100"
								style="resize: none; width: 400px; height: 300px;"
								autofocus="autofocus" name="career" readonly="readonly" >
								${searchTutor.career }
							</textarea>
						</li>
						<li>
							<label>자기소개</label> 
							<br> 
							<textarea
								class="DOC_TEXT_intro" rows="" cols="" minlength="100"
								style="resize: none; width: 400px; height: 300px;"
								autofocus="autofocus" name="introduction" readonly="readonly">
								${searchTutor.introduction }
							</textarea>
						</li>			
					</c:when>
				</c:choose>
			</ul>

	 	
	 	
	 		<form action="modifyClass.do" method="POST">
	 			<c:choose>
	 				<c:when test="${myClass != null}">
	 					<input type="hidden" name="s_code" value="${myClass.s_code }">
	 					<label>
	 						<img style="height: 50%; width: 50%;" src="${myClass.class_img }">
	 					</label>
	 					<br>
						<label> 
							<p>강의명 : <input type="text" value="${myClass.subject_name }" name="subject_name"></p>
						</label>
						<br>
						<label> 
							<p>강의 가격 : <input type="text" value="${myClass.pay }" name="pay" style="width: 100px;" ><span>원</span></p>
						</label>
						<br>
						<label> 
							<p>강의 계획 : 
								<textarea minlength="100"
										style="resize: none; width: 200px; height: 100px;"
										autofocus="autofocus" name="introduction">
									${myClass.class_plan }
								</textarea>
							</p>
						</label>
						<br>
						<label>
							<p>강의 횟수 : <input type="text" value="${myClass.class_totla_number }" name="class_totla_number" style="width: 50px;"><span>회</span></p>
						</label>
						<br>
	 				</c:when>
	 				
	 				<c:when test="${searchClass != null}">
	 					<input type="hidden" name="s_code" value="${searchClass.s_code }">
	 					<label>
	 						<img style="height: 50%; width: 50%;" src="${searchClass.class_img }">
	 					</label>
						<label> 
							<p>강의명 : <input type="text" value="${searchClass.class_name }" name="subject_name" readonly="readonly"></p>
						</label>
						<br>
						<label> 
							<p>강의 가격 : <input type="text" value="${searchClass.pay }" name="pay" style="width: 100px;" readonly="readonly" ><span>원</span></p>
						</label>
						<br>
						<label> 
							<p>강의 계획 :
								<textarea minlength="100"
										style="resize: none; width: 200px; height: 200px;"
										autofocus="autofocus" name="introduction" readonly="readonly">
									${searchClass.class_plan }
								</textarea>
							</p>
						</label>
						<br>
						<label>
							<p>강의 횟수 : <input type="text" value="${searchClass.class_totla_number }" name="class_totla_number" style="width: 50px;" readonly="readonly"><span>회</span></p>
						</label>
						<br>
						<label>
							<p>강의 수준 : <input type="text" value="${searchClass.class_level }" name="class_name" readonly="readonly"> </p>
						</label>
	 				</c:when>
	 				
	 			</c:choose>				
				<c:if test="${tutor.t_code == myClass.t_code}">
					<c:if test="${loginMember.istutor == true}">
						<input type="submit" value="수정하기">
						<input type="button" onclick="location.href='deleteClassView.do'" value="강의 삭제 " > 
				 	</c:if>
				</c:if>
				
	 		</form> --%>
	 		
	 		
	 		
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
                        <a href="company_introduce.do">회사 소개</a>
                    </p>
                    <p>
                        <a href="privacy-policy.do">개인정보처리방침</a>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<!-- Option 2: jQuery, Popper.js, and Bootstrap JS
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
-->
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>	 		
</body>
</html>