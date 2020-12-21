<%@page import="com.lesson.site.tutor.TutorVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!doctype html>
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

    <!-- Stepper CSS -->
    <link href="css/addons-pro/steppers.css" rel="stylesheet">
    <!-- Stepper CSS - minified-->
    <link href="css/addons-pro/steppers.min.css" rel="stylesheet">

 <!-- CSS -->
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/final.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tutor_accept.css">
<title>튜터 되기</title>
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
	<!-- Tutor Accept -->
    <!-- Steps form -->
    <div class="container">
        <div class="card">
            <div class="card-body mb-4">
                <h2 class="text-center font-weight-bold pt-4 pb-5">
                  	  💡 튜터 되기 💡
                </h2>
                <p class="text-center">
                   	 튜터가 되기 위해서는 간단한 절차를 밟아야 합니다
                </p>
                <hr class="my-5">
                <!-- Stepper -->
                <div class="steps-form">
                    <div class="steps-row setup-panel">
                        <div class="steps-step">
                            <a href="#step-9" type="button" class="btn btn-indigo btn-circle">1</a>
                            <p>Step 1</p>
                        </div>
                        <div class="steps-step">
                            <a href="#step-10" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                            <p>Step 2</p>
                        </div>
                        <div class="steps-step">
                            <a href="#step-11" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                            <p>Step 3</p>
                        </div>
                    </div>
                </div>
                <form role="form" action="beginningTutor.do" method="POST">
                    <!-- First Step -->
                    <input type="hidden" name="m_code" value="${loginMember.m_code}">
                    <div class="row setup-content" id="step-9">
                        <div class="col-md-12">
                            <h3 class="font-weight-bold pl-0 my-4">
                                <p class="font-weight-bold">자기 소개</p>
                            </h3>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea3">
                                    	학생들에게 보여주는 내용이니 자세히 입력해주세요 😁
                                </label>
                                <textarea class="form-control" id="exampleFormControlTextarea3" rows="7" minlength="100" name="introduction"></textarea>
                            </div>
                            <button class="btn btn-indigo btn-rounded nextBtn float-right" type="button">Next</button>
                        </div>
                    </div>

                    <!-- Second Step -->
                    <div class="row setup-content" id="step-10">
                        <div class="col-md-12">
                            <h3 class="font-weight-bold pl-0 my-4">
                                <p class="font-weight-bold">경력</p>
                            </h3>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea3">
                                    	자신의 화려한 경력을 자세하게 입력해주세요 😁
                                </label>
                                <textarea class="form-control" id="exampleFormControlTextarea3" rows="7" minlength="100" name="career"></textarea>
                            </div>
                            <button class="btn btn-indigo btn-rounded prevBtn float-left" type="button">Previous</button>
                            <button class="btn btn-indigo btn-rounded nextBtn float-right" type="button">Next</button>
                        </div>
                    </div>
    
                    <!-- Third Step -->
                    <div class="row setup-content" id="step-11">
                        <div class="col-md-12">
                            <h3 class="font-weight-bold pl-0 my-4">
                                <p class="font-weight-bold text-center">❗ Mission Complete ❗</p>
                            </h3>
                            <div class="form-group text-center pt-4 pb-4">
                                <label for="exampleFormControlTextarea3">
                                    	지금까지 입력하신 정보로 Tutor가 되시려면 Submit을 Click✔️해주세요 😁
                                </label>
                            </div>
                            <button class="btn btn-indigo btn-rounded prevBtn float-left" type="button">Previous</button>
                            <button class="btn btn-default btn-rounded float-right" type="submit">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Steps form -->

	
<%-- 	<div class="beginning_tutor_container">
		<form action="beginningTutor.do" method="POST">
			
 			<h1>${loginMember.nickname }님의 경력을 적어 주세요!</h1>			
			<h3>경력</h3>
			<input type="hidden" name="m_code" value="${loginMember.m_code}">
			<textarea style="width:600px; resize: none;" class="DOC_TEXT" name="career" 
					placeholder="경역내용을 최소 100자  이상으로 기재해주세요." minlength="100"
					cols="100" rows="20" autofocus="autofocus">
			</textarea>
			<br />
			<!-- <span id="warn" style="color:red"></span> -->
			<span style="color:#aaa;" id="counter">(0 / 최소 100자)</span>
			

			<h3>자기소개</h3>
			<textarea style="width:600px; resize: none;" class="DOC_TEXT_intro" name="introduction" 
					placeholder="자신의 소개내용을 최소 100자  이상으로 기재해주세요." minlength="100"
					cols="100" rows="20" autofocus="autofocus" >
			</textarea>
			<br />
			<!-- <span id="warn_intro" style="color:red"></span> -->
			<span style="color:#aaa;" id="counter_intro">(0 / 최소 100자)</span>
			<br><br>
			
			<input type="submit" value="튜터되기">
		</form>
	</div> --%>
<script type="text/javascript">
	
	
	$(".DOC_TEXT").keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html('('+content.length+' / 최소 100자)');    //글자수 실시간 카운팅
	
	    if (content.length <= 100){
	        $(this).val(content.substring(0, 100));
	        $('#warn').html('100자 이상이 아닙니다. 더 작성하여 주세요.');
	    }
	    /* if(content.length > 100){
	    	$('#warn').html('100자 이상입니다!');
	    } */
	});
	
	$(".DOC_TEXT_intro").keyup(function (e){
	    var content = $(this).val();
	    $('#counter_intro').html('('+content.length+' / 최소 100자)');    //글자수 실시간 카운팅
	
	    if (content.length <= 100){
	        $(this).val(content.substring(0, 100));
	        $('#warn_intro').html('100자 이상이 아닙니다. 더 작성하여 주세요.');
	    }
	   /*  if(content.length > 100){
	    	$('#warn_intro').html('100자 이상입니다!');
	    } */
	});
</script>	

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tutor_accept.js"></script>
    <!-- Stepper JavaScript -->
    <script type="text/javascript" src="js/addons-pro/steppers.js"></script>
    <!-- Stepper JavaScript - minified -->
    <script type="text/javascript" src="js/addons-pro/steppers.min.js"></script>
</body>
</html>







