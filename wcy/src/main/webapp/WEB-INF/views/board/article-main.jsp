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

<title>WE CODE YOU | 커뮤니티</title>
<style>
.wcy-main-content {
	width: 1160px !important;
	/* 	margin-left:0px !important;
	margin-right:0px !important; */
}

.article-table {
	text-align: left;
}


.article-gradient-tr {
	background: #c3cfde;
	opacity:0.8;
	font-size:13px;
}

.hashtag {
	color: #3A73FB;
	font-size:11px;
	font-weight: bold;
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
	width: 946px;
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

#keywordInput {
    border-radius: 5px;
    border:none;
    opacity:.8;
   	border: 1px solid #d3e0f1;
   	background:white;
    margin-left:-1px;
    margin-right:-1px;
    padding-top:20px;
    padding-bottom:19px;
    padding-left:10px;
    adding-right:10px;
    width: 419px;
    height: 15px;    
    font-size:18px;
}

#keywordInput:hover{
	background:white;
	border: 1px solid #93cfff;
	 border-radius: 5px;
}
#keywordInput:focus{
	background:white;
	border: 1px solid #93cfff;
}

#searchBtn{
	display:inline;height:41px;width:5%;
	
	border-radius: 5px;
}

</style>
</head>

<body>

	<jsp:include page="../include/header-sub.jsp" />

	<main class="wcy-main-content">
		<div class="wcy-contents">
			<div class="left-section-article">
				<h2>커뮤니티</h2>
				<ul class="left-sub-nav-article shadow rounded">
					<li><a href="<c:url value='1'/>">자유게시판</a></li>
					<li><a href="<c:url value='4'/>">질문게시판</a></li>
					<li><a href="<c:url value='7'/>">공유게시판</a></li>
					<li><a href="<c:url value='5'/>">정기모임/스터디</a></li>
					<li><a href="<c:url value='6'/>">IT행사</a></li>
				</ul>
			</div>
			<div class="right-section-article">
				<div class="right-contents-article">
					<h4 class="contents-title-article">${board.boardTitle}</h4>
					<div>
						<select id="condition" class="form-control" name="condition" 
						 style="display:inline;height:41px;width:16%;margin-top:1px; margin-left:10px;">
							<option value="title">제목</option>
							<option value="titleContent">제목+내용</option>
							<option value="hashtag">해시태그</option>
						</select>
						<input type="text" id="keywordInput"/>
						<button type="button" id="searchBtn">검색</button>
						<input type="hidden" id="reseult-con" name="reseult-con" value="${condition}"/>
						<input type="hidden" id="reseult-type" name="productType" value="3"/>
					</div>
					
					<!-- 글쓰기 버튼 유저타입과 공지게시판에 따라 다르게 노출 -->
					<div class="text-right">
						<c:if test = "${login == null}"> 
                           <a class="btn btn-outline btn-sm" href="#">
								<i class="fas fa-feather"></i><span style="color:#313D55;"> 로그인하셔야 글쓰기가 가능합니다.</span></a><br><br>
                        </c:if>
						<c:if test = "${login.userType == 2 && board.boardNo == 8}"> 
                           <a class="btn btn-outline btn-sm" href="<c:url value="/board/${board.boardNo}/register"/>">
								<i class="fas fa-feather"></i><span style="color:#313D55;"> 공지 작성</span></a><br><br>
                        </c:if>
                        <c:if test = "${(login.userType == 0 || login.userType == 1 || login.userType == 2) && board.boardNo != 8}"> 
                           <a class="btn btn-outline btn-sm" href="<c:url value="/board/${board.boardNo}/register"/>">
								<i class="fas fa-feather"></i><span style="color:#313D55;"> 글쓰기</span></a><br><br>
                        </c:if>
                         <c:if test = "${(login.userType == 0 || login.userType == 1 || login == null) && board.boardNo == 8}"> 
                           <br><br>
                        </c:if>
                    </div>
                    
					<div class="contents-box">
						<table class="table table-hover shadow p-3 mb-5 bg-white rounded">
							<thead class="article-table">
								<tr class="article-gradient-tr">
									<th style="width:10%;text-align:center;font-weight: bold;">번호</th>
									<th style="width:40%;font-weight: bold;">제목</th>
									<th style="width:10%;text-align:center;font-weight: bold;">글쓴이</th>
									<th style="width:20%;text-align:center;font-weight: bold;">날짜</th>
									<th style="width:10%;text-align:center;font-weight: bold;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="a" items="${articleList}" varStatus="status">
									<tr>
										<td style="text-align:center;">${a.articleNo}</td>
										<td style="height:10px !important;">
											<div class="tag">
												<c:forEach var="entry" items="${tagMap}">
													<c:if test="${entry.key eq status.index}">
														<c:if test="${fn:length(entry.value) > 0}">
															<c:forEach items="${entry.value}" var="tagName">
																<a href="#" type="button"class="hashtag">${tagName}</a>
															</c:forEach>
															<br>
														</c:if>
													</c:if>
												</c:forEach>
												<a class="title_link"
													href="<c:url value='/board/article/${a.articleNo}'/>">${a.articleTitle}</a>
											</div>
										</td>
										<td style="text-align:center;">${userNameList[status.index].userName}</td>
										<td style="text-align:center;">
											<fmt:formatDate value="${a.articleCreatedAt}" pattern="yyyy-MM-dd  kk:mm" /></td>
										<td style="text-align:center;">${a.articleClicks}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						
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
							page=${pc.endPage+1}&countPerPage=${pc.paging.countPerPage}'/>">
								<i class="fas fa-forward"></i></a>
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
	<script src="<c:url value = "/js/search-filter.js"/>"></script>
	
	<script>
	//start jQuery
	$(function() {

		//목록 개수가 변동하는 이벤트 처리
		$("#count-per-page .btn-izone").click(function() {
			console.log("목록 버튼이 클릭됨!");
			console.log($(this).val());
			let count = $(this).val();
			//location.href = "/board/list?countPerPage=" + count;
		});

		//검색 버튼 이벤트 처리
		$("#searchBtn").click(
				function() {
					console.log("검색 버튼이 클릭됨!");
					const keyword = $("#keywordInput").val();
					console.log("검색어: " + keyword);

					const condition = $("#condition option:selected").val();
					console.log("검색 조건: " + condition);

					location.href = "/search/filter?q=" + keyword
							+ "&condition=" + condition;

					
				});

		//엔터키 입력 이벤트
		$("#keywordInput").keydown(function(key) {

			if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
				$("#searchBtn").click();
			}

		});

	});//end jQuery
</script>


</body>

<jsp:include page="../include/footer.jsp" />
</html>