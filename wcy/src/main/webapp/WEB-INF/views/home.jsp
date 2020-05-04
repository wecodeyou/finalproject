<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>WE CODE YOU | HOME</title>
</head>
<body>

<jsp:include page="include/header.jsp" />


<jsp:include page="include/footer.jsp" />

<c:if test="${login == null}">
	<a href="<c:url value='/member/login' />" >LOGIN</a>
	<a href="<c:url value='/member/email-form' />" >JOIN</a>
</c:if>

<c:if test="${login != null}">
	<a href="<c:url value='/mypage/' />" >MYPAGE</a>
	<a href="<c:url value='/member/logout' />" onclick="return confirm('정말로 로그아웃 하시겠습니까?')">LOGOUT</a>
</c:if>

<a href="<c:url value='/board/list'/>" >BOARD</a>

<a href="<c:url value='/product'/>" >Product 리스트 보기</a>
<a href="/interest_list">INTEREST</a>

<a href="/tag">TAG를 PRODUCT에 등록</a>

<a href="<c:url value='/off/seat_main' />" >자리보기</a>

<a href="#">강사로 오프라인 강의 참석하기</a>
<a href="#">학생으로 오프라인 강의 참석하기</a>
</body>
</html>
