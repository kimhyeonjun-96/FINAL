<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>
</head>
<body>

	<h1>회원 탈퇴 하였습니다.</h1>
	<p>그동안 이용하여 주셔서 감사합니다.</p>
	<script type="text/javascript">
		var tutorNickname = '${loginMember.nickname }';
		var tutor = '${tutor }';
		alert('그동안 이용 감사합니다.' );
		window.open('', '_self', ''); // 브라우저창 닫기
		window.close(); // 브라우저 창 닫기
		location.href = 'index.do';
	</script>
	
	
</body>
</html>










