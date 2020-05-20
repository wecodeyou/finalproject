<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" http-equiv="Content-Type"
	content="text/html; charset=utf-8"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/css/search.css'/>">
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	
</head>
<body>
 <jsp:include page="../include/header-sub.jsp" />

	<main class="wcy-main-content">
		<input type="hidden" id="reseult-con" name="reseult-con"
			value="${condition}" />




	<a class="moveTop"><button class="btn btn-outline-primary">다시 검색하기</button></a>
	</main>


	<script src="<c:url value='/js/search-filter.js'/>"></script>
<script src="<c:url value='/js/tag.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script>
	   //원하는 타겟으로 스크롤 부드럽게 이동 (맨위로 이동)
		jQuery(document).ready(function($){
			$(".moveTop").click(function(event){
				event.preventDefault();
				$('html,body').animate({scrollTop:0},500);
			});
		});
	</script>
</body>
<jsp:include page="../include/footer.jsp" />
</html>