<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 파비콘 적용 -->
<link rel="shortcut icon"
	href="<c:url value='/img/favicon/wcy-favicon.ico'/>">

<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- search / tag -->
<link rel="stylesheet" href="<c:url value='/css/search.css'/>">
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">

<!-- 사용중인건지..? 확인하기 -->

<title>WE CODE YOU | 커뮤니티</title>
<style>
.wcy-main-content {
	width: 1180px !important;
	/* 	margin-left:0px !important;
	margin-right:0px !important; */
}

.article-table {
	text-align: left;
}

.write-btn {
	text-align: left !important;
	margin-bottom: 0px !important;
	padding: 0px !important;
}

.left-section-article {
	float: left;
	width: 210px;
	margin-top:0px;
}

.left-section-article>h2 {
	width: 180px;
	height: 112px;
	background: #25283D;
	color: #fff;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.left-section-article .left-sub-nav-article {
	width: 180px;
	border: solid #dbdbdb;
	border-width: 0 1px;
	box-sizing: border-box;
}

.left-section-article .left-sub-nav-article>li>a {
	padding: 10px 20px;
	font-size: 14px;
	display: block;
	position: relative;
	border-bottom: 1px solid #dbdbdb;
	font-weight: bold;
	color: #333;
}


.left-section-article .left-sub-nav-article>li:hover {
	background: #f4f4f4;
}


.right-section-article {
	width: 955px;
	float: right;
	position: relative;
}

.right-header-article .right-sub-nav-article {
	width: 100%;
	background: #f4f4f4;
	border-radius: 5px;
	display: table;
	table-layout: fixed;
	margin-bottom: 50px;
	overflow: hidden;
}

.right-header-article .right-sub-nav-article li {
	display: table-cell;
}

.right-header-article .right-sub-nav-article li a {
	display: block;
	height: 60px;
	box-sizing: border-box;
	font-size: 18px;
	color: #888;
	padding: 0 0 0 20px;
	line-height: 60px;
	border-bottom: 4px solid #ddd;
}

.right-sub-nav-article li a.active {
	color: #25283D;
	border-color: #25283D;
}

.contents-title-article:before {
	display: block;
	content: '';
	width: 50px;
	height: 3px;
	background: #25283D;
	position: absolute;
	left: 0;
	top: 0;
}

.contents-title-article {
	font-size: 22px;
	margin-bottom: 20px;
	color: #000;
	position: relative;
	padding-top: 5px;
	height: 40px;
	line-height: 40px;
	text-align: left;
}
</style>
</head>

<body>

	<jsp:include page="../include/header-sub.jsp" />

	<main class="wcy-main-content">
		<div class="wcy-contents">
			<div class="left-section-article">
				<h2>커뮤니티</h2>
				<ul class="left-sub-nav-article">
					<li><a href="#">자유게시판</a></li>
					<li><a href="#">질문게시판</a></li>
					<li><a href="#">공유게시판</a></li>
					<li><a href="#">정기모임/스터디</a></li>
					<li><a href="#">IT행사</a></li>
				</ul>
			</div>
			<div class="right-section-article">
				<div class="right-contents-article">
					<h4 class="contents-title-article">자유게시판</h4>
					<div class="text-right">
							<a class="write-btn" href="btn btn-outline-primary">글쓰기</a><br><br>
						</div>
					<div class="contents-box">
						<table class="table table-hover">
							<thead class="article-table">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>날짜</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="a" items="${articleList}" varStatus="status">
									<tr>
										<td>${a.articleNo}</td>
										<td>
											<div class="tag">
												<c:forEach var="entry" items="${tagMap}">
													<c:if test="${entry.key eq status.index}">
														<c:if test="${fn:length(entry.value) > 0}">
															<c:forEach items="${entry.value}" var="tagName">
																<a
																	href="<c:url value='/tag/searchProductByTag/${tagName}'/>"
																	class="hashtag">${tagName}</a>
															</c:forEach>
															<br>
														</c:if>
													</c:if>
												</c:forEach>
												<a class="title_link"
													href="<c:url value='/board/article/${a.articleNo}'/>">${a.articleTitle}</a>
											</div>
										</td>
										<td>${a.articleWriter}</td>
										<td><fmt:formatDate value="${a.articleCreatedAt}"
												pattern="yyyy.MM.dd  kk:mm" /></td>
										<td>${a.articleClicks}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<hr>
						
						<div class="text-center">
							<ul class="pagenation">
								<!-- 이전 버튼 -->
								<c:if test="${pc.prev}">
									<li class="page_li"><a class="page_link"
										href="<c:url value='/board/${board.boardNo}?
						page=${pc.beginPage-1}&countPerPage=${pc.paging.countPerPage}'/>">
											이전</a></li>
								</c:if>
								<!-- 페이지 버튼 -->
								<c:forEach var="pageNum" begin="${pc.beginPage}"
									end="${pc.endPage}">
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>



	<!-- 필요할지도 모르는 스크립트 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="./jquery/jquery.js"></script>

	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>
</body>

<jsp:include page="../include/footer.jsp" />
</html>