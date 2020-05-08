<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="${pageContext.request.contextPath}/resources/vendor/js/jquery-3.4.1.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<h2>오프라인 강의 시작하기</h2>
	
<div>
	<h3 id="message"></h3>
	<h3>아이디를 입력</h3>
	<form action="<c:url value='/off/myclass' />" method="POST">
	<input type="text" id="id-form" name="userEmail"/>
	<input type="submit" id="id-submit" value="제출"/>
	</form>
</div>		
	<div id="result-panel">
		<table border="2">
			<c:forEach var="o" items="${offList}">
				<tr>
					<td><a href="#">${o.productName}</a></td>
					<td>${o.offPlace}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>