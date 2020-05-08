<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${fn:length(allProductList)==0 && fn:length(articleList)==0 }">
		<h3>이런... <font color="blue"> ${keyword}</font> 로 찾은 검색결과가 없습니다.</h3>
	</c:if>
	<c:if test="${fn:length(allProductList)!=0 || fn:length(articleList)!=0 }">
		<h3><font color="blue"> ${keyword}</font> 로 찾은 검색결과입니다.</h3>
		<hr>
	<div id="contents">
		<!-- product -->
		<c:if test="${fn:length(productList)!=0}">
			<h3>상품 검색결과</h3>
			<table border="2px">
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
					<c:forEach var="p" items="${productList}" varStatus="status"
						begin="0" end="2">
						<tr>
							<td><img src="${p.productThumb}" alt="${p.productThumb}"
								width="70px" height="70px" /></td>
							<td>${p.productNo}</td>
							<td>${p.productType}</td>
							<td><a href="<c:url value="/product/${p.productNo}"/>">${p.productName}</a></td>
							<td>${p.productDetail}</td>
							<td>${p.productPrice}</td>
							<td>${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(productList)> 3}">
				<div class="link">
					<a href="#">더 보기...</a>
				</div>
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
					<th>상품정보</th>
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
							<td>${p.productDetail}</td>
							<td>${p.productPrice}</td>
							<td>${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(offList)> 3}">
				<div class="link">
					<a href="#">더 보기...</a>
				</div>
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
					<th>상품정보</th>
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
							<td>${p.productDetail}</td>
							<td>${p.productPrice}</td>
							<td>${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(onList)> 3}">
				<div class="link">
					<a href="#">더 보기...</a>
				</div>
			</c:if>
		</c:if>
		<br>

		<!-- article -->
		<c:if test="${fn:length(articleList)!=0}">
			<h3>게시글 검색결과</h3>
			<table border="2px">
				<thead>
					<th>글번호</th>
					<th>게시판</th>
					<th>제목</th>
					<th>내용</th>
					<th>등록일</th>
				</thead>
				<tbody>
					<c:forEach var="a" items="${articleList}" varStatus="status"
						begin="0" end="2">
						<tr>
							<td>${a.articleNo }</td>
							<td>${a.articleBoardNo}</td>
							<td><a href="<c:url value="/board/article/${a.articleNo}"/>">${a.articleTitle}</a></td>
							<td><span>${a.articleContent}</span></td>
							<td>${a.articleCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(articleList)> 3}">
				<div class="link">
					<a href="#">더 보기...</a>
				</div>
			</c:if>
		</c:if>
		</div>
	</c:if>
	<br>
	<hr>
	<a href="javascript:history.back()">다시 검색하기</a>


<script>
/* $('#search').keyup(function () {
    var search = $('#search').val();
    $("#contents:contains('"+search+"')").each(function () {
        var regex = new RegExp(search,'gi');
        $(this).html( $(this).text().replace(regex, "<span class='text-red'>"+search+"</span>") );
    });
}); */

//$("span:contains('" + ${keyword} + "')").css({color:"red"});

var search = "자바";
console.log(search);

</script>


</body>
</html>