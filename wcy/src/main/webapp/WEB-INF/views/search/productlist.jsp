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
<title>온라인 강의 검색결과입니다</title>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="./jquery/jquery.js"></script>

<style>
table, th, td {
	border: 1px solid #bcbcbc;
}

table {
	width: 80%;
	height: 200px;
	margin-left: auto;
	margin-right: auto;
	text-align:center;
}

table .article_th {
	height:40px;
	background-color:#DBD9D9;/*gray*/
}

table .article_tr {
	height:50px;
}

table .no_td {
	width:5%;
}

table .title_td {
	width:30%;
	text-align:left;
}

table .writer_td {
	width:8%;
}

table .clicks_td {
	width:5%;
}

table .likes_td {
	width:5%;
}

table .created_td {
	width:15%;
	font-size:small;
}

table .modified_td {
	width:15%;
	font-size:small;
}

.tag {
	display:block;
}

.title_link {
	text-decoration: none;
	color:black;
	display:block;
	height:100%;
}

a:hover { text-decoration: none;}


.hashtag {
	font-size:70%;
}

.page_ul {
	text-align:center;
	margin-top:10px;
}

.page_li {
	display:inline;
	background-color: white;
	margin:5px;
	padding:5px;
}

.page_link {

}

/*순규님*/
header.masthead {
	
	display: none;
}	
.btn-orange {
	background-color: orange;
	color: white;
	font-size:80%;
}
.btn-izone {
	background-color: #B9E5EA;
	color: white;
	font-size:80%;
}

.page-active {
	background-color: #B9E5EA;
	font-size:80%;
}

.form-control {
	font-size:80%;
}

</style>
</head>
<body>

	<br><br>
	<div style="text-align: center;">
		<h2><b>검색결과</b></h2>
	</div>
	<br><br>
	<!-- 검색창 -->
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="form-group col-sm-2">
			<select id="condition" class="form-control" name="condition">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="titleContent">제목+내용</option>
				<option value="hashtag">해시태그</option>
			</select>
		</div>
		<div class="form-group col-sm-4">
			<div class="input-group">
				<input type="text" class="form-control" name="keyword"
					id="keywordInput" placeholder="검색어"> <span
					class="input-group-btn"> <input type="button" value="검색"
					class="btn btn-izone btn-flat" id="searchBtn">
				</span>
			</div>
		</div>
		<div class="col-sm-2">
		</div>
		<div class="col-sm-2"></div>
	</div>

	<!-- online -->
	<table>
		<thead>
			<tr class="article_th">
					<th class="">썸네일</th>
					<th class="">상품번호</th>
					<th class="">상품타입</th>
					<th class="">상품이름</th>
					<th class="">상품정보</th>
					<th class="">상품가격</th>
					<th class="">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p" items="${productList}">
					<tr class="article_tr">
						<td><img src="${p.productThumb}" alt="${p.productThumb}"
							width="70px" height="70px" /></td>
						<td class="no_td">${p.productNo}</td>
						<td>${p.productType}</td>
						<td class="title_td">
							<div class="tag">
								<c:forEach var="entry" items="${tagMap}">
									<c:if test="${entry.key eq status.index}">
										<c:if test="${fn:length(entry.value) > 0}">
											<c:forEach items="${entry.value}" var="tagName">
												<a href="<c:url value='/tag/searchProductByTag/${tagName}'/>"
													class="hashtag">${tagName}</a>
											</c:forEach>
											<br>
										</c:if>
									</c:if>
								</c:forEach>
								<a class="title_link" href="<c:url value="/on/${p.productNo}"/>">${p.productName}</a>
							</div>
						</td>
						<td>${p.productDetail}</td>
						<td>${p.productPrice}</td>
						<td>${p.productCreatedAt}</td>
					</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="page_ul">
		<!-- 이전 버튼 -->
		<c:if test="${pc.prev}">
			<li class="page_li"><a class="page_link"
				href="<c:url value='/board/${board.boardNo}?
						page=${pc.beginPage-1}&countPerPage=${pc.paging.countPerPage}'/>">
					이전</a></li>
		</c:if>
		<!-- 페이지 버튼 -->
		<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
			<li class="page_li"><a
				href="<c:url value='/board/${board.boardNo}?page=${pageNum}&countPerPage=${pc.paging.countPerPage}'/>"
				class="page_link ${(pc.paging.page == pageNum) ? 'page-active' : ''}">${pageNum}</a>
			</li>
		</c:forEach>
		<!-- 다음 버튼 -->
		<c:if test="${pc.next}">
			<li class="page_li"><a class="page_link"
				href="<c:url value='/board/${board.boardNo}?
							page=${pc.endPage+1}&countPerPage=${pc.paging.countPerPage}'/>">다음</a>
		</c:if>
	</ul>


</body>
</html>