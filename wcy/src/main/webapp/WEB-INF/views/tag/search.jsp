<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">
<title>tag</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" 
integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

<style>
	.search_tag {
		display: inline-block;
		border:none;
		border-radius: 20px;
		opacity:0.6;
		text-align: center;
		font-size: 16px;
		margin: 4px 5px;
		padding: 5px 8px;
	}
	
	.search_tag:hover,
	
	.search_tag:focus {
       	color: blue;
        text-decoration: none;
        cursor: pointer;
        /* font-weight: bold; */
    }
	
</style>

</head>
<body>
<h3>추천 태그 검색어</h3>
	<c:forEach var="p" items="${ptagList}" varStatus="status">
		<button type="button" class="search_tag" id="${p.tagNo}">${p.tagName}</button>
	</c:forEach>
	
<hr>

<h3>태그를 눌러서 검색하기</h3>
	<c:forEach var="nL" items="${nameList}" varStatus="status">
		<button type="button" class="search_tag" id="${nL.tagNo}">${nL.tagName}</button>
	</c:forEach>


</body>

<script src="<c:url value='/js/tag.js'/>"></script>

<script>

	//tag btn 클릭 시 검색
	$('.search_tag').click(function() {
		var id_check = $(this).attr("id");
		console.log("clicked: " + id_check);
		location.href = '/tag/searchProductByTag/'+id_check;
	});
	
	
</script>

</html>