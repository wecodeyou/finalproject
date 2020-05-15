<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
</head>
<body>

<jsp:include page="include/header.jsp" />


<jsp:include page="include/footer.jsp" />

<a href="<c:url value='/board/list'/>" >BOARD </a>

<a href="<c:url value='/product'/>" > Product 리스트 보기 </a>

<a href="/interest_list"> INTEREST </a>

<a href="/interest_list/form"> INTEREST-modal </a>

<a href="/tag"> TAG </a>

<a href="<c:url value='/tag/searchByBtn'/>"> TAG SEARCH by BTN </a>

<a href="<c:url value='/tag/searchByInput'/>"> TAG SEARCH by INPUT TEXT </a>

<a href="<c:url value='/off/seat_main' />" > 자리보기 </a>

<a href="<c:url value='off/myclass'/>" > 강사로 오프라인 강의 참석하기 </a>

<a href="<c:url value='off/myoff'/>" > 학생으로 오프라인 강의 참석하기 </a>

<a class="modal_open_btn" data-toggle="modal" data-target="#wcy-interest-modal"> 설문조사 </a>

<!-- 설문조사 pop up modal -->
<script>
	window.onload = function(){
		showInterestModal();
	};
	
	function showInterestModal(){
		
		 $.ajax({
	            type: "POST",
	            url: "/member/checkUserInterest",
	            headers: {
	                   "Content-Type": "application/json"
	               },
	            dataType : "text",
	            success: function(data) {
	               console.log("통신성공 ! result: " + data);   
	               if(data === "pass") {
	            	   return;
	               }else if(data === "success"){
	            	   console.log("설문조사 모달을 엽니다.");
	            	   self.location="/interest_list/form";
	               }
	            },
	            error: function(){
	               console.log("통신실패!");
	            }
	         });
		
		
	} 

</script>
</body>
</html>
