<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 구매하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%
	Model model;
%>
</head>
<body>
<%-- 	${loginMember }
	<br>
	${tutor }
	<br>
	${myClass }<!-- 여기서는 특정 강의만 가져와야 한다. -->
	<br>
	${index }
	<br>
	${searchMember }
	<br>
	${searchTutor }
	<br>
	${searchClass } --%>

<script>


	$(function(){
		alert("결제하기 시작");
	    var IMP = window.IMP; // 생략가능
	    IMP.init('imp48286323'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    var msg;
	    
	    IMP.request_pay({
	        pg : 'kg이니시스',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : '${searchClass.subject_name }',
	        amount : 300 , //${searchClass.pay } , //우선 300원만 넣고 어떤 값이 넘어오는지 확인을 해보자.
	        buyer_email : '${loginMember.email }',
	        buyer_name : '${loginMember.nickname }',
	        <%-- buyer_tel : '<%=phone%>', --%>
	        <%-- buyer_addr : '<%=address%>', --%>
	        buyer_postcode : '${loginMember.m_code}',
	        //m_redirect_url : 'http://localhost:8090/site/updateMember.do'
	    }, function(rsp) {
	        if ( rsp.success ) {
	            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	            jQuery.ajax({
	                url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	                type: 'POST',
	                dataType: 'json',
	                data: {
	                    imp_uid : rsp.imp_uid
	                    //기타 필요한 데이터가 있으면 추가 전달
	                }
	            }).done(function(data) {
	                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                if ( everythings_fine ) {
	                    msg = '결제가 완료되었습니다.';
	                    msg += '\n고유ID : ' + rsp.imp_uid;
	                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                    msg += '\결제 금액 : ' + rsp.paid_amount;
	                    msg += '카드 승인번호 : ' + rsp.apply_num;
	                   
	                    alert("결제시간(1) : " + rsp.paid_at);
	                  
	                    
	                    alert(msg);
	                } else {
	                    //[3] 아직 제대로 결제가 되지 않았습니다.
	                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                }
	            });
	       /*      $.ajax({ 
	            	type : 'get',
                    url: 'updateSuccessMember.do', 
                    dataType : 'json',
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    data: {"pay_time" : rsp.paid_at},
                    success : function(data){
                    	var test = data.data;
                    	alert("결제시간(3) : " + test);
                    },
                    error : function(request, status, error){
                    	alert(error);
                    }
                    
                });  */
	           /*  alert("결제시간(2) : " + rsp.paid_at); */
	           location.href='updateSuccessMember.do?pay_time=' + rsp.paid_at; 
	        } else{
	            msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	            //실패시 이동할 페이지
	            location.href="http://192.168.0.11:8090/site/searchAllClassView.do";
	            alert(msg);
	        }
	    });
	    
	});
</script>
	
</body>
</html>