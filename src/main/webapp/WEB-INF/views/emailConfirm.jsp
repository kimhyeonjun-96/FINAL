<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 완료</title>
</head>
<body>
	<script type="text/javascript">
		var userEmail = '${email}';

		alert(userEmail + '님 회원가입을 축하합니다. 이제 로그인이 가능 합니다.');

		window.open('', '_self', ''); // 브라우저창 닫기
		window.close(); // 브라우저 창 닫기
	</script>
</body>
</html>