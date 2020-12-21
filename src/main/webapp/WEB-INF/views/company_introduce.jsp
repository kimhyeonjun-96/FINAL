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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/final.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/company_introduce.css">
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

    <!-- Company Introduce -->
    <div class="container z-depth-1 my-5 py-5 px-4 px-lg-0">
        <!-- Section -->
        <section>
            <h3 class="font-weight-bold text-center dark-grey-text pb-2">회사 소개</h3>
            <hr class="w-header my-4">
            <p class="lead text-center text-muted pt-2 mb-5">
                언텍트 시대에 걸맞게 언제 어디서든 누구나 쉽게 재능을 공유하며 가르치고 배우는 온라인 화상 커뮤니티이다.
            </p>
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <ol class="timeline">
                        <li class="timeline-element">
                            <h5 class="font-weight-bold dark-grey-text mb-3">아이디어 구상</h5>
                            <p class="grey-text font-small">
                                <time datetime="2020-11-01">2020/11초</time>
                            </p>
                            <p class="text-muted">
                                마지막 프로젝트를 앞두고 아이디어를 구상
                            </p>
                        </li>
                        <li class="timeline-element">
                            <h5 class="font-weight-bold dark-grey-text mb-3">팀원 모집</h5>
                            <p class="grey-text font-small">
                                <time datetime="2020-11-09">2020/11중순</time>
                            </p>
                            <p>
                                <img class="img-fluid z-depth-1-half rounded" src="https://mdbootstrap.com/img/Photos/Horizontal/Work/12-col/img%20(6).jpg" alt="...">
                            </p>
                            <p class="text-muted">
                                마지막 프로젝트로 할 LearnUp Studio 개발을 위한 팀원 모집
                            </p>
                        </li>
                        <li class="timeline-element">
                            <h5 class="font-weight-bold dark-grey-text mb-3">LearnUp Studio 개발 시작</h5>
                            <p class="grey-text font-small">
                                <time datetime="2020-11-16">2020/11말</time>
                            </p>
                            <p class="text-muted">
                                비트캠프 학원에서의 마지막 프로젝트로 구상된 LearnUp Studio의 개발 시작
                            </p>
                        </li>
                        <li class="timeline-element">
                            <h5 class="font-weight-bold dark-grey-text mb-3">LearnUp Studio의 베타 버전 출시</h5>
                            <p class="grey-text font-small">
                                <time datetime="2020-12-07">2020/12초</time>
                            </p>
                            <p class="text-muted">
                                LearnUp Studio의 베타 버전을 공개 및 발표
                            </p>
                        </li>
                        <li class="timeline-element">
                            <h5 class="font-weight-bold dark-grey-text mb-3">한걸음 더 🚶</h5>
                            <p class="grey-text font-small">
                                <time datetime="2020-12-08">2020/12초</time>
                            </p>
                            <p class="text-muted">
                                LearnUp Studio의 공식 서비스를 하기 위해 기능을 보완하는 중. 우리 함께해요! 🙏
                            </p>
                        </li>
                    </ol>
                </div>
            </div>
        </section>
        <!-- Section -->
    </div>

    <div class="container my-5 p-5 z-depth-1"> 
        <!--Section: Content-->
        <section class="team-section text-center dark-grey-text">
            <h6 class="font-weight-bold text-center grey-text text-uppercase small mb-4">Our Team</h6>
            <!-- Section heading -->
            <h2 class="font-weight-bold text-center dark-grey-text pb-2">창업자</h2>
            <hr class="w-header my-4">
            <!-- Section description -->
            <p class="lead text-center text-muted pt-2 mb-5">
                우리의 훌륭한 LearnUp Studio 팀원
            </p>
            <!-- Grid row -->
            <div class="row">
                <!-- Grid column -->
                <div class="col-md-6 mb-6">
                    <div class="w-200 mx-auto mb-4">
                        <img src="${pageContext.request.contextPath}/resources/developerImg/지현이형!.jpg" class="z-depth-1 rounded-circle img-fluid" alt="smaple image">
                    </div>
                    <h6 class="font-weight-bold">JIHYUN KIM</h6>
                    <small class="text-muted">Co-funder & CEO</small>
                    <p class="mt-3 mb-4 text-muted">남들이 어렵다고 안된다고 할 때 열정을 가지고 도전해보자! 🔥🙌</p>
                    <ul class="social-network social-circle">
                        <li>
                            <a href="https://www.facebook.com/jihyun.kim.94214508" class="icoFacebook" title="Facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.instagram.com/zzzz___kim" class="icoInstagram" title="Instagram">
                                <i class="fa fa-instagram"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- Grid column -->
            
                <!-- Grid column -->
                <div class="col-md-6 mb-6">
                    <div class="w-200 mx-auto mb-4">
                        <img src="${pageContext.request.contextPath}/resources/developerImg/김현준.jpg" class="z-depth-1 rounded-circle img-fluid mx-auto" alt="smaple image">
                    </div>
                    <h6 class="font-weight-bold">HYUNJUN KIM</h6>
                    <small class="text-muted">Lead Developer & CEO</small>
                    <p class="mt-3 mb-4 text-muted">퐈이팅~ 퐈이팅! 모든 일에 최선을 다하자! 🙆‍♂️👍</p>
                    <ul class="social-network social-circle">
                        <li>
                            <a href="#" class="icoFacebook" title="Facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="icoInstagram" title="Instagram">
                                <i class="fa fa-instagram"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </section>
        <!--Section: Content-->
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