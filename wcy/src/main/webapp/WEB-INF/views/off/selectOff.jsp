<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">
<title>오프라인 체크인</title>
<!-- <script src="${pageContext.request.contextPath}/resources/vendor/js/jquery-3.4.1.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<h2>오프라인 강의 입장</h2>
<div>
	<h3id="message"></h3>
	<h3>아이디를 입력</h3>
	<input type="text" id="id-form"/>
	<button id="id-submit">조회</button>
	
	<div id="result-panel">
		
	</div>
</div>
<script>
	$(function(){
		$('#id-submit').onClick(function(){
			
			const url = '/off/myoff/' + $('#id-form').val();
			$.ajax({
				type: "GET",
				url : "url",
				headers:{
					"Content-Type": "application/json"
				},
				dataType: "text",
				data:JSON.stringify(data),
				success: function(data){
					$('#message').text("통신 신공");
					$('#result-panel').append(data);
				},
				error: function(request, status, error){
					$('#message').text("통신에 실패하였습니다");
				}
			}); /* end ajax */				
		});
		
	});
</script>
</body>
</html>