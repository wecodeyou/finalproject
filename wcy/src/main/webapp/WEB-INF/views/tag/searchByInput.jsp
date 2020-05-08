<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">
<title>tag</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" 
integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

</head>
<body>
	<ul id="wcy-search">
		<li>
			<fieldset id="search-fieldset">
				<input type="search" id="search-input" placeholder="파이썬(Python)기초 프로젝트" />
				<button type="submit" id="search-btn">
					<i class="fa fa-search"></i>
				</button>
			</fieldset>
		</li>
	</ul>
	
<%-- 	<script src="<c:url value='/js/search.js'/>"></script> --%>
<script>

//start jQuery
$(function() {

	//검색 버튼 이벤트 처리
	$("#search-btn").click(
			function() {
				console.log("검색 버튼이 클릭됨!");
				const keyword = $("#search-input").val();
				console.log("검색어: " + keyword);

				//const condition = $("#condition option:selected").val();
				//console.log("검색 조건: " + condition);
				var url = "/search?q=" + keyword;
				location.href = url;
						//+ "&condition=" + condition;

			});

	//엔터키 입력 이벤트
	$("#search-input").keydown(function(key) {

		if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
			$("#search-btn").click();
		}

	});

});//end jQuery

</script>
</body>
</html>