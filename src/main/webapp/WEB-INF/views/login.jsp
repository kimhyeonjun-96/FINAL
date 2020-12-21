<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "url" value="url" />    
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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_2.css">

<title>로그인</title>

</head>
<body>

	<div class="container d-flex justify-content-center align-items-center">
	
		
        <div class="card z-depth-5">
            <div class="p-3 border-bottom d-flex align-items-center justify-content-center">
                <h5>Login</h5>
            </div>
            <div class="p-3 px-4 py-4 border-bottom">
            	<form action="login.do" method="POST">
            		
            		<input type="text" class="form-control mb-2" placeholder="Nickname" name = "nickname"/>
                	<div class="form">
                    	<input type="password" class="form-control" placeholder="Password" name = "pw" >
                    	<!-- <a href="#">Forgot?</a> -->
                	</div>
                	<c:choose>
						<c:when test="${returnLogin == 1 }">
						</c:when>
				
						<c:when test="${returnLogin == 0 }">
							<p style="color: red">아이디 또는 비밀번호를   잘 못 입력하셨습니다.</p>
						</c:when>
					</c:choose>
                	
                	<button type="submit" class="btn btn-danger btn-block continue">Login</button>
                	
	                <div class="d-flex justify-content-center align-items-center mt-3 mb-3">
	                    <span class="line"></span>
	                    <small class="px-2 line-text">OR</small>
	                    <span class="line"></span>
	                </div>
	                <a  href="https://kauth.kakao.com/oauth/authorize?client_id=f17cc22fd84a2fe7fffbcb68f8240621&redirect_uri=http://localhost:8090/site/kakaologin.do&response_type=code " class="btn btn-block continue d-flex justify-content-start align-items-center" style="background-color: yellow;">
	                    <!-- <i class="fa fa-facebook ml-2"></i> -->
	                    <img src="${pageContext.request.contextPath}/resources/images//kakao.png">
	                    <span class="ml-5 px-4">카카오 아이디로 로그인</span>
	                </a>
	                 <%
	                 	String url = (String)session.getAttribute("url");
	                 	System.out.println("login.jsp session url : " + url);
	                 %>
	                 &nbsp;
	                 <!-- 이건 강사님꼐 여쭈어 봐야겠다. -->
	                <a href="<%=url %> " class="btn btn-block continue d-flex justify-content-start align-items-center" style="background-color: #1EC800;">
	                    <img src="${pageContext.request.contextPath}/resources/images/naver.png">
	                    <span class="ml-5 px-4" style="font-family: Noto Sans C JK KR Bold;">네이버 아이디로 로그인</span>
	                </a>
            	</form>
            </div>
            <div class="p-3 d-flex flex-row justify-content-center align-items-center member">
                <span>Not a member? </span>
                <a href="signup.do" class="text-decoration-none ml-2" >SIGNUP</a>
            </div>
        </div>
    </div>
	
	
	<%-- <h1>로그인</h1>
	<form action="login.do" method="POST">
		<ul>
			<li>
				<label>아이디: </label>
				<input type="text" id="nickname" name="nickname" value="">
				
			</li>
			<li>
				<label>비밀번호: </label>
				<input type="password" name="pw" value="">
			</li>
			<c:choose>
				<c:when test="${returnLogin == 1 }">
				</c:when>
				
				<c:when test="${returnLogin == 0 }">
					<p style="color: red">아이디 또는 비밀번호를   잘 못 입력하셨습니다.</p>
				</c:when>
			</c:choose>
			<br><br>
			<input type="submit" value="로그인" style="width: 226px;">
			<br><br>
			<a  href="https://kauth.kakao.com/oauth/authorize?client_id=f17cc22fd84a2fe7fffbcb68f8240621&redirect_uri=http://localhost:8090/site/kakaologin.do&response_type=code">
				<img width="220" src="${pageContext.request.contextPath}/resources/images/kakao_login_medium_narrow.png">
			</a>
			${pageContext.request.contextPath} <br>
			<br><br>
			<a  href="${url} ">
				<img width="226" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
			</a>
			<br><br>
			<button style="width: 226px;" type="button" onclick="location.href='signup.do'" method="GET">회원가입</button>
			<br><br>
		</ul>
	</form> --%>
	
	
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











