<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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

<!-- main CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/final.css">

<!-- jquery load -->
<script src="http://code.jQuery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$('#popbutton').click(function(){
			$('div.modal').modal();
		})
		
	});
	
</script>


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

	<!-- 원하는 과목/지역 검색 디자인 -->
	<!-- 분야별 튜터 소개 -->
	<!-- 지역별 튜터 검색 -->
	<!--  -->


	<!-- 마이페이지 이동하기 버튼 -->


	<!-- Carousel -->
	<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath}/resources/mainImg/자바.png" class="d-block w-100 h-10" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/resources/mainImg/포토.png" class="d-block w-100 h-10" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/resources/mainImg/헬스.png" class="d-block w-100 h-10" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev"> 
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
			<spanclass="sr-only"></span>
		</a> 
		<a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next"> 
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<spanclass="sr-only"></span>
		</a>
	</div>

	<!-- Content -->
    <div class="first">
        <div class="container">
            <div class="row my-5">
                <div class="col-6 intro">
                    <h2 class="intro_title"> 
                    	열정을 공유해요!
                    </h2>
                    <p class="intro_text">
			                        전세계 9백만 명의 튜터, 코치, 멘토분들이 모인 커뮤니티 LearnUp Studio의 일원이 되어 보세요.
			                        저희 튜터분들은 단순히 수업을 하는 것이 아니라 학생분들께 "기회"를 제공하기 위해 노력하고 있습니다.
                    </p>
                </div>
                <div class="col-6">
                    <img src="${pageContext.request.contextPath}/resources/images/열정.png" alt="" class="w-100">
                </div>
            </div>

            <hr>

            <div class="row my-5">
                <div class="col-6">
                    <img src="${pageContext.request.contextPath}/resources/images/경험_2.png" alt="" class="w-100">
                </div>
                <div class="col-6 intro">
                    <h2 class="intro_title">
                      	  나만의 수업으로 다양한 경험을 쌓아보세요!
                    </h2>
                    <p class="intro_text">
			                        우리에게 제일 중요한 것은 사람입니다.
			                        배움은 사람이 가진 기본적인 욕구 중 하나라고 생각하며, 
			                        학생분들이 자신에게 꼭 맞는 수업을 할 수 있는 튜터분들을 만날 수 있도록
			                        다양한 포트폴리오의 수업을 추천 및 제공하고 있습니다.
                    </p>
                </div> 
            </div>

            <hr>

            <div class="row my-5">
                <div class="col-6 intro">
                    <h2 class="intro_title">
                        	재능의 공식!
                    </h2>
                    <p class="intro_text">
			                        <!-- 나 자신이 하나쯤은 가지고 있는 <strong>재능</strong><br>
			                        그 재능이 또 하나의 직업이 된다.<br>
			                        남녀노소 누구나! 자신이 가장 자신있는 재능을 실시간으로 강의하며 지식을 공유하자!<br>
			                        그 동안 남들은 모르는 자신만의 재능을 방치해두셨다면 지금 당장 시작하세요!<br>
			                        때로는 가르치는 <strong>Tutor</strong>의 입장에서.<br>
			                        때로는 강의를 듣는 <strong>Student</strong>의 입장으로. -->
                       	<strong>능력 + 노력 = 재능</strong><br>
			                        재능은 타고난 능력과 훈련에 의해 획득된 능력을 아울러 이르는 것입니다.
			                        여러분에게는 능력이 있습니다. 아직 훈련이 완전치 않을 뿐입니다.
			                        학생분들과 튜터 모두 함께 훈련되고 재능을 만들어가는 사이트.<br>
                        LearnUp이 함께 하겠습니다.
                    </p>
                </div>
                <div class="col-6">
                    <img src="${pageContext.request.contextPath}/resources/images/재능.png" alt="" class="w-100">
                </div>
            </div>
        </div>
    </div>
	
	<!-- Class -->
    <div class="container my-5">
        <!-- Section -->
        <section>
            <style>
	            .md-pills .nav-link.active {
	              color: #fff;
	              background-color: #616161;
	            }
	
	            button.close {
	              position: absolute;
	              right: 0;
	              z-index: 2;
	              padding-right: 1rem;
	              padding-top: .6rem;
	            }
            </style>
           
         <%--  	DB 저장 데이터 : ${getAllClass }
          	<br>
          	카테고리 01 : ${categoryList1 }
          	<br>
          	카테고리 02 : ${categoryList2 }
          	<br>
                        카테고리 03 :  ${categoryList3 }
            <br>            
                        카테고리 04 : ${categoryList4 }
            <br>            
                        카테고리 05 : ${categoryList5 }
            <br>  --%>
            
            <h6 class="font-weight-bold text-center grey-text text-uppercase small mb-4">Class</h6>
            <h3 class="font-weight-bold text-center dark-grey-text pb-2">가장 인기있는 강의</h3>
            <hr class="w-header my-4">
            <p class="lead text-center text-muted pt-2 mb-5">분야별 가장 인기있는 강의</p>  
            <!--First row-->
           
            <div class="row">
                <!--First column-->
                <div class="col-12">
                    <!-- Nav tabs -->
                    <ul class="nav md-pills flex-center flex-wrap mb-5" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active font-weight-bold text-uppercase" data-toggle="tab" href="#all" role="tab">all</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#it" role="tab">it</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#디자인" role="tab">design</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#언어" role="tab">language</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#건강" role="tab">health</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#취미" role="tab">interest</a>
                        </li>
                    </ul>
                   	<%-- <ul class="nav md-pills flex-center flex-wrap mb-5" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active font-weight-bold text-uppercase" data-toggle="tab" href="#all" role="tab">all</a>
                        </li>
                         <c:forEach var="categoryName" items="${getAllClass }" varStatus="idx">
                          	<c:set var="category" value="${categoryName.getCategory().category_name }"/>
	                        <li class="nav-item">
	                            <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#${category}" role="tab">${categoryName.getCategory().category_name }</a>
	                        </li>
                        </c:forEach>
                    </ul> --%>
                </div>
                <!--First column-->
            </div>
            <!--First row-->
            
            <!--Tab panels-->
            <div class="tab-content mb-5">
                <!--Panel 1-->
                <div class="tab-pane fade show in active" id="all" role="tabpanel">
		              <!-- Grid row -->
		              <div class="row"> 
	               		<!-- Grid column -->
	               		<c:forEach var="allClass" items="${getAllClass }"  end="${getAllClass.size() }" varStatus="status">
		               		<div class="col-md-12 col-lg-4">
		                           <!-- Card -->
		                           <!-- id="popbutton" -->
		                           		
		                           		<%-- <button type="submit" name="s_code" value="${allClass.getClasss().s_code }">
		                           			
		                           		</button> --%>
		                           		<a class="card hoverable mb-4" type="submit" onclick="location.href='searchAllClass_2.do?s_code=' + ${allClass.getClasss().s_code }">
			                               <!-- Card image -->
			                               <input type="hidden" name="s_code" value="${allClass.getClasss().s_code }">
			                               <c:if test="${allClass.getClasss().class_img == null }">
			                               		<img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/이미지준비중.png" >
			                               </c:if>
			                               <img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/${allClass.getClasss().class_img }" >
			                               <!-- Card content -->
			                               <div class="card-body">
			                                   <h5 class="my-3">${allClass.getClasss().class_name }</h5>
			                                   <p class="card-text text-uppercase mb-3">${allClass.getCategory().category_name }</p>
			                               </div>
			                           </a>
		                           <!-- Card -->
		                      </div>
	                       </c:forEach>
	                      <!-- Grid column -->
		              </div>
                </div>
                <!--Panel 1-->
                
                <!--Panel 2-->
                <div class="tab-pane fade"  role="tabpanel" id="it">
                    <!-- Grid row -->
                    <c:if test="${categoryList1 eq null} ">
                    	
                    	<h5 class="my-3">아직 준비 된 강의가 없습니다.</h5>
                    	
                    </c:if>
                    <div class="row">
                    	<!--  Grid column -->
                    	<c:forEach var="itVO" items="${categoryList1 }">
                    		<div class="col-md-12 col-lg-4">
                            	<!-- Card -->
	                            <a class="card hoverable mb-4" onclick="location.href='searchAllClass_2.do?s_code=' + ${itVO.getClasss().s_code }">
	                                <!-- Card image -->
	                                <c:if test="${itVO.getClasss().class_img == null }">
	                                	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/이미지준비중.png">
	                                </c:if>
	                                <img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/${itVO.getClasss().class_img }" >
	                                <!-- Card content -->
	                                <div class="card-body">
	                                    <h5 class="my-3">${itVO.getClasss().class_name }</h5>
	                                    <p class="card-text text-uppercase mb-3">${itVO.getCategory().category_name }</p>
	                                </div>
	                            </a>
	                            <!-- Card -->
	                        </div>
                    	</c:forEach>
                    </div>
                </div>
               <!--  Panel 2 -->
      
                <!--Panel 3-->
                <div class="tab-pane fade"  role="tabpanel" id="디자인">
                    <!-- Grid row -->
                    <c:if test="${categoryList2 eq null} ">
                    	
                    	<h5 class="my-3">아직 준비 된 강의가 없습니다.</h5>
                    	
                    </c:if>
                    <div class="row">
                    	<!--  Grid column -->
                    	<c:forEach var="designVO" items="${categoryList2 }">
                    		<div class="col-md-12 col-lg-4">
                            	<!-- Card -->
	                            <a class="card hoverable mb-4" onclick="location.href='searchAllClass_2.do?s_code=' + ${designVO.getClasss().s_code }">
	                                <!-- Card image -->
	                                <c:if test="${designVO.getClasss().class_img == null }">
	                                	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/이미지준비중.png">
	                                </c:if>
	                                <img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/${designVO.getClasss().class_img }" >
	                                <!-- Card content -->
	                                <div class="card-body">
	                                    <h5 class="my-3">${designVO.getClasss().class_name }</h5>
	                                    <p class="card-text text-uppercase mb-3">${designVO.getCategory().category_name }</p>
	                                </div>
	                            </a>
	                            <!-- Card -->
	                        </div>
                    	</c:forEach>
                    </div>
                </div>
               <!--  Panel 3 -->
               
                <!--Panel 4-->
                <div class="tab-pane fade"  role="tabpanel" id="언어">
                    <!-- Grid row -->
                    <c:if test="${categoryList3 eq null} ">
                    	
                    	<h5 class="my-3">아직 준비 된 강의가 없습니다.</h5>
                    	
                    </c:if>
                    <div class="row">
                    	<!--  Grid column -->
                    	<c:forEach var="lanVO" items="${categoryList3 }">
                    		<div class="col-md-12 col-lg-4">
                            	<!-- Card -->
	                            <a class="card hoverable mb-4" onclick="location.href='searchAllClass_2.do?s_code=' + ${lanVO.getClasss().s_code }">
	                                <!-- Card image -->
	                                <c:if test="${lanVO.getClasss().class_img == null }">
	                                	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/이미지준비중.png">
	                                </c:if>
	                                <img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/${lanVO.getClasss().class_img }" >
	                                <!-- Card content -->
	                                <div class="card-body">
	                                    <h5 class="my-3">${lanVO.getClasss().class_name }</h5>
	                                    <p class="card-text text-uppercase mb-3">${lanVO.getCategory().category_name }</p>
	                                </div>
	                            </a>
	                            <!-- Card -->
	                        </div>
                    	</c:forEach>
                    </div>
                </div>
               <!--  Panel 4 -->
               
                <!--Panel 5-->
                <div class="tab-pane fade"  role="tabpanel" id="건강">
                    <!-- Grid row -->
                    <c:if test="${categoryList4 eq null} ">
                    	
                    	<h5 class="my-3">아직 준비 된 강의가 없습니다.</h5>
                    	
                    </c:if>
                    <div class="row">
                    	<!--  Grid column -->
                    	<c:forEach var="healthVO" items="${categoryList4 }">
                    		<div class="col-md-12 col-lg-4">
                            	<!-- Card -->
	                            <a class="card hoverable mb-4" onclick="location.href='searchAllClass_2.do?s_code=' + ${healthVO.getClasss().s_code }">
	                                <!-- Card image -->
	                                <c:if test="${healthVO.getClasss().class_img == null }">
	                                	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/이미지준비중.png">
	                                </c:if>
	                                <img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/${healthVO.getClasss().class_img }" >
	                                <!-- Card content -->
	                                <div class="card-body">
	                                    <h5 class="my-3">${healthVO.getClasss().class_name }</h5>
	                                    <p class="card-text text-uppercase mb-3">${healthVO.getCategory().category_name }</p>
	                                </div>
	                            </a>
	                            <!-- Card -->
	                        </div>
                    	</c:forEach>
                    </div>
                </div>
               <!--  Panel 5 -->
               
               <!--Panel 6-->
                <div class="tab-pane fade"  role="tabpanel" id="취미">
                    <!-- Grid row -->
                    <c:if test="${categoryList5 eq null} ">
                    	
                    	<h5 class="my-3">아직 준비 된 강의가 없습니다.</h5>
                    	
                    </c:if>
                    <div class="row">
                    	<!--  Grid column -->
                    	<c:forEach var="intVO" items="${categoryList5 }">
                    		<div class="col-md-12 col-lg-4">
                            	<!-- Card -->
	                            <a class="card hoverable mb-4" onclick="location.href='searchAllClass_2.do?s_code=' + ${intVO.getClasss().s_code }">
	                                <!-- Card image -->
	                                <c:if test="${intVO.getClasss().class_img == null }">
	                                	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/이미지준비중.png">
	                                </c:if>
	                                <img class="card-img-top" src="${pageContext.request.contextPath}/resources/classImg/${intVO.getClasss().class_img }" >
	                                <!-- Card content -->
	                                <div class="card-body">
	                                    <h5 class="my-3">${intVO.getClasss().class_name }</h5>
	                                    <p class="card-text text-uppercase mb-3">${intVO.getCategory().category_name }</p>
	                                </div>
	                            </a>
	                            <!-- Card -->
	                        </div>
                    	</c:forEach>
                    </div>
                </div>
               <!--  Panel 6 -->
            <!--Tab panels-->
            
             <!-- Modal -->
          	<%-- <div class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              	<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                   <div class="modal-content">
                       <div class="modal-body p-0">
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                               <span aria-hidden="true">&times;</span>
                           </button>
                           <!-- Grid row -->
                           <div class="row">
                               <!-- Grid column -->
                               <div class="col-md-6 py-5 pl-5">
                                   <h5 class="font-weight-normal mb-3">강의 내용</h5>
                                   <p class="text-muted">
                                   	${allClass.getClasss().class_plan }
                                   	${classList.getClasss().class_plan }
                                   </p>
                                   <ul class="list-unstyled font-small mt-5">
                                       <li>
                                           <p class="text-uppercase mb-2"><strong>Tutor</strong></p>
                                           <p class="text-muted mb-4">${allClass.getMember().nickname }</p>
                                       </li>
                                       <li>
                                           <p class="text-uppercase mb-2"><strong>Pay</strong></p>
                                           <p class="text-muted mb-4">${allClass.getClasss().pay }원</p>
                                       </li>
                                       <!-- <li>
                                           <p class="text-uppercase mb-2"><strong>Skills</strong></p>
                                           <p class="text-muted mb-4">Python</p>
                                       </li> -->
                                       <li>
                                           <p class="text-uppercase mb-2"><strong>Address</strong></p>
                                           <form action="searchAllClass_2.do" method="POST">
                                           	<a type="submit" href='searchAllClass.do'>세부 내용 보기</a>
                                           	<button type="submit" >세부 내용 보기</button>
                                           </form>
                                           
                                       </li>
                                   </ul>    
                               </div>
                               <!-- Grid column -->
                             
                               <!-- Grid column -->
                               <div class="col-md-6">
                                   <div class="view rounded-right">
                                       <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Vertical/5.jpg" alt="Sample image">
                                   </div>
                               </div>
                               <!-- Grid column -->
                           </div>
                           <!-- Grid row -->
                       </div>
                   </div>
              	</div>
         	 	</div> --%>
        </section>
        <!-- Section -->
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
                        <a href="${pageContext.request.contextPath}/company_introduce.do">회사 소개</a>
                    </p>
                    <p>
                        <a href="#!">MDWordPress</a>
                    </p>
                    <p>
                        <a href="${pageContext.request.contextPath}/privacy-policy.do">개인정보처리방침</a>
                    </p>
                    <p>
                        <a href="#!">Bootstrap Angular</a>
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

	 <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	
	<!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
</body>
</html>






