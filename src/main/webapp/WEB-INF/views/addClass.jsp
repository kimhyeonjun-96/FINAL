<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
    <!-- Stepper CSS -->
    <link href="css/addons-pro/steppers.css" rel="stylesheet">
    <!-- Stepper CSS - minified-->
    <link href="css/addons-pro/steppers.min.css" rel="stylesheet">

  
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/final.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tutor_accept.css">
	<title>강의 등록하기</title>
	
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script type="text/javascript">

	function fileInfo(f){
		var file = f.files; // files 를 사용하면 파일의 정보를 알 수 있음
		// file 은 배열이므로 file[0] 으로 접근해야 함
	
		if(file[0].size > 1024 * 1024){
			// 큰 파일을 올리니까 브라우저가 다운되었음 -_-;;
			alert('1MB 이상의 파일은 안되용! (진지)');
			return;
		}
		else if(file[0].type.indexOf('image') < 0){ // 선택한 파일이 이미지인지 확인
			alert('이미지 파일만 선택하세요. ㅂㄷㅂㄷ');
			return;
		}
	
		var reader = new FileReader(); // FileReader 객체 사용
		reader.onload = function(rst){
			$('#img_box').append('<img style="width:500px;" src="' + rst.target.result + '">'); // append 메소드를 사용해서 이미지 추가
			// 이미지는 base64 문자열로 추가
			// 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
		}
		reader.readAsDataURL(file[0]); // 파일을 읽는다
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

	 <!-- Add Class -->
    <!-- Steps form -->
    <div class="container">
        <div class="card">
            <div class="card-body mb-4">
                <h2 class="text-center font-weight-bold pt-4 pb-5">
                    	💡 강의 등록하기 💡
                </h2>
                <p class="text-center">
                    	강의를 등록하기 위해서는 간단한 절차를 밟아야 합니다
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
                        <div class="steps-step">
                            <a href="#step-12" type="button" class="btn btn-default btn-circle" disabled="disabled">4</a>
                            <p>Step 4</p>
                        </div>
                        <div class="steps-step">
                            <a href="#step-13" type="button" class="btn btn-default btn-circle" disabled="disabled">5</a>
                            <p>Step 5</p>
                        </div>
                        <div class="steps-step">
                            <a href="#step-14" type="button" class="btn btn-default btn-circle" disabled="disabled">6</a>
                            <p>Step 6</p>
                        </div>
                        <div class="steps-step">
                            <a href="#step-15" type="button" class="btn btn-default btn-circle" disabled="disabled">7</a>
                            <p>Step 7</p>
                        </div>
                        <div class="steps-step">
                            <a href="#step-16" type="button" class="btn btn-default btn-circle" disabled="disabled">8</a>
                            <p>Step 8</p>
                        </div>
                    </div>
                </div>
                <form role="form" action="addClass.do" method="post">
                    <!-- Step 1 -->
                    <div class="row setup-content" id="step-9">
                        <div class="col-md-12">
                            <h3 class="font-weight-bold pl-0 my-4">
                                <p class="font-weight-bold">강의 카테고리 선택</p>
                            </h3>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea3">
                                    	등록하실 강의에 대한 카테고리를 선택하세요 😁
                                </label>
                                <br>
                                <!-- <div class="btn-group"> -->
                                    <!-- Basic dropdown -->
                                   <!--  <button class="btn btn-indigo btn-lg dropdown-toggle mr-4" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        	카테고리를 선택하세요
                                        <span class="caret"></span>
                                    </button> -->
                                    <input type="hidden" name="t_code" value="${tutor.t_code }">
                                    <!-- <div class="dropdown-menu"> -->
                                    	<%-- <c:forEach var="categoryVO" items="${categoryList }">
                                    	   <input type="hidden" name="c_code" value="${categoryVO.c_code }">
	                                       <a class="dropdown-item" href="#" name="subject_name">${categoryVO.category_name }</a>
	                                       <div class="dropdown-divider"></div>
                                    	</c:forEach> --%>
                                    	<!-- <a class="dropdown-item" href="#" name="subject_name">DESIGN</a>
                                       <div class="dropdown-divider"></div>
                                       <a class="dropdown-item" href="#" name="subject_name">HEALTH</a>
                                       <div class="dropdown-divider"></div>
                                       <a class="dropdown-item" href="#" name="subject_name">LANGUAGE</a>
                                       <div class="dropdown-divider"></div>
                                       <a class="dropdown-item" href="#" name="subject_name">HOBBY</a> -->
                                       <c:forEach var="categoryVO" items="${categoryList }">
	                                       	<label class="radio-inline">
			                                    <input type="radio" name="subject_name" value="${categoryVO.category_name }" class="mr-2">${categoryVO.category_name }&nbsp;&nbsp;
			                               </label>
                                       </c:forEach>
<!--                                     </div> -->
                                    
									<%-- <c:forEach var="categoryVO" items="${categoryList }">
										<label>
											<input type="hidden" name="c_code" value="${categoryVO.c_code }">
											<input type="radio" name="subject_name" value="${categoryVO.category_name }" readonly="readonly"> 
										</label>
									</c:forEach> --%>
                                    <!-- Basic dropdown -->
                                <!-- </div> -->
                            </div>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <button class="btn btn-indigo btn-rounded nextBtn float-right" type="button">Next</button>
                        </div>
                    </div>

                    <!-- Step 2 -->
                    <div class="row setup-content" id="step-10">
                        <div class="col-md-12">
                            <h3 class="font-weight-bold pl-0 my-4">
                                <p class="font-weight-bold">강의 대표 사진 선택</p>
                            </h3>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea3">
                                    	강의를 등록 후 학생들에게 보여질 이미지이니 잘 선택해주세요 😁
                                </label>
                                <br>
                              <!--   <button type="button" class="btn btn-indigo">이미지 선택</button> -->
                                <input type="file" name="class_img" accept="image/*" onchange="fileInfo(this)" value="이미지 선택">
								<div id="img_box"></div>
                            </div>
                            <br>
                            <br>
                            <br>
                            <button class="btn btn-indigo btn-rounded prevBtn float-left" type="button">Previous</button>
                            <button class="btn btn-indigo btn-rounded nextBtn float-right" type="button">Next</button>
                        </div>
                    </div>

                    <!-- Step 3 -->
                    <div class="row setup-content" id="step-11">
                        <div class="col-md-12">
                            <h3 class="font-weight-bold pl-0 my-4">
                                <p class="font-weight-bold">강의 레벨 선택</p>
                            </h3>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea3">
                                   	 강의의 수준을 선택해주세요 😁
                                </label>
                                <br>
                                <br>
                                <br>
                                <label class="radio-inline">
                                    <input type="radio" name="class_level" value="초급" class="mr-2">초급&nbsp;&nbsp;
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="class_level" value="중급" class="mr-2">중급&nbsp;&nbsp;
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="class_level" value="고급" class="mr-2">고급
                                </label>
                                <!-- <select name="class_level">
									 <option value="none" selected="selected">선택</option>
									 <option value="초급">초급</option>
									 <option value="중급">중급</option>
									 <option value="고급">고급</option>
								</select> -->
                            </div>
                            <br>
                            <br>
                            <button class="btn btn-indigo btn-rounded prevBtn float-left" type="button">Previous</button>
                            <button class="btn btn-indigo btn-rounded nextBtn float-right" type="button">Next</button>
                        </div>
                    </div>

                    <!-- Step 4 -->
                    <div class="row setup-content" id="step-12">
                        <div class="col-md-12">
                            <h3 class="font-weight-bold pl-0 my-4">
                                <p class="font-weight-bold">강의명</p>
                            </h3>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea3">
                                  	  강의명을 지어주세요. 학생들에게 보일 이름이니 잘 지어주세요 😁
                                </label>
                                <br>
                                <!-- <input type="text" class="form-control" rows="7" minlength="100"> -->
                                <input type="text" name="class_name" class="form-control" rows="7">
                            </div>
                            <button class="btn btn-indigo btn-rounded prevBtn float-left" type="button">Previous</button>
                            <button class="btn btn-indigo btn-rounded nextBtn float-right" type="button">Next</button>
                        </div>
                    </div>

                    <!-- Step 5 -->
                    <div class="row setup-content" id="step-13">
                        <div class="col-md-12">
                            <h3 class="font-weight-bold pl-0 my-4">
                                <p class="font-weight-bold">강의 금액</p>
                            </h3>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea3">
                                    	강의 금액을 제시하세요. 너무 터무니 없는 가격은 안됩니다 😁
                                </label>
                                <br>
                                <!-- <input type="text" class="form-control" rows="7" minlength="100"> -->
                                <input type="text" name="pay" class="form-control" rows="7" minlength="100"><span style="color:black">/원</span>
                            </div>
                            <button class="btn btn-indigo btn-rounded prevBtn float-left" type="button">Previous</button>
                            <button class="btn btn-indigo btn-rounded nextBtn float-right" type="button">Next</button>
                        </div>
                    </div>

                    <!-- Step 6 -->
                    <div class="row setup-content" id="step-14">
                        <div class="col-md-12">
                            <h3 class="font-weight-bold pl-0 my-4">
                                <p class="font-weight-bold">강의 계획서</p>
                            </h3>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea3">
                                   	 강의 계획서를 작성해주세요. 학생들에게 보여줄 내용이니 자세히 작성해주세요 😁
                                </label>
                                <br>
                                <!-- <textarea class="form-control" id="exampleFormControlTextarea3" rows="7" minlength="100"></textarea> -->
                                <textarea class="form-control" id="exampleFormControlTextarea3" rows="7" minlength="100" style="resize: none" name="class_plan"></textarea>
                            </div>
                            <button class="btn btn-indigo btn-rounded prevBtn float-left" type="button">Previous</button>
                            <button class="btn btn-indigo btn-rounded nextBtn float-right" type="button">Next</button>
                        </div>
                    </div>

                    <!-- Step 7 -->
                    <div class="row setup-content" id="step-15">
                        <div class="col-md-12">
                            <h3 class="font-weight-bold pl-0 my-4">
                                <p class="font-weight-bold">강의 횟수</p>
                            </h3>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea3">
                                    	강의 횟수를 정해주세요. 너무 짧지도 길지도 않게! 적당히 😁
                                </label>
                                <br>
                                <!-- <input type="text" class="form-control" rows="7" minlength="100"> -->
                                <input type="text" name="class_totla_number" class="form-control" rows="7" ><span style="color:black">/번</span>
                            </div>
                            <button class="btn btn-indigo btn-rounded prevBtn float-left" type="button">Previous</button>
                            <button class="btn btn-indigo btn-rounded nextBtn float-right" type="button">Next</button>
                        </div>
                    </div>
    
                    <!-- Step 8 -->
                    <div class="row setup-content" id="step-16">
                        <div class="col-md-12">
                            <h3 class="font-weight-bold pl-0 my-4">
                                <p class="font-weight-bold text-center">❗ Mission Complete ❗</p>
                            </h3>
                            <div class="form-group text-center pt-4 pb-4">
                                <label for="exampleFormControlTextarea4">
                                 	  지금까지 입력하신 정보로 강의를 등록하시려면 Submit을 Click✔️해주세요 😁
                                </label>
                            </div>
                            <button class="btn btn-indigo btn-rounded prevBtn float-left" type="button">Previous</button>
                            <button class="btn btn-default btn-rounded float-right" type="submit">Submit</button>
                            <!-- <input type="submit" value="등록하기"> -->
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Steps form -->




<%-- 
	${loginMember }
	<br>
	${tutor }
	<br>
	${categoryList }
	<br>
	
	<div>
		<form action="addClass.do" method="POST">
			
			<h2>${loginMember.nickname }님 어떤 분야를 가르치시겠습니까?</h2>
			<input type="hidden" name="t_code" value="${tutor.t_code }">
			<c:forEach var="categoryVO" items="${categoryList }">
				<label>
					<input type="checkbox" name="c_code" value="${categoryVO.c_code }">
					<input type="text" name="subject_name" value="${categoryVO.category_name }" readonly="readonly"> 
				</label>
			</c:forEach>
			
			<h2>강의를 대표하는 사진을 넣어주세요!</h2>
			<input type="file" name="class_img" accept="image/*" onchange="fileInfo(this)">
			<div id="img_box"></div>

			
			<h2>강의 레벨을 적어 주세요.</h2>
			<select name="class_level">
				 <option value="none" selected="selected">선택</option>
				 <option value="초급">초급</option>
				 <option value="중급">중급</option>
				 <option value="고급">고급</option>
			</select>
						
			<h2>강의 이름을 적어 주세요.</h2>
			<input type="text" name="class_name" placeholder="강의제목">
			
			<h2>강의 금액을 적어 주세요.</h2>
			<input type="text" name="pay" placeholder="강의 금액"><span style="color:black">/원</span>
			
			<h2>강의 계획서를 적어 주세요.</h2>
			<textarea rows="20" cols="50" minlength="50" placeholder="강의계획서" style="resize: none" name="class_plan">
			</textarea>
		
			<h2>강의 횟수를 적어 주세요.</h2>
			<input type="text" name="class_totla_number" placeholder="강의횟수"><span style="color:black">/번</span>
			
			<br><br>
			<input type="submit" value="등록하기">
			<input type="button" onclick="location.href='tutorMypage.do'" method="GET" value="취소하기">
						
		</form>
	
	
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mdb.min.js"></script>
    <!-- Your custom scripts (optional) -->
    <script type="text/javascript"></script>
    <!-- MDBootstrap Datatables  -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/addons/datatables2.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/add_class.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tutor_accept.js"></script>
    <!-- Stepper JavaScript -->
    <script type="text/javascript" src="js/addons-pro/steppers.js"></script>
    <!-- Stepper JavaScript - minified -->
    <script type="text/javascript" src="js/addons-pro/steppers.min.js"></script>
</body>
</html>