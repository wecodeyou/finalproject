<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
</head>
<body>
<h2>상품 정보</h2>

	<div>
		<h2 id="message" style="color:red"></h2>
		<table border="2">	
			<tr>
				<td>
					상품이름
				</td>
				<td>
					${product.productName}
				</td>
			</tr>
			<tr>
				<td>
					가격
				</td>
				<td>
					${product.productPrice}
				</td>
			</tr>
			<tr>
			<td>
				상품설명
			</td>
			<td>
				${product.productDetail}
			</td>
			</tr>
			<tr>
				<td colspan="2">
					<img src="${product.productThumb}" alt="상품 썸네일" />
				</td>
			</tr>
			<tr>
				<td>
					상품종류
				</td>
				<td>
					<c:choose>
					<c:when test="${product.productType eq '0'}">
						<c:out value="상품"/>
					</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>
				<button id="purchase-btn" >구매하기</button>
				</td>
			</tr>
		</table>		

	</div>
</body>
</html>