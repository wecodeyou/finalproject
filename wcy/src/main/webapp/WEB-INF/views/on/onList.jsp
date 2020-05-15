<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


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
	
	
<h1>온라인 강의 리스트</h1>
	<c:forEach var="p" items="${productList}">
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
</html>