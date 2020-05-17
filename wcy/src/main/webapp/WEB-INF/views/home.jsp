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

<c:if test="${login.userType == 2}">
<a href="<c:url value='/board/list'/>" >BOARD</a>
<br>
<a href="<c:url value='/product'/>" >Product 리스트 보기</a>
<br>
<a href="/interest_list">INTEREST</a>
<br>
<a href="/interest_list/form">INTEREST-modal</a>
<br>
<a href="/tag">TAG</a>
<br>
<a href="<c:url value='/tag/searchByBtn'/>">TAG SEARCH by BTN</a>
<br>
<a href="<c:url value='/tag/searchByInput'/>">TAG SEARCH by INPUT TEXT</a>
<br>
<a href="<c:url value='/off/seat_main' />" >자리보기</a>
<br>
<a href="<c:url value='session/instructor/myclass'/>" >강사로 오프라인 강의 참석하기</a>
<br>
<a href="<c:url value='session/participant/myoff'/>" >학생으로 오프라인 강의 참석하기</a>

<br><br><br>
<a class="modal_open_btn" data-toggle="modal" data-target="#wcy-interest-modal">설문조사</a>

</c:if>


</body>
</html>
