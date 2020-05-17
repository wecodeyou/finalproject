<%@page import="com.it.wecodeyou.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<h1>포인트 구매 테스트 페이지</h1>

${login.userName}님 안녕하세요

<form action = "<c:url value = "/pay/gopay"/>" method = "post">

구매할 포인트
<input type = "text" name = "point">
<br>
 라디오 버튼<br>
  <input type='radio' name='radiop' value='100' />100P(테스트용)
  <input type='radio' name='radiop' value='10000' />10000P
  <input type='radio' name='radiop' value='50000' />50000P
  <input type='radio' name='radiop' value='100000' />100000P

<input type = "submit" value = "구매하기">
</form>



<c:if test="${login == null}">
	<script>   
	   alert("로그인이 필요한 서비스입니다.");
	   location.href="<c:url value='/' />";
	</script>
</c:if>	


</body>
</html>