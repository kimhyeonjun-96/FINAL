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
				
				
				<c:choose>
					<c:when test="${loginMember == null}">
						<!-- Sign up -->
						 <button type="button" class="btn btn-light ml-3 font-weight-bold" onclick="location.href='signup.do'">
			                <i class="fas fa-user-circle mr-2"></i>Sign Up
			            </button>
			            <!-- Login -->
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

    <!-- FAQ -->
    <div class="container my-5">
        <!--Section: Content-->
        <section>
            <h6 class="font-weight-normal text-uppercase font-small grey-text mb-4 text-center">FAQ</h6>
            <!-- Section heading -->
            <h3 class="font-weight-bold black-text mb-4 pb-2 text-center">Frequently Asked Questions</h3>
            <hr class="w-header">
            <!-- Section description -->
            <p class="lead text-muted mx-auto mt-4 pt-2 mb-5 text-center font-weight-bold">무엇이 궁금하신가요? 저희가 답변해드리겠습니다. 만약에 다른 질문이 있다면 고객센터로 문의바랍니다.</p>
            <div class="row">
                <div class="col-md-12 col-lg-10 mx-auto mb-5">
                    <!--Accordion wrapper-->
                    <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">
                        <!-- Accordion card -->
                        <div class="card border-top border-bottom-0 border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingOne1">
                                <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
                                    <h5 class="black-text font-weight-normal mb-0">
                                      	  수업 등록은 무료인가요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordionEx">
                                <div class="card-body">
                                 	   저희 LearnUp Studio에서는 수업 등록은 무료입니다. <span class="pink-text">지금 바로 재능을 나눠보세요!</span> - LearnUp 😃
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->
                        
                        <!-- Accordion card -->
                        <div class="card border-bottom-0 border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingTwo2">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2">
                                    <h5 class="black-text font-weight-normal mb-0">
                                      	  튜터가 되고 싶은데 어떻게 시작하면 되나요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseTwo2" class="collapse" role="tabpanel" aria-labelledby="headingTwo2" data-parent="#accordionEx">
                                <div class="card-body">
                                  	  간단해요! 👍<br>
                                    <br>
                                  	  일반 카카오나 네이버, 이메일로 회원가입 후 <span class="pink-text">첫 수업을 등록</span>해보세요.<br>
                                    <br>
                                    	수업 소개, 수업 방법, 수업료, 경험/경력/자격증/학위 등 자세한 정보를 등록하시고 잘 나온 프로필 사진을 업로드 해주세요(수업 등록은 5~10분 정도 걸릴 수 있습니다.).<br>
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->
            
                        <!-- Accordion card -->
                        <div class="card border-bottom-0 border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingThree3">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3">
                                    <h5 class="black-text font-weight-normal mb-0">
                                     	   튜터가 되기 위해 필요한 자격이 따로 있나요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseThree3" class="collapse" role="tabpanel" aria-labelledby="headingThree3" data-parent="#accordionEx">
                                <div class="card-body">
                                 	   학교에서 배우신 것이든, 좋아서 하다 보니 잘하게 된 것이든, 자신있게 남들과 공유할 수 있는 재능을 가진 누구나 수업을 등록할 수 있습니다.<br>
                                    <br>
                                    	그래피티나 필라테스를 꼭 학교에서 배우지는 않잖아요? 🙃
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->
                
                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingFour4">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseFour4" aria-expanded="false" aria-controls="collapseFour4">
                                    <h5 class="black-text font-weight-normal mb-0">
                                       	 어떻게 하면 등록한 수업이 눈에 잘 띄게 할 수 있을까요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseFour4" class="collapse" role="tabpanel" aria-labelledby="headingFour4" data-parent="#accordionEx">
                                <div class="card-body">
                                  	  수업 공고가 잘 다듬어지고 상세한 설명이 기입될수록 학생분들이 수업 검색 시 조회하기 쉬운 상위 포지션에 노출시킬 수 있습니다.<br>
                                    <br>
                                    - 제목은 12단어 이상이어야 합니다.<br>
                                    <br>
                                    - 수업 공고의 « 수업 방법 » 항목과 « 경험/경력 » 항목은 최소 40단어 이상으로 작성해주세요.<br>
                                    <br>
                                    - <span class="pink-text">프로필</span>에서 전화번호와 이메일을 인증해주세요.<br>
                                    <br>
                                    - 졸업장이나 자격증을 업로드해보세요.<br>
                                    <br>
                                    - 대시보드에서 멋진 수업 프로필 사진을 추가해보세요.<br>
                                    <br>
                                    - 학생분들의 수업 요청에 최대한 빨리 응답해주세요. 응답률이 높을 수록 수업 검색 결과에서 상위 포지션에 노출됩니다. 👍<br>
                                    <br>
                                    - 수업 공고에 유튜브 동여상을 추가하시면 더 눈길을 끌 수 있겠죠? 🙃<br>
                                    <br>
                                    - 위의 기분들에 맞게 수업 및 프로필을 수정하실수록, 더 많은 학생들과 연결되실 수 있도록 상위 등급으로 올려드립니다.<br>
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingFive5">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseFive5" aria-expanded="false" aria-controls="collapseFive5">
                                    <h5 class="black-text font-weight-normal mb-0">
                                       	 수업료는 어떻게 책정되며, 수업료 결제는 어떻게 진행되나요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseFive5" class="collapse" role="tabpanel" aria-labelledby="headingFive5" data-parent="#accordionEx">
                                <div class="card-body">
                                   	 요금을 너무 높게 설정하면 학생분들이 부다믈 느낄 수 있어요. 반면, 요금이 너무 낮으면 신뢰도가 떨어질 수 있겠죠. "적절한" 가격을 찾는 것이 중요합니다.<br>
                                    <br>
                                    - 아래 팁들을 참고해보세요:<br>
                                    <br>
                                    - 수업하시는 도시의 다른 튜터분들의 수업료를 참고해보세요.<br>
                                    <br>
                                    - 학위, 기술, 경험 및 튜터분이 생각하시는 자신의 자격에 맞는 수업료에 따라 요율을 조정해보세요.<br>
                                    <br>
                                    - 타겟으로 하시는 학생분들에 맞게 수업료를 조정해보세요. 학생분들의 연령이나 사회 활동 유형을 고려해보세요.<br>
                                    <br>
                                    - 마지막으로, 학생들 찾는데 어려움을 겪고 계시다면, 주저하지 말고 요금을 낮추고 적절한 가격을 찾아보세요.<br>
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingSix6">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseSix6" aria-expanded="false" aria-controls="collapseSix6">
                                    <h5 class="black-text font-weight-normal mb-0">
                                        	수업 등록은 어떻게 하나요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseSix6" class="collapse" role="tabpanel" aria-labelledby="headingSix6" data-parent="#accordionEx">
                                <div class="card-body">
                                   	 간단해요. 😎<br>
                                    <br>
                                   	 저희 LearnUp Studio의 단계별 지침에 따라 각 항목을 완성해주세요.<br>
                                    <br>
                                    	아애 팁을 참고하시면 도움이 될 거에요.<br>
                                    <br>
                                    <p class="font-weight-bold">나만의 강점을 강조하세요(기술, 경험 등)</p>
                                    
                                   	 잠재 고객이 왜 튜터보다 회원님의 수업을 선택할 지에 대해 생각해보세요. 나를 차별화하는 강점 및 수업 스타일과 방법에 대해 설명해주세요.<br>
                                    <br>
                                    <p class="font-weight-bold">나만의 스토리를 공유해주세요</p>
                                    
                                   	 가르치는 것은 단지 지식을 전달하는 것이 아니라 학생분들과의 시노리 및 유대 관계를 구축을 전제로 합니다. 학생분들의 어려움을 이해할 수 있는 사려깊고 흥미로운 튜터라는 것을 보여주세요.<br>
                                    <br>
                                    	취미, 내가 속한 그룹, 여행, 과거 직장 경험 및 인생의 성공 등 수업 외적으로도 학생분들께 공감을 사고 도움이 될 수 있는 것이 있으면 공유해주세요.<br>
                                    <br>
                                    <p class="font-weight-bold">학생분들이 수업을 통해 얻어갈 수 있는 혜택이 무엇인지에 대해 구체적으로 알려주세요</p>
                                    
                                   	 수업 소개 시 너무 이해하기 어려운 용어는 피해주세요. 또한 어떤 수업인지 알 수 없게 모호한 문구도 피해주세요.<br>
                                    <br>
                                    	 예를 들어, "모든 수준을 대상으로 한 수학 수업"이라고 하기보다는 정확한 주제(GMAT, 개발 입문자들을 위한 수학적 사고 기르는 법, 미적분 등)를 명시해주세요.<br>
                                    <br>
                                    <p class="font-weight-bold">눈에 띄는 프로필 사진을 올려주세요</p>
                                     
                                   	 프로필 사진은 학생과 튜터가 서로에 대해 처음 알게 되는 부분입니다. 고화질의 잘 나온 사진을 올려주시면 더 많은 학생분들을 만나실 수 있을 거예요.<br>
                                    <br>
                                    <p class="font-weight-bold">수업 공고 재검토</p>
                                     
                                   	 아무리 그 어떤 실력 있는 튜터의 수업 공고라도, 오탈자로 가득한 수업 소개를 보면 학생 입장에서는 바로 뒤로가기를 클릭하게 되겠죠. 등록하신 수업 공고를 찬찬히 살펴보시고 잘못된 부분은 없는지 게시 전에 최종 검토해주세요.
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingSeven7">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseSeven7" aria-expanded="false" aria-controls="collapseSeven7">
                                    <h5 class="black-text font-weight-normal mb-0">
                                        	어떤 과목이나 분야의 수업을 등록할 수 있나요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseSeven7" class="collapse" role="tabpanel" aria-labelledby="headingSeven7" data-parent="#accordionEx">
                                <div class="card-body">
                                    LearnUp Studio는 수십 가지 카테고리(개발/스포츠/학업/취미/음악 등)에 걸쳐 1,000개가 넘는 과목을 제공합니다.
                                   	 좋은 튜터가 되기 위해서는 반드시 자격을 갖춘 교육자일 필요는 없어요. 예를 들어, 당연히 전문 피아니스트는 피아노 레슨을 할 전문가로서
                                   	 자격이 있지만 튜터링은 <span class="pink-text">배움과 나눔에 대한 열정</span>을 필요로 하죠.
                                    	품고 계신 열정, 기술 및 학생분들이 필요로 하는 것을 이해하는 피아노 선생님이 되려면, 꼭 콘서트를 열 정도의 실력이 있어야 될 필요는 없잖아요?
                                    	악기와 쉽게 친해지고 익숙해지는 방법을 나눌 수 있는 분이 좋은 튜터가 될 수 있다고 생각합니다.<br>
                                    <br>
                                    	마찬가지로 영어 튜터는 영어 원어민이어야만 잘할 수 있는 게 아니에요. 원어민이 아닌 학생이 영어의 어떤 부분을 힘들어하는지, 
                  	                  	어떤 방법으로 공부하면 최대한 원어민에 가까운 실력에 도달하고 자유롭게 소통할 수 있는지에 대한 노하우를 갖춘 분이 좋은 튜터라고 생각합니다.
                                    	물론 이런 자질을 갖추신 원어민 튜터분이시라면 정말 따봉이죠. 👍
                                    <br>
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingEight8">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseEight8" aria-expanded="false" aria-controls="collapseEight8">
                                    <h5 class="black-text font-weight-normal mb-0">
                                        등록하고자 하시는 수업의 카테고리를 찾지 못하셨나요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseEight8" class="collapse" role="tabpanel" aria-labelledby="headingEight8" data-parent="#accordionEx">
                                <div class="card-body">
                                    저희 팀에 이메일로 문의해 주시면 저희가 검토 후 해당 수업에 맞는 카테고리를 생성해 드리겠습니다.<br>
                                    <br>
                                    다양한 수업들이 제공될수록 저희 서비스도 더 매력적이게 되기 때문에, 언제든지 연락주세요!
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingNine9">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseNine9" aria-expanded="false" aria-controls="collapseNine9">
                                    <h5 class="black-text font-weight-normal mb-0">
                                        원하는 답변을 찾지 못했어요. <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseNine9" class="collapse" role="tabpanel" aria-labelledby="headingNine9" data-parent="#accordionEx">
                                <div class="card-body">
                                    월요일~금요일 중 고객센터로 연락주시면 답변드리겠습니다. 주말에는 저희도 놀아야죠... 😃
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingTen10">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTen10" aria-expanded="false" aria-controls="collapseTen10">
                                    <h5 class="black-text font-weight-normal mb-0">
                                        튜터는 어떻게 찾나요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseTen10" class="collapse" role="tabpanel" aria-labelledby="headingTen10" data-parent="#accordionEx">
                                <div class="card-body">
                                    간단해요, 그냥 검색하면 됩니다.<br>
                                    <br>
                                    우선 배우고 싶은 과목/분야를 입력하시면 됩니다.<br>
                                    <br>
                                    검색 겨로가가 나온 후에는 상단에서 수준, 수업료에 따라 필터링이 가능합니다.
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingEleven11">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseEleven11" aria-expanded="false" aria-controls="collapseEleven11">
                                    <h5 class="black-text font-weight-normal mb-0">
                                        어떻게 하면 나에게 맞는 튜터 분을 선택할 수 있을까요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseEleven11" class="collapse" role="tabpanel" aria-labelledby="headingEleven11" data-parent="#accordionEx">
                                <div class="card-body">
                                    <span class="text-weight-bold">프로필의 투명성</span><br>
                                    <br>
                                    저희는 튜터분들이 수업 공고에 가능한 한 투명하게 경험, 수업 방법 및 이력 정보를 자세히 등록해주기를 요청하고 있습니다.<br>
                                    <br>
                                    <span class="text-weight-bold">개인 정보 및 제공된 정보 확인</span><br>
                                    <br>
                                    저희는 모든 튜터분들의 신원, 개인 정보(전화 번호, 이메일 주소, 사진) 및 자격증/대학 졸업장을 확인 및 검열하고 있어요.<br>
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingTwelve12">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTwelve12" aria-expanded="false" aria-controls="collapseTwelve12">
                                    <h5 class="black-text font-weight-normal mb-0">
                                        LearnUp Studio에서 뭘 배울 수 있나요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseTwelve12" class="collapse" role="tabpanel" aria-labelledby="headingTwelve12" data-parent="#accordionEx">
                                <div class="card-body">
                                    LearnUp Studio는 기본적으로 원하는 모든 것을 배우고 가르칠 수 있도록 연결해드리는 플랫폼입니다.<br>
                                    <br>
                                    온라인 화상 수업을 통해 진행되는 1,000개 이상 과목의 수업들을 만나보세요.<br>
                                    <br>
                                    - 언어<br>
                                    <br>
                                    - 음악<br>
                                    <br>
                                    - 건강과 운동<br>
                                    <br>
                                    - 예술<br>
                                    <br>
                                    등등...<br>
                                    <br>
                                    이제 배울 시간이네요! 😃
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingThirteen13">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseThirteen13" aria-expanded="false" aria-controls="collapseThirteen13">
                                    <h5 class="black-text font-weight-normal mb-0">
                                        수업료 정산은 어떻게 이루어지나요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseThirteen13" class="collapse" role="tabpanel" aria-labelledby="headingThirteen13" data-parent="#accordionEx">
                                <div class="card-body">
                                    LearnUp Studio는 한달에 한번씩 월말 정산을 통해 튜터의 수업료 총 금액에서 10%의 수수료를 정산하여 보내드립니다.
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingFourteen14">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseFourteen14" aria-expanded="false" aria-controls="collapseFourteen14">
                                    <h5 class="black-text font-weight-normal mb-0">
                                        LearnUp Studio의 일원이 되고 싶으신가요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseFourteen14" class="collapse" role="tabpanel" aria-labelledby="headingFourteen14" data-parent="#accordionEx">
                                <div class="card-body">
                                    다음 이메일 주소로 지원서를 보내주시면 검토 후 연락드리겠습니다: learnup@learnup.com
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-left border-right border-light">
                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingFifteen15">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseFifteen15" aria-expanded="false" aria-controls="collapseFifteen15">
                                    <h5 class="black-text font-weight-normal mb-0">
                                        어플리케이션은 없나요? <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <!-- Card body -->
                            <div id="collapseFifteen15" class="collapse" role="tabpanel" aria-labelledby="headingFifteen15" data-parent="#accordionEx">
                                <div class="card-body">
                                    현재 앱 개발 중이며 테스트 중입니다.<br>
                                    <br>
                                    조금만 기다려주시면 LearnUp Studio 서비스를 앱으로 이용하실 수 있을 거예요. 😃
                                </div>
                            </div>
                        </div>
                        <!-- Accordion card -->
                    </div>
                    <!-- Accordion wrapper -->
                </div>
            </div>
        </section>
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

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
  </body>
</html>