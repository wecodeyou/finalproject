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
	<c:forEach var="p" items="${ptagList}" varStatus="status">
		<button type="button" class="search_tag" id="${p.tagNo}">${p.tagName}</button>
	</c:forEach>
	
		
</c:if>

<c:if test="${pvoList != null}">
	<h3>검색결과입니다.</h3> 
	<hr>
	<c:forEach var="p" items="${pvoList}" varStatus="status">
		<c:if test="${p.productType == 0}">
		온라인
		</c:if>
		<c:if test="${p.productType == 1}">
		오프라인
		</c:if>
		<c:if test="${p.productType == 2}">
		책
		</c:if>
		: ${p.productName}
		<br>
	</c:forEach>
</c:if>
	
	
<h2>상품만 출력</h2>
<table border="2">
	<thead>
		<th>썸네일</th>
		<th>상품번호</th>
		<th>상품타입</th>
		<th>상품이름</th>
		<th>상품정보</th>
		<th>상품가격</th>
		<th>등록일</th>
	</thead>
	<tbody>

	<c:forEach var="p" items="${pvoList}">
		<c:if test='${p.productType.equals("2")}'>
		<tr>
			<td><img src="${p.productThumb}" alt="${p.productThumb}" width="70px" height="70px"/></td> 
			<td>${p.productNo}</td>
			<td>${p.productType}</td>
			<td><a href="<c:url value="/product/${p.productNo}"/>">${p.productName}</a></td>
			<td>${p.productDetail}</td>
			<td>${p.productPrice}</td>
			<td>${p.productCreatedAt}</td>				
		</tr>
		</c:if>
	</c:forEach>	
	</tbody>
</table>

<h2>오프라인만 출력</h2>
<table border="2">
	<thead>
		<th>썸네일</th>
		<th>상품번호</th>
		<th>상품타입</th>
		<th>상품이름</th>
		<th>상품정보</th>
		<th>상품가격</th>
		<th>등록일</th>
	</thead>
	<tbody>

	<c:forEach var="p" items="${pvoList}">
		<c:if test='${p.productType.equals("1")}'>
		<tr>
			<td><img src="${p.productThumb}" alt="${p.productThumb}" width="70px" height="70px"/></td> 
			<td>${p.productNo}</td>
			<td>${p.productType}</td>
			<td><a href="<c:url value="/off/${p.productNo}"/>">${p.productName}</a></td>
			<td>${p.productDetail}</td>
			<td>${p.productPrice}</td>
			<td>${p.productCreatedAt}</td>				
		</tr>
		</c:if>

	</c:forEach>	
	</tbody>
</table>

<table border="2">
	<thead>
		<th>썸네일</th>
		<th>상품번호</th>
		<th>상품타입</th>
		<th>상품이름</th>
		<th>상품정보</th>
		<th>상품가격</th>
		<th>등록일</th>
	</thead>
	<tbody>
	
	
<h2> 온라인만 출력</h2>
	<c:forEach var="p" items="${pvoList}">
		<c:if test='${p.productType.equals("0")}'>
		<tr>
			<td><img src="${p.productThumb}" alt="${p.productThumb}" width="70px" height="70px"/></td> 
			<td>${p.productNo}</td>
			<td>${p.productType}</td>
			<td><a href="<c:url value="/on/${p.productNo}"/>">${p.productName}</a></td>
			<td>${p.productDetail}</td>
			<td>${p.productPrice}</td>
			<td>${p.productCreatedAt}</td>				
		</tr>
		</c:if>
	</c:forEach>	
	</tbody>
</table>
	
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