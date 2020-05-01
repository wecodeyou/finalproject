<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오프라인 강의 정보</title>
</head>
<body>
<h2>오프라인 강의 정보</h2>

	<div>
		<h2 id="message" style="color:red"></h2>
		<table border="2">	
			<tr>
				<td>
					오프라인 강의명
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
				<td>
				총 좌석수
				</td>
			  ${off.offSeats}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<img src="${product.productThumb}" alt="상품 썸네일" />
				</td>
			</tr>
			<tr>
				<td>
					장소
				</td>
				<td> 
					${off.offPlace}
				</td>
			</tr>
			<tr>
				<td>
					강사
				</td>
				<td>
					${off.offAuthor}
				</td>
			</tr>
			<tr>
				<td>
					상품종류
				</td>
				<td>
					<c:choose>
					<c:when test="${product.productType eq '1'}">
						<c:out value="현장강의"/>
					</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>
					강의종류
				</td>
				<td>
				<c:choose>
					<c:when test="${off.offCategory eq '0'}">
						<c:out value="programming"/>
					</c:when>
					<c:when test="${off.offCategory eq '1'}">
						<c:out value="cloud"/>
					</c:when>
					<c:when test="${off.offCategory eq '2'}">
						<c:out value="network"/>
					</c:when>
					<c:when test="${off.offCategory eq '3'}">
						<c:out value="System & Server"/>
					</c:when>
					<c:when test="${off.offCategory eq '4'}">
						<c:out value="hacking"/>
					</c:when>
					<c:when test="${off.offCategory eq '5'}">
						<c:out value="database"/>
					</c:when>
					<c:when test="${off.offCategory eq '6'}">
						<c:out value="certificates"/>
					</c:when>
				</c:choose>
				</td>
			</tr>
			<tr>
			<td>
				강의 시작일
			</td>
				${off.offStartAt}
			</td>
			</tr>
			<tr>
				<td>
				강의 종료일
				</td>
					${off.offEndAt}
				</td>
			</tr>
			<tr>
				<td>
				<button id="purchase-btn" >등록하기</button>
				</td>
			</tr>
		</table>		

	</div>
</body>
</html>