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

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>

<link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/css/search.css'/>">
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<style>
	.searchResult-table{
		background-color: rgba(249,249,249,0.8);
		
	}

	.searchResult-table .tdImg{
		width:95px;
		height:80px;
	}
	
	.searchResult-table .tdImgSize{
		width:70px;
		height:70px;
	}
	
	.searchResult-table td.tdImg, td.tdNo, td.tdType, td.tdPrice, td.tdDate{
		vertical-align: middle;
		text-align: center;
	}
	
	.searchResult-table td.tdName, td.tdDetail{
		padding-left: 10px;
    	vertical-align: middle;
	}

	.searchResult-table tr.trHead{
		background-color: rgba(220,220,222,0.7);
		height: 30px;
   		line-height: 30px;
   		font-weight: 600;
	}

	.link{
		float:right;
		margin-top: 10px;
		margin-bottom: 20px;
	}
	
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="./jquery/jquery.js"></script>

</head>
<body>

 <jsp:include page="../include/header-sub.jsp" /> 

<main class="wcy-main-content">
	<!-- ${productType} hidden 값으로 넘기기 -->
	<input type="hidden" id="reseult-type" name="reseult-type" value="${productType}"/>

	<c:if test="${fn:length(allProductList)==0 && fn:length(articleList)==0 }">
		<br><br>
		<div style="text-align: center;">
			이런... <h2><font color="blue"><b> ${search}</b></font></h2> 로 찾은 검색결과가 없습니다.
		</div>
		<br><br>
		<!-- 검색창 -->
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="form-group col-sm-2">
			<select id="condition" class="form-control" name="condition">
				<option value="title">제목</option>
				<option value="titleContent">제목+내용</option>
				<option value="hashtag">해시태그</option>
			</select>
		</div>
		<div class="form-group col-sm-4">
			<div class="input-group">
				<input type="text" class="form-control" name="keyword"
					id="keywordInput" value="${search}" > <span
					class="input-group-btn"> <input type="button" value="검색"
					class="btn btn-izone btn-flat" id="searchBtn">
				</span>
			</div>
		</div>
		<div class="col-sm-2">
			<a href="<c:url value="/board/${board.boardNo}/register"/>"
				class="btn btn-izone float-right">글쓰기</a>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<!-- 검색창 끝-->
	<div style="text-align:center;">
		<ul class="override" id="resultList"></ul>
	</div>
	<!-- 추천 태그 -->
	<div style="text-align:center;">
		<c:forEach var="p" items="${ptagList}" begin="1" end="5" varStatus="status">
      		<button type="button" class="search_tag" id="${p.tagNo}">${p.tagName}</button>
    	</c:forEach>
	</div>
	<!-- 추천 태그 끝-->
	</c:if>
	
	<c:if test="${fn:length(allProductList)!=0 || fn:length(articleList)!=0 }">

	<br><br>
	<div style="text-align: center;">
		${search}으로 찾은
		<h2><b>검색결과</b></h2>
	</div>
	<br><br>
	
	<!-- 검색창 -->
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="form-group col-sm-2">
			<select id="condition" class="form-control" name="condition">
				<option value="title">제목</option>
				<option value="titleContent">제목+내용</option>
				<option value="hashtag">해시태그</option>
			</select>
		</div>
		<div class="form-group col-sm-4">
			<div class="input-group">
				<input type="text" class="form-control" name="keyword"
					id="keywordInput" value="${search}" > <span
					class="input-group-btn"> <input type="button" value="검색"
					class="btn btn-izone btn-flat" id="searchBtn">
				</span>
			</div>
		</div>
		<div class="col-sm-2">
			<a href="<c:url value="/board/${board.boardNo}/register"/>"
				class="btn btn-izone float-right">글쓰기</a>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<!-- 검색창 끝-->
	<div style="text-align:center;">
		<ul class="override" id="resultList"></ul>
	</div>
	<!-- 추천 태그 -->
	<div style="text-align:center;">
		<c:forEach var="p" items="${ptagList}" begin="1" end="5" varStatus="status">
      		<button type="button" class="search_tag" id="${p.tagNo}">${p.tagName}</button>
    	</c:forEach>
	</div>
	<!-- 추천 태그 끝-->
	<br>


	<!-- online -->
	<c:if test="${productType == 0}">
	<table>
		<thead>
			<tr class="article_th">
					<th class="">썸네일</th>
					<th class="">상품번호</th>
					<th class="">상품이름</th>
					<th class="">상품정보</th>
					<th class="">상품가격</th>
					<th class="">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p" items="${onList}" varStatus="status">
					<tr class="article_tr">
						<td><img src="${p.productThumb}" alt="${p.productThumb}" width="70px" height="70px" /></td>
						<td class="no_td">${p.productNo}</td>
						<td class="title_td">
							<div class="tag">
								<c:forEach var="entry" items="${tagOn}">
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
								<a class="title_link" href="<c:url value="/product/${p.productNo}"/>">${p.productName}</a>
							</div>
						</td>
						<td>${p.productDetail}</td>
						<td>${p.productPrice}</td>
						<td>${p.productCreatedAt}</td>
					</tr>
			</c:forEach>
		</tbody>
	</table>
	</c:if>
	
	<!-- offline -->
	<c:if test="${productType == 1}">
	<table>
		<thead>
			<tr class="article_th">
					<th class="">썸네일</th>
					<th class="">상품번호</th>
					<th class="">상품이름</th>
					<th class="">상품정보</th>
					<th class="">상품가격</th>
					<th class="">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p" items="${offList}" varStatus="status">
					<tr class="article_tr">
						<td><img src="${p.productThumb}" alt="${p.productThumb}" width="70px" height="70px" /></td>
						<td class="no_td">${p.productNo}</td>
						<td class="title_td">
							<div class="tag">
								<c:forEach var="entry" items="${tagOff}">
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
	</c:if>
	
	<!-- product -->
	<c:if test="${productType == 2}">
	<table>
		<thead>
			<tr class="article_th">
					<th class="">썸네일</th>
					<th class="">상품번호</th>
					<th class="">상품이름</th>
					<th class="">상품정보</th>
					<th class="">상품가격</th>
					<th class="">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p" items="${productList}" varStatus="status">
					<tr class="article_tr">
						<td><img src="${p.productThumb}" alt="${p.productThumb}" width="70px" height="70px" /></td>
						<td class="no_td">${p.productNo}</td>
						<td class="title_td">
							<div class="tag">
								<c:forEach var="entry" items="${tagP}">
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
	</c:if>
	
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
</c:if>
</main>

<jsp:include page="../include/footer.jsp" />

<script src="<c:url value='/js/search-filter.js'/>"></script>
<script src="<c:url value='/js/tag.js'/>"></script>

</body>
</html>