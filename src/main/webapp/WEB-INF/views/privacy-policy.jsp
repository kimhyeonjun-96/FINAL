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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/final.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/privacy-policy.css">
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

    <!-- privacy-policy -->
    <div class="page">
        <div class="container">
            <div class="legal-notice">
                <div class="section fonctionnement">
                    <div class="wrapper">
                        <div class="column">
                            <h3 class="title">개인 정보 정책</h3>
                            <div class="text">
                                <p>
                                    <strong style="background-color: initial;">1. 목적</strong>
                                </p>
                                <p>
                                    LearnUp Studio(소재: 459, Gangnam-daero, Seocho-gu, Seoul, Republic of Korea)(이하 "LearnUp Studio", "저희", "당사")는 정보 관리자로서 귀하의 정보 보호에 최선을 다하고 있습니다.&nbsp; 이 공지("정보 보호 약관 ")은 당사의 웹사이트 또는 "플랫폼" 이용에 따른 개인정보의 수집, 이용, 보호에 따른 당사 방침을 전달함을 목적으로 합니다.
                                </p>
                                <p>
                                    이 회원정보 보호 약관은 이용약관과 함께 저희가 이용자들로부터 수집하거나 이용자가 저희에게 제공하는 정보 관리와 관련된 법적 근거입니다. 개인정보 수집 및 이용과 관련한 저희의 관점 및 규정에 대해 이해하기 위해 주의 깊게 읽어주세요.
                                </p>
                                <p>
                                    <strong>2. 회원정보 수집 및 보관 기간</strong>
                                </p>
                                <p>
                                    저희는 이용자들로부터 다음과 같은 정보들을 수집 및 보관할 수 있습니다.
                                </p>
                                <p>
                                    <strong>2.1. 회원이 당사에 제공하는 정보</strong>
                                </p>
                                <p>
                                    이용자는 회원 가입 양식과 같은&nbsp;당사 웹사이트(또는 플랫폼) 지정 양식을 작성 시 신원 확인을 위한 정보("개인 정보")를 포함한 정보를 제공하는 것에 동의하는 것을 간주됩니다.
                                </p>
                                <p>
                                    저희에게 제공되는 정보는 다음과 같습니다:
                                </p>
                                <p>
                                    2.1.1. 당사 서비스 사용을 위한 의무 제공 정보는 이름, 이메일 주소, 생년월일, 성별, 핸드폰 번호, IP주소, Kakao 아이디, Naver 아이디, 당사 계정 비밀번호 등입니다. 해당 정보들이 제공되지 않을 시 LearnUp Studio는 당사 서비스를 제공할 수 없으며, 결과적으로 해당 이용자는 회원 계정 등록이 불가합니다.
                                </p>
                                <p>
                                    2.1.2. 사진;
                                </p>
                                <p>
                                    2.1.3.&nbsp;주소;
                                </p>
                                <p>
                                    2.1.4.&nbsp;자격, 학위 관련 정보;
                                </p>
                                <p>
                                    2.1.5.&nbsp;포트폴리오;
                                </p>
                                <p>
                                    2.1.6. 이용자와 당사와의 연락 기록;
                                </p>
                                <p>
                                    2.1.7. 당사 플랫폼;
                                </p>
                                <p>
                                    2.1.8. 회계/금융 거래의 세부 사항. 이 정보는 지불 카드, 은행 계좌 및 회원이 저희 플랫폼을 통해 제공하는 수업과 관련된 정보를 포함할 수 있습니다;
                                </p>
                                <p>
                                    2.1.9. 이용자의 당사 플랫폼 방문 관련 세부사항 및 당사 플랫폼 자료 접근 내역;;
                                </p>
                                <p>
                                    2.1.10. 당사가&nbsp;진행하는 설문 조사에 대한 회원의 답변 내역 및 회원이 다른 회원들과 공유한 수업 후기. 해당 정보는 맞춤 서비스 제공을 위한 이용자 데이터 분석에 사용됩니다;
                                </p>
                                <p>
                                    2.1.11. 이용자가 당사 플랫폼 또는 서비스의 문제 관련 보고서 제출 시 또는 서포트 요청 제출 시 당사가 요청하는 정보들;
                                </p>
                                <p>
                                    2.1.12. 당사 정보 수집 및 이용 약관 동의에 따라 회원이 제공하는 위치 정보;
                                </p>
                                <p>
                                    2.1.12. 이용자가 당사에 제공하기로 동의한 학위 및 자격증
                                </p>
                                <p>
                                    <strong>2.2. 당사가 자동으로 수집하는 정보</strong>
                                </p>
                                <p>
                                    2.2.1. 소셜 네트워킹 서비스 인증 방법을 통한 회원 가입 시, LearnUp Studio는 해당 회원의 소셜 네트워킹 서비스 이용 약관에 따라, 계정 개인 정보(예시: 성함, 사진, 이메일 등)에 접근하게 됩니다. 당사는&nbsp;또한 "좋아요"기능과 같은 타사 소셜 미디어 기능과 상호 작용할 때 일부 개인 데이터를 수집 할 수 있습니다.
                                </p>
                                <p>
                                    2.2.2.&nbsp;당사는 이용자가 당사 플랫폼을 방문 할 때마다 관련 법률에 따라, 그리고 귀하의 동의가 필요한 경우, 귀하가 사용하는 장치 및 당사 서비스를 사용할 때 연결된 네트워크와 관련된 정보를 수집 할 수 있습니다. 여기에는 IP 주소, 로그인 정보, 브라우저 유형 및 버전, 브라우저 플러그인 유형 및 버전, 운영 체제 및 플랫폼, 광고 식별자, URL 클릭 스트림을 포함하여 방문하는 URL에 대한 방문 정보가 포함될 수 있습니다. 당사의 플랫폼에서 이용자가 보거나 검색 한 상품, 다운로드 오류, 특정 페이지 방문 시간, 페이지 상호 작용 및 고객 서비스 번호로 연락하는 데 사용된 발신 전화 번호 등이 포함됩니다. 당사는 쿠키를 포함한 다양한 기술을 사용하여 해당 정보들을 수집합니다.
                                </p>
                                <p>
                                    2.2.3. 당사는 또한 당사 플랫폼에서의 이용자의 활동 (제공하는 수업 수, 메시지 응답률 등)에 관한 집계 된 정보를 수집합니다. 이러한 정보는 플랫폼의 공개 프로필에 게시 될 수 있습니다.
                                </p>
                                <p>
                                    <strong>2.3. 정보 보관</strong>
                                </p>
                                <p>
                                    회원정보는 당사 데이터베이스에 영구적으로 보관되며,&nbsp;
                                    <a href="mailto:privacy@learnup.com">privacy@learnup.com</a>으로&nbsp;Data Deletion이라는 제목의 삭제 요청 메일을 보내주시면 삭제 가능합니다.
                                </p>
                                <p>
                                    <strong>3. 수집된 회원정보는 어떻게 사용되나요?</strong>
                                </p>
                                <p>
                                    당사는 다음의 목적을 위해 회원정보를 사용합니다:
                                </p>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td colspan="2">
                                                <br>
                                                목적
                                            </td>
                                            <td>
                                                법적 근거
                                                <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                3.1. 양측의 의무 계약 사항 이행 및&nbsp;회원이 당사에 요청한 정보 및 서비스 제공을 위함;
                                            </td>
                                            <td>
                                                양측의 의무 계약 사항 이행에 필요한 조항입니다.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                3.2. 당사가 회원에게 이메일, 문자 등 커뮤니케이션 수단을 통해 당사 서비스 관련 정보를 전송하기 위함(예시: 수업 요청 확인서);
                                            </td>
                                            <td>
                                                양측의 의무 계약 사항 이행에 필요하거나/또는 회원의 동의하에 수행되는 조항입니다.<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                3.3. 회원의 결제대금 수금 및 회원 대신 당사가 수금한 금액을 회원에게 지불하기 위함;
                                            </td>
                                            <td>
                                                양측의 의무 계약 사항 이행에 필요한 조항입니다.<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                3.4. 회원이 자신의 프로필 관리를 보장하기 위함;
                                            </td>
                                            <td>
                                                회원의 동의하에 수행되는 조항입니다.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                3.5. 회원이 다른 회원들과 당사 서비스와 관련된 커뮤니케이션을 할 수 있도록 보장하기 위함;
                                            </td>
                                            <td>
                                                양측의 의무 계약 사항 이행에 필요하거나/또는 회원의 동의하에 수행되는 조항입니다.<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                3.6. 회원의 원활한 당사 고객서비스 이용과 당사 고객서비스 팀과의 커뮤니케이션을 위함;
                                            </td>
                                            <td>
                                                (1)양측의 의무 계약 사항 이행에 필요하며&nbsp;(2)회원의 동의에 따라 수행되며/또는 (3)법적 배상 청구의 수립, 행사, 방어를&nbsp;보장하기 위한 조항입니다.<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                3.7. (i) 적용 가능한 법률, (ii) 당사의 이용 약관 및 (iii) 개인 정보 보호 통지를 준수를 위함. 법률/조항을 부적절하게&nbsp;위반 시 귀하의 계정이 정지 될 수 있음을 통지하기 위함;<br>
                                            </td>
                                            <td>
                                                (1)양측의 의무 계약 사항 이행에 필요하며&nbsp;(2)회원의 동의에 따라 수행되며/또는 (3)법적 배상 청구의 수립,&nbsp;행사,&nbsp;방어를&nbsp;보장하기 위한 조항입니다.<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                3.8. 적용 가능한 법률에 따라, 또는 필요한 경우, 회원의 동의 하에&nbsp;서비스 및 수업 요청 절차를 용이하게 하고 회원이 관심있는 상품 또는 서비스를 제안할 수 있도록 하기 위한 마케팅 자료나 필요 정보를 제공하기 위함. 또한 당사는 귀하의 데이터를 이용하여 소셜미디어 플랫폼 광고 타케팅에 사용함.&nbsp;타사 소셜 미디어 플랫폼의 관련 섹션을 방문하여 이러한 기능의 작동 방식과 당사에서 얻은 데이터에 대해 자세히 알아볼 수 있음.;<br><br>
                                            </td>
                                            <td>
                                                회원의 동의 및 / 또는 당사의 정당한 관심사 (즉, 의미있는 광고 제공)를 기반으로 함을 의미하는 조항입니다.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                3.9. 이용자에게 당사 서비스 변경에 대해 공지하기 위함;
                                            </td>
                                            <td>
                                                (1)양측의 의무 계약 사항 이행에 필요하며&nbsp;(2)회원의 동의에 따라 수행되며/또는 (3)법적 배상 청구의 수립,&nbsp;행사,&nbsp;방어를&nbsp;보장하기 위한 조항입니다.<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                3.10 회원 가입 시 또는 플랫폼 사용 중 언제라도 수집 할 수 있는 이용자의 자격증 및 기타 문서에 포함 된 정보를 확인하기 위함;
                                            </td>
                                            <td>
                                                (1)양측의 의무 계약 사항 이행에 필요하며&nbsp;(2)회원의 동의에 따라 수행되며/또는 (3)법적 배상 청구의 수립,&nbsp;행사,&nbsp;방어를&nbsp;보장하기 위한 조항입니다.<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                3.11.&nbsp;문제 해결, 데이터 분석, 테스트, 연구, 분석 및 조사 목적을 포함한 당사 플랫폼 관리 및 내부 운영을 위함;
                                            </td>
                                            <td colspan="2">
                                                당사의 정당한 관심사를 기반으로 함을 의미하는 조항입니다(예시 : 플랫폼의 보안 보장 및 기능 개선).<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                3.12. 이용자와 이용자의 장치에 가장 효과적인 방식으로 컨텐츠가 제공되도록 플랫폼을 개선하기 위함;<br>
                                            </td>
                                            <td colspan="2">
                                                당사의 정당한 관심사를 기반으로 함을 의미하는 조항입니다(예시 : 플랫폼의 보안 보장 및 기능 개선).<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                3.13. 이용자가 동의 시 당사의 쌍방향 대화 서비스를 이용할 수 있도록 하기 위함;
                                            </td>
                                            <td colspan="2">
                                                (1)양측의 의무 계약 사항 이행에 필요하며/또는 (2)회원의 동의에 따라 수행됨을 의미하는 조항입니다.<br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                3.14. 당사 플랫폼을 안전하게 유지하기 위함;
                                            </td>
                                            <td colspan="2">
                                                (1)양측의 의무 계약 사항 이행에 필요하며&nbsp;(2)회원의 동의에 따라 수행되며/또는 (3)법적 배상 청구의 수립,&nbsp;행사,&nbsp;방어를&nbsp;보장하기 위한 조항입니다.<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                3.15. 당사가 이용자와 다른 사람에게 제공하는 광고의 효과를 측정 또는 이해하고 관련 광고를 이용자에게 제공하기 위함.
                                            </td>
                                            <td colspan="2">
                                                (1)당사의 정당한 관심사(예시: 광고 캠페인의 효율성 측정 및 최적화) (2)회원의 동의에 따라 수행됨을 의미하는 조항입니다.
                                            </td>
                                        </tr>
                                        <tr>

                                        </tr>
                                    </tbody>
                                </table>
                                <p>
                                    <strong>4. 수집된 정보의 수신자는 누구이며 어떤 목적으로 사용되나요?</strong>
                                </p>
                                <p>
                                    4.1. 당사 서비스 이용 시 귀하의 일부 정보는 공개 프로필을 통해 커뮤니티 회원과 공유됩니다(예 : 수업을 받을 회원에게 전화 번호를 제공) .
                                </p>
                                <p>
                                    4.2. 당사는 귀하가 저희가 운영하는 플랫폼이나 다른 LearnUp Studio 계열사 서비스 이용 시 본 개인 정보 보호 고지에 요약 된 대로 개인 정보를 포함한 귀하에 관한 정보를 수신 및 전송할 수 있습니다.
                                </p>
                                <p>
                                    4.3. 저희는 또한 귀하의 개인 정보를 수신할 수 있는 제3자들과 긴밀히 협력하고 있으며, 그 대상은 다음과 같습니다:
                                </p>
                                <li>
                                    &nbsp; &nbsp;&nbsp;이용자의 프로필 정보 연동과 같이 당사 플랫폼으로 연결 서비스를 제공 할 수있는 소셜 미디어 서비스를 비롯한 비즈니스 파트너;
                                </li>
                                <li>
                                    &nbsp; &nbsp; 당사 플랫폼에서 자신들의 서비스를 광고하거나 이용자가 가입하기로 결정한 플랫폼들: 해당 서비스들은 네트워킹 서비스, 은행 서비스 등 당사와 관련된 어떤 서비스든지 해당될 수 있습니다.
                                </li>
                                <li>
                                    &nbsp; &nbsp; 자신들의 웹사이트에서 당사의 서비스를 광고하는 비즈니스 파트너
                                </li>
                                <li>
                                    &nbsp; &nbsp; 당사에 기술 및 지불서비스 및 분석서비스를 제공하는 외주 업체
                                </li>
                                <p>
                                    4.4. 저희는 다음과 같은 경우에만 귀하의 개인 정보를 이러한 제 3자와 공유합니다 :
                                </p>
                                <p>
                                    4.4.1.&nbsp;당사가 이용자와 체결한 계약의 이행을 서비스를 개선하고 확장시킬&nbsp;목적으로 위해 제 3자인 서비스 제공자를 참여시켜야하는 경우(예를 들어, 플랫폼에서 서비스 이용 요금 청구 및 이용자로부터 대금 수금을 위해);&nbsp;
                                </p>
                                <p>
                                    4.4.2. 수업 요청 과정의 일부로 그리고 서비스를 제공하기 위해 이용자의 이름, 사진, 휴대 전화 번호 및 이메일 주소와 같은 정보를 플랫폼에 표시하거나 튜터(이용자가 학생인 경우) 또는 학생(이용자가 튜터인 경우)에게 전달할 경우;
                                </p>
                                <p>
                                    4.4.3. 평가 시스템의 일부로 귀하가 작성한 리뷰는 플랫폼에 게시됩니다. 약식 이름과 사진을 포함한 후기는 플랫폼의 모든 방문자가 볼 수 있습니다.
                                </p>
                                <p>
                                    4.4.4. 당사는 분석 서비스 및 검색 엔진 서비스&nbsp;공급자를 통해 플랫폼의 개선 및 최적화를 지원합니다.
                                </p>
                                <p>
                                    4.4.5. 이용자가 명시적으로 요청할 시(예시: 소셜 미디어를 통한 인증 방법 사용시).
                                </p>
                                <p>
                                    4.4.6. 당사는 API 또는 위젯을 통해 비즈니스 파트너의 웹 사이트에 표시 할 플랫폼의 일부 (게시 한 강의 포함)를 제공 할 수 있습니다. 이 경우 공개 프로필의 일부 정보가 해당 웹사이트에 표시 될 수 있습니다.
                                </p>
                                <p>
                                    4.4.7. 또한 Superprof는 법에 따라, 또는 선의로 믿음에 따라, 다음과 같이 필요한 상황 및 목적에 따라 이용자 정보를 공개할 수 있습니다:&nbsp;(1)LearnUp Studio에 대한 법적인 클레임에 대응하기 위해, (2)법적 절차를 준수하기 위해, (3)당사의 이용 약관 및 개인 정보 보호 정책과 같은 사용자와의 계약을 이행하기 위해, (4)공공 안전, 사망과 같은 위험 또는 또는 개인의 부상과 같은 응급 상황 시, (5)수사 시, (6)LearnUp Studio와&nbsp;회원들 또는 타인의 권리, 재산 또는 개인 안전을 보호하기 위해;&nbsp;&nbsp;
                                </p>
                                <p>
                                    4.4.8. 당사가&nbsp;사업 또는 자산을 판매 또는 구매하는 경우, 해당 사업 또는 자산의 잠재적 판매자 또는 구매자에게 귀하의 개인 정보를 공개 할 수 있습니다.&nbsp;
                                </p>
                                <p>
                                    4.4.9. LearnUp Studio 또는 LearnUp Studio 소유 자산의 전부 또는 일부가 제 3자에 의해 취득 될 경우, 당사가 보유한 회원 개인 정보는 양도 자산 중 일부가됩니다.
                                </p>
                                <p>
                                    4.4.10 당사가 중개 서비스 제공 파트너를 통해서 이용자의 정부 일부에 접근할 경우 이용자는 해당 서비스 제공자의 개인 정보 보호 정책에 동의하는 것으로 간주합니다. 당사는 해당 비즈니스 파트너가 고유 플랫폼에서 이용자의 정보를 수집하고 처리하는 것에 대해 어떠한 권한도 가지고 있지 않습니다.
                                </p>
                                <p>
                                    4.4.11. 이용자는 당사가 이용자의 이름, 프로필 사진, 및 기타 컨텐츠를&nbsp;당사가 배포하거나 개선하는 상업적, 후원 또는 관련 컨텐츠의 일부로 사용할 수 있도록 승인합니다. 당사는 재판매를 위해 귀하의 컨텐츠 또는 정보를 제 3 자에게 전송하지 않습니다
                                </p>
                                <p>
                                    <strong>5. 이용자의 메시지를 어떻게 검열하나요?</strong>
                                </p>
                                <p>
                                    5.1. 당사는 사기 방지, 서비스 개선, 고객 지원 목적, 회원과 체결 한 계약의 이행(예 : 이용 약관)을 위해 이용자가 당사 플랫폼을 통해 커뮤니티의 다른 회원과 교환한 메시지를 검토, 검열 또는 분석 할 수 있습니다. 예를 들어, 당사 플랫폼의&nbsp;서비스를 사용하지 않고&nbsp;튜터와 학생이 바로 거래하는&nbsp;것을 막기 위해 플랫폼을 통해 전송 된 메시지를 스캔하고 분석하여 연락처 세부 정보나 다른 웹 사이트에 대한 정보가 포함되어 있지는 않은지 확인할 수 있습니다.
                                </p>
                                <p>
                                    5.2. 저희는 상업적인 이용 및 광고 목적으로 커뮤니티의 다른 회원들과 귀하의 메시지를 스캔하거나 분석하지는 않습니다. 자동화된 방법을 사용해 메시지를 검열할 수는 있지만 이와 관련하여 의사결정 자동화는 사용하지 않는 점 참고 부탁드립니다..
                                </p>
                                <p>
                                    <strong>6. 소셜 미디어 플랫폼, 이메일 및 문자 메시지로 전송 타케팅 광고 및 고객 커뮤니케이션</strong>
                                </p>
                                <p>
                                    적용 가능한 법률에 따라 이용자의 동의 하에 당사는 다이렉트 마케팅을 목적으로 이용자가 당사 플랫폼에 제공 한 정보를 사용할 수 있습니다(예시 : (1) 뉴스 레터 수신, 이벤트 초대 또는 이용자가 관심있을 것이라 당사가 판단한 다른 커뮤니케이션 이벤트) 또는 (2)소셜 미디어 플랫폼 또는 제 3자 웹 사이트를 통한 타케팅 광고 제공)&nbsp;
                                </p>
                                <p>
                                    전자 마케팅 커뮤니케이션의 경우 : 이용자는&nbsp;(1)회원 계정에서 관련 상자를 선택 해제하거나 (2) LearnUp Studio 커뮤니케이션에서 이용자에게&nbsp;제공하는 전자레터에서&nbsp;수신 거부 링크를 클릭하거나 (3)당사에 직접&nbsp;연락하여 언제든지 정보 제공&nbsp;동의를 철회 할 수 있습니다. 아래 12번 항목의&nbsp;정보 보호 관리자&nbsp;연락처로 연락하시면 됩니다.
                                </p>
                                <p>
                                    타겟팅 된 광고 및 콘텐츠의 경우 :&nbsp;
                                </p>
                                <li>
                                    &nbsp;&nbsp;&nbsp; on social media (e.g. Kakao and Naver): you can object at any time by configuring your settings regarding advertisement via your social media account;
                                </li>
                                <li>
                                    &nbsp; &nbsp;&nbsp;소셜 미디어(예시: Kakao 및 Naver): 소셜 미디어 계정의 통해 광고 관련 설정을 변경하여 정보 제공 동의를 철회할 수 있습니다.
                                </li>
                                <p>
                                    <strong>7. 이용자 정보 전송</strong>
                                </p>
                                <p>
                                    원칙적으로, 당사는 유럽 연합("EU") 데이터베이스에 이용자의 개인 정보를 저장합니다. 그러나 일부 서비스 제공 업체는 EU 이외의 국가 ("제 3국")를 기반으로하기 때문에 일부 데이터는 제 3 국으로 이전됩니다. 여기에는 유럽 연합 집행위원회가 적절한 수준의 보호를 보장한다고 판단하지 않은 제 3 국이 포함될 수 있습니다 (예시 : 미국). 이 경우 개인의 사생활과 기본 권리에 대한 충분한 보호 수준을 보장하기 위해 해당 국가 법률에 따라 정보 양도를 수행하고 적절한 보호 조치 절차(특히 유럽 연합 집행위원회가 발행 한 표준 계약 조항에 따라)를 따릅니다.
                                </p>
                                <p>
                                    그룹 데이터 보호 책임자 (dpo@learnup.com)에게 요청하시면 정보 보호 수단(예시: 유럽위원회가 발행 한 표준 계약 조항)에 대한 세부 정보를 제공해드릴 수 있습니다.
                                </p>
                                <p>
                                    <strong>8. 개인 정보와 관련한 이용자 권리&nbsp;</strong>
                                </p>
                                <p>
                                    8.1. 이용자는 당사가 보유한 이용자의 개인 데이터 사본(데이터 액세스 권한)을 받을 권리가 있습니다.
                                </p>
                                <p>
                                    8.2 이용자는 개인 데이터 삭제 또는 부정확 한 개인 데이터의 수정(삭제 및 수정 권한)을 요청할 수 있습니다. 당사는 법률에 의해 요구되거나 법적 근거가있을 때(예시 : 다른 사용자를 위해 플랫폼을 안전하고 안전하게 유지하려는 의도일 시) 이용자에 관한 특정 정보를 보관/유지할 수 있습니다.
                                </p>
                                <p>
                                    8.3 이용자는 언제든지 (1)다이렉트 마케팅을 목적으로 귀하의 개인 데이터를 처리하는 것에 반대하거나 (2) 이용자가 처한 다른 상황(개인정보 이용에 반대 할 권리 행사 원할 시)을 근거로 데이터 처리를 반대할 수 있습니다. 후자의 경우, 해당&nbsp;권리는 귀하의 개인 데이터 처리가 당사의 정당한 이익에 근거한 경우에만 적용됩니다.
                                </p>
                                <p>
                                    8.4 이용자는 당사의&nbsp;개인 정보 처리를 제한할 권리가 있습니다 (정보 처리 제한 권한). 이는 (1)이용자가 자신의 개인 정보의 정확성에 이의를 제기하고 당사가 개인 데이터의 정확성을 확인확 경우, (2)이용자가 개인 정보 사용에 대한&nbsp;이의를 제기 할 권리를 행사했으며, 이용자의 개인 정보를 처리할 합법적 근거가 이용자의 이익, 권리 및 자유를 침해하는지에 대한 여부 등을 확인하여,&nbsp;적용 가능한 법률에 따라 당사가 여전히 고려중인 경우, (3)이용자의 개인 정보가 당사에 의해 불법적으로 처리되었지만 이용자가&nbsp;개인 정보의 삭제에 반대하거나 법적 배상 청구의&nbsp;행사 또는 법적인 방어를 위해 귀하의 개인 정보를 유지하기를 원합니다.&nbsp;
                                </p>
                                <p>
                                    8.5. 이용자는 당사와의 계약 이행을 위해, 또는 자신이 동의해서&nbsp;당사에 제공한 개인 정보 중 문제가 있다고 판단되는 정보의 일부를, 일반적인 전자기기로 인식 가능한 포맷으로&nbsp;수신하거나 당사를 통해서 다른 데이터 감독 기관으로 전송할 권리가 있습니다(데이터 휴대 권리).
                                </p>
                                <p>
                                    8.6 권리를 행사를 진행하시려면&nbsp;그룹 데이터 보호 책임자에게 문의 부탁드립니다(12번 조항 참조).
                                </p>
                                <p>
                                    8.7. 또한 이용자는 자신의 권리가 침해되었다고 생각 할 경우 관련 데이터 보호 감독 기관에 불만을 제기하거나 법원을 통해 구제 조치를 요청할 권리가 있습니다.
                                </p>
                                <p>
                                    <strong>9.&nbsp;9. 비밀번호의 비밀 유지</strong>
                                </p>
                                <p>
                                    당사 플랫폼 서비스 사용을 위해 설정한&nbsp;어떤 비밀번호도 기밀로 유지되어야 합니다. 비밀번호를 다른 사람과 공유하지 말아주세요.
                                </p>
                                <p>
                                    <strong>10. 다른 웹 사이트 및 소셜 미디어에 대한 링크</strong>
                                </p>
                                <p>
                                    당사 플랫폼에는 때때로 파트너 네트워크, 광고주 및 제휴사의 웹 사이트와의 링크가 포함될 수 있습니다. 이러한 웹 사이트로 연결되는 링크 접속 시&nbsp;해당 웹 사이트는 자체 개인 정보 보호 정책이 있음을 참고 부탁드리며, 당사는 이러한 정책에 대한 책임이나 책임을 지지 않습니다. 이러한 웹사이트에 개인 정보를 제출하기 전에 해당 사이트의 개인 정보 보호 정책을 확인 부탁드립니다.
                                </p>
                                <p>
                                    <strong>11. 개인 정보 보호 정책 변경</strong>
                                </p>
                                <p>
                                    개인 정보 보호 정책은 현재 페이지에 실시간으로 업데이트되며, 필요할 경우 회원님께 공지하거나 회원님의 동의를 요청하게 됩니다. 개인 정보 보호 정책의 업데이트나 변경 관련 확인을 위해 현재 페이지를 자주 확인해주세요.
                                </p>
                                <p>
                                    <strong>12. 연락처 &amp; 정보 보호 관리자</strong>
                                </p>
                                <p>
                                    개인 정보 보호 정책에 대한 의견이나 귀하의 개인 정보와 관련된 문의 사항이 있을&nbsp;경우 언제든지 다음 방법들을 통해 연락 부탁드립니다:
                                </p>
                                <li>
                                    &nbsp; &nbsp; 당사 플랫폼 문의 페이지
                                </li>
                                <li>
                                    &nbsp; &nbsp; 당사 정보 보호 관리자 이메일:&nbsp;
                                    <a href="mailto:dpo@learnup.com">dpo@learnup.com</a>
                                </li>
                                <li>
                                    &nbsp; &nbsp; 우편:
                                </li>
                                <p>
                                    수신인: 정보 보호 관리자
                                </p>
                                <p>
                                    459, Gangnam-daero, Seocho-gu
                                </p>
                                <p>
                                    06611 Seoul(Republic of Korea)
                                </p>
                                <p>
                                    본 약관은 2020년 12월 01일에 최종 업데이트되었습니다.
                                </p>
                            </strong>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                        <a href="${pageContext.request.contextPath}/index.do">Home</a>
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
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
  </body>
</html>