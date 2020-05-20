<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상풉 리스트</title>
</head>
<body>
<h2>상품 리스트</h2>
	
	<span>
	<button onclick="location.href = '<c:url value = "/product/register"/>'">상품 추가하기</button>
	<button onclick="location.href = '<c:url value = "/off/register"/>'">오프라인강의 추가하기</button>
<%-- 	<button onclick="location.href = '<c:url value = "/product/update"/>'">상품 수정하기</button>	 --%>
	</span>
	
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

	<c:forEach var="p" items="${productList}">
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
		<th>상품이름</th>
		<th>상품가격</th>
		<th>등록일</th>
	</thead>
	<tbody>

	<c:forEach var="p" items="${productList}">
		<c:if test='${p.productType.equals("1")}'>
		<tr>
			<td><img src="${p.productThumb}" alt="${p.productThumb}" width="70px" height="70px"/></td> 
			<td>${p.productNo}</td>
			<td><a href="<c:url value="/curriculum/sub?s=${p.productName}"/>">${p.productName}</a></td>
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
		<th>상품이름</th>
		<th>상품가격</th>
		<th>등록일</th>
	</thead>
	<tbody>
	
	
<h2> 온라인만 출력</h2>
	<c:forEach var="p" items="${productList}">
		<c:if test='${p.productType.equals("0")}'>
		<tr>
			<td><img src="${p.productThumb}" alt="${p.productThumb}" width="70px" height="70px"/></td> 
			<td>${p.productNo}</td>
			<td><a href="<c:url value="/curriculum/sub?s=${p.productName}"/>">${p.productName}</a></td>
			<td>${p.productPrice}</td>
			<td>${p.productCreatedAt}</td>				
		</tr>
		</c:if>
	</c:forEach>	
	</tbody>
</table>

</body>
</html>