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
<c:if test="${pvoList == null}">
	<h3>이런 검색결과가 없습니다. </h3>
	<hr>
	<h3>추천 태그 검색어</h3>
	<c:forEach var="pL" items="${ptagList}" varStatus="status">
		<button type="button" class="search_tag" id="${pL.tagNo}">${pL.tagName}</button>
	</c:forEach>
	
		
</c:if>

<c:if test="${pvoList != null}">
	<h3>검색결과입니다.</h3> 
	<hr>
	<c:forEach var="pL" items="${pvoList}" varStatus="status">
		<c:if test="${pL.productType == 0}">
		온라인
		</c:if>
		<c:if test="${pL.productType == 1}">
		오프라인
		</c:if>
		<c:if test="${pL.productType == 2}">
		책
		</c:if>
		: ${pL.productName}
		<br>
	</c:forEach>
</c:if>
	
	
</body>

<script>

	//tag btn 클릭 시 검색
	$('.search_tag').click(function() {
		var id_check = $(this).attr("id");
		console.log("clicked: " + id_check);
		location.href = '/tag/searchProductByTag/'+id_check;
	});
	
	
</script>
</html>