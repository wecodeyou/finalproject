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
</head>
<style>
table, th, td {
	border: 1px solid #bcbcbc;
}

table {
	width: 80%;
	height: 150px;
	margin-left: auto;
	margin-right: auto;
}

.link {
	text-align:right;
	width: 90%;
}
</style>
<body>

<c:if test="${fn:length(pvoList)==0 && fn:length(avoList)==0 }">
	<h3>이런... <font color="blue"> ${tagName}</font> 로 찾은 검색결과가 없습니다. </h3>
	<hr>
	<h3>추천 태그 검색어</h3>
	<c:forEach var="t" items="${tagList}" varStatus="status">
		<button type="button" class="search_tag" id="${t.tagNo}">${t.tagName}</button>
	</c:forEach>
</c:if>
	<c:if test="${fn:length(pvoList)!=0 || fn:length(avoList)!=0 }">

		<h3><font color="blue"> ${tagName}</font> 로 찾은 검색결과입니다.</h3>
		<hr>
		<!-- product -->
		<c:if test="${fn:length(productList)!=0}">
			<h3> fn:length(productList) matching results in Product</h3>
			<table border="2px">
				<thead>
					<th>썸네일</th>
					<th>상품번호</th>
					<th>상품타입</th>
					<th>상품이름</th>
					<!-- <th>상품정보</th> -->
					<th>상품가격</th>
					<th>등록일</th>
				</thead>
				<tbody>
					<c:forEach var="p" items="${productList}" varStatus="status"
						begin="0" end="2">
						<tr>
							<td><img src="${p.productThumb}" alt="${p.productThumb}"
								width="70px" height="70px" /></td>
							<td>${p.productNo}</td>
							<td>${p.productType}</td>
							<td><a href="<c:url value="/product/${p.productNo}"/>">${p.productName}</a></td>
							<%-- <td>${p.productDetail}</td> --%>
							<td>${p.productPrice}</td>
							<td>${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(productList)> 3}">
				<div class="link"><a href="#">더 보기...</a></div>
			</c:if>
		</c:if>
		<br>

		<c:if test="${fn:length(offList)!=0}">
			<h3>오프라인 강의 검색결과</h3>
			<table border="2px">
				<thead>
					<th>썸네일</th>
					<th>상품번호</th>
					<th>상품타입</th>
					<th>상품이름</th>
					<!-- <th>상품정보</th> -->
					<th>상품가격</th>
					<th>등록일</th>
				</thead>
				<tbody>
					<c:forEach var="p" items="${offList}" varStatus="status" begin="0"
						end="2">
						<tr>
							<td><img src="${p.productThumb}" alt="${p.productThumb}"
								width="70px" height="70px" /></td>
							<td>${p.productNo}</td>
							<td>${p.productType}</td>
							<td><a href="<c:url value="/product/${p.productNo}"/>">${p.productName}</a></td>
							<%-- <td>${p.productDetail}</td> --%>
							<td>${p.productPrice}</td>
							<td>${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(offList)> 3}">
				<div class="link"><a href="#">더 보기...</a></div>
			</c:if>
		</c:if>
		
		<br>

		<c:if test="${fn:length(onList)!=0}">
			<h3>온라인 강의 검색결과</h3>
			<table border="2px">
				<thead>
					<th>썸네일</th>
					<th>상품번호</th>
					<th>상품타입</th>
					<th>상품이름</th>
					<!-- <th>상품정보</th> -->
					<th>상품가격</th>
					<th>등록일</th>
				</thead>
				<tbody>
					<c:forEach var="p" items="${onList}" varStatus="status" begin="0"
						end="2">
						<tr>
							<td><img src="${p.productThumb}" alt="${p.productThumb}"
								width="70px" height="70px" /></td>
							<td>${p.productNo}</td>
							<td>${p.productType}</td>
							<td><a href="<c:url value="/product/${p.productNo}"/>">${p.productName}</a></td>
							<%-- <td>${p.productDetail}</td> --%>
							<td>${p.productPrice}</td>
							<td>${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(onList)> 3}">
				<div class="link"><a href="#">더 보기...</a></div>
			</c:if>
		</c:if>
		<br>
		
		<!-- article -->
		<c:if test="${fn:length(avoList)!=0}">
			<h3>게시글 검색결과</h3>
			<table border="2px">
				<thead>
					<th>글번호</th>
					<th>게시판</th>
					<th>제목</th>
					<th>조회수</th>
					<th>추천수</th>
					<th>글쓴이</th>
					<th>등록일</th>
				</thead>
				<tbody>
					<c:forEach var="a" items="${avoList}" varStatus="status"
						begin="0" end="2">
						<tr>
							<td>${a.articleNo }</td>
							<td>${a.articleBoardNo}</td>
							<td><a href="<c:url value="/board/article/${a.articleNo}"/>">${a.articleTitle}</a></td>
							<td>${a.articleClicks}</td>
							<td>${a.articleLikes}</td>
							<td>${a.articleWriter}</td>
							<td>${a.articleCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(avoList)> 3}">
				<div class="link"><a href="#">더 보기...</a></div>
			</c:if>
		</c:if>
	</c:if>
	<br>
	<hr>
	<a href="javascript:history.back()">다시 검색하기</a>
	
</body>
<script src="<c:url value='/js/tag.js'/>"></script>
</html>