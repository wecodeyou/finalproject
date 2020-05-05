<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" http-equiv="Content-Type"
	content="text/html; charset=utf-8"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>게시판</title>

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
}

.tag {
	display:block;
}

</style>
</head>
<body>

	<br>
	<div style="text-align: center;">
		<h2>${board.boardTitle}</h2>
	</div>

	<hr>

	<button
		onClick="location.href = '<c:url value="/board/${board.boardNo}/register"/>' ">게시글
		추가하기</button>
	<table border="2px">
		<thead>
			<tr class="">
				<th class="">번호</th>
				<th class=""><a href='#'>제목</a></th>
				<th class="">글쓴이</th>
				<th class="">조회수</th>
				<th class=""><a href='#'>좋아요</a></th>
				<th class=""><a href='#'>생성일</a></th>
				<th class="">수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="a" items="${articleList}">
				<tr class="l">
					<div class="">
						<div class="col-md-4">
							<td class="">${a.articleNo}</td>
							<td class="">
								<div class="tag">
									<span>#해시태그자리</span>
									<a href="<c:url value='/board/article/${a.articleNo}'/>">${a.articleTitle}</a>
							</td>
							<td class="">${a.articleWriter}</td>
							<td class="">${a.articleClicks}</td>
							<td class="">${a.articleLikes}</td>
							<td class="">${a.articleCreatedAt}</td>
							<td class="">${a.articleModifiedAt}</td>
						</div>
					</div>
				</tr>
			</c:forEach>
		</tbody>
	</table>

				<ul class="pignation justify-content-center">
					<!-- 이전 버튼 -->
					<c:if test="${pc.prev}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/board/list?
						page=${pc.beginPage-1}&countPerPage=${pc.paging.countPerPage}'/>"
						style="background-color: #ff52a0; margin-top: 0; height: 40px;
						color: white; border: 0px solid #f78f24; opacity: 0.8">
						이전</a>
					</li>
					</c:if>	
						<!-- 페이지 버튼 -->
						<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
							<li class="page-item">
								<a href="<c:url value='/board/list?page=${pageNum}&countPerPage=${pc.paging.countPerPage}'/>"
								class="page-link ${(pc.paging.page == pageNum) ? 'page-active' : ''}" 
								style="margin-top: 0; height: 40px; color: pink; border: 1px solid pink;">${pageNum}</a>
							</li>
						</c:forEach>
						<!-- 다음 버튼 -->
						<c:if test="${pc.next}">
						<li class="page-item">
							<a class="page-link" href="<c:url value='/board/list?
							page=${pc.endPage+1}&countPerPage=${pc.paging.countPerPage}'/>"
							style="background-color: #ff52a0; margin-top: 0; height: 40px;
							 color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a>
						</c:if>
				</ul>

	<script>

		<!-- <div class="side_right"> 우측 사이드 영역</div> -->
		<!--		End #container-->


</script>
</body>
</html>