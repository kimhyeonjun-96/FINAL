<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tutor.css">
    <title>Learn UP!</title>
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

    <!-- tutor -->
    <div class="second">
        <div class="container">
            <h2 class="tutor_intro_title">
                <div class="tutor_intro_title_upper">
                    <span class="tutor_intro_title_first">튜터가 되려면</span>
                    <span class="tutor_intro_title_second">어떻게 해야 할까요?</span>
                </div>
                <span class="tutor_intro_title_third">LearnUp Studio!</span>
            </h2>
            <div class="tutor_wrapper">
                <div class="tutor_container">
                    <div class="tutor_illust create">
                        <img src="${pageContext.request.contextPath}/resources/images/tutor_illust.png">
                    </div>
                </div>
                <div class="tutor_text">
                    <h3 class="tutor_text_title">
                       	 간단하게 수업을 등록하세요
                    </h3>
                    <p class="tutor_text_subtitle">
                        LearnUp Studio에서 간단하게 수업을 등록한 후 바로 시작해보세요!
                    </p>
                </div>
            </div>
            <div class="tutor_wrapper">
                <div class="tutor_container">
                    <div class="tutor_illust condition">
                        <img src="${pageContext.request.contextPath}/resources/images//tutor_illust_2.png">
                    </div>
                </div>
                <div class="tutor_text">
                    <h3 class="tutor_text_title">
                        	수업 세부 사항을 등록하세요
                    </h3>
                    <p class="tutor_text_subtitle">
                        	스케줄, 수업료, 수업 방법 등 진행하실 수업에 대해 자세하게 설명해주세요.
                    </p>
                </div>
            </div>
            <div class="tutor_wrapper">
                <div class="tutor_container">
                    <div class="tutor_illust share">
                        <img src="${pageContext.request.contextPath}/resources/images//tutor_share.png">
                    </div>
                </div>
                <div class="tutor_text">
                    <h3 class="tutor_text_title">
                        	열정을 공유해요!
                    </h3>
                    <p class="tutor_text_subtitle">
                       	 수업을 등록하면 학생분들이 연락드리기 시작할 거예요. 수업 요청 메시지를 뜸하게 받으신다면 저희에게 연락주세요. 언제든지 도와드리겠습니다.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="third">
        <div class="container">
            <h2 class="tutor_pay_title">
             	   자유로운 수업료 정책
            </h2>
            <div class="tutor_pay_guaranteed">
                <div class="tutor_pay_guaranteed_wrapper">
                    <div class="tutor_pay_guaranteed_heading">
                        <span class="icon_size">💵</span>
                        <h3 class="tutor_pay_guaranteed_title">수업료를 책정하세요</h3>
                    </div>
                    <div class="tutor_pay_guaranteed_subtitle">
                     	   자유롭게 수업료를 설정하세요. 등록하실 수업 공고에 입력하시는 금액에서 수수료 10%를 뺀 나머지 금액이 정산 후 받으실 금액입니다.
                    </div>
                </div>
                <div class="tutor_pay_guaranteed_wrapper">
                    <div class="tutor_pay_guaranteed_heading">
                        <span class="icon_size">🤲</span>
                        <h3 class="tutor_pay_guaranteed_title">합리적인 거래 정책</h3>
                    </div>
                    <div class="tutor_pay_guaranteed_subtitle">
                      	  저희는 튜터분들과 학생들의 거래로부터 수수료 10%를 제외하고는 따로 징수하는 금액은 없습니다. 튜터분들은 월단위로 정산되어 금액을 받으실 수 있습니다. 😎
                    </div>
                </div>
                <div class="tutor_pay_guaranteed_wrapper">
                    <div class="tutor_pay_guaranteed_heading">
                        <span class="icon_size">💸</span>
                        <h3 class="tutor_pay_guaranteed_title">전세계의 학생들을 만나보세요</h3>
                    </div>
                    <div class="tutor_pay_guaranteed_subtitle">
                        LearnUp Studio는 28개국의 튜터와 학생들이 모인 글로벌 커뮤니티입니다. 한국어 수업에 소질이 있으신가요? 온라인 화상 수업을 등록하고 해외의 학생분들을 만나보세요.
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="fourth">
        <div class="container">
            <h2 class="learnup_title">LearnUp Studio는,</h2>
            <div class="tutor_stats">
                <div class="tutor_stats_wrapper">
                    <div class="tutor_stats_upper_wrapper">
                        <span class="tutor_stats_number">13</span>
                        <span class="tutor_stats_title">,000,000</span>
                    </div>
                    <p class="tutor_stats_subtitle">
                       	 명의 튜터들
                    </p>
                </div>
                <div class="tutor_stats_wrapper">
                    <div class="tutor_stats_upper_wrapper">
                        <span class="tutor_stats_number">8</span>
                        <span class="tutor_stats_title">,000,000</span>
                    </div>
                    <p class="tutor_stats_subtitle">
                     	   개의 수업들
                    </p>
                </div>
                <div class="tutor_stats_wrapper">
                    <div class="tutor_stats_upper_wrapper">
                        <span class="tutor_stats_number">+1000</span>
                    </div>
                    <p class="tutor_stats_subtitle">
                     	   개의 과목/분야
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="fifth">
        <div class="container">
            <h2 class="tutor_start_title">시작해볼까요? 😃</h2>
            
            <c:choose>
            	<c:when test="${loginMember == null }">
            			<button type="button" class="w-25 h-75 text-center mx-auto p-3 mt-2 btn purple-gradient btn-lg btn-block" onclick="location.href='loginView.do'">
            				로그인하기
            			</button> 
            	</c:when>
            	<c:when test="${loginMember != null }">
            		<button type="button" class="w-25 h-75 text-center mx-auto p-3 mt-2 btn purple-gradient btn-lg btn-block" onclick="location.href='beginningTutor.do'">
            			튜터 되기
            		</button>
            	</c:when>
            </c:choose>
            
        </div>
    </div>

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
  <!-- Footer -->
    <!-- <div class="text-center font-weight-bolder">
        <hr>
        <p>©2020 Learnup Company, Inc.</p>
    </div> -->

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