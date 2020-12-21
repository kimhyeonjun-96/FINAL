<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축하합니다</title>
<!-- <script type="text/javascript">
	
	function moveTutorMypage(){
		
		location.href = 'tutorMypage.do';
	}
	
	function addLecture(){
		
		lcoation.href = 'addLecture.do';
	}
	
	
	
</script> -->
</head>
<body>
	<%-- ${loginMember.nickname }
	${tutor }
	
	
	<h1>${loginMember.nickname }님 새로운 강사가 되신것을 축하드립니다.</h1>
	<h3>앞으로 자신의 전문성으로 많은 이들이 배울 수 있도록 도와주세요!</h3>
	
	<input type="button" onclick="moveTutorMypage()" value="Mypage" method="GET">
	<input type="button" onclick="addLecture()" value="강의등록하기" method="GET">
	 --%>
	<script type="text/javascript">
		var tutorNickname = '${loginMember.nickname }';
		var tutor = '${tutor }';
		alert(tutorNickname + '님 새로운 강사가 되신것을 축하합니다. 앞으로 자신의 전문성으로 많은 이들이 배울 수 있도록 도와주세요!');
		window.open('', '_self', ''); // 브라우저창 닫기
		window.close(); // 브라우저 창 닫기
		location.href = 'tutorMypage.do';
	</script>
	
	
	
</body>
</html>