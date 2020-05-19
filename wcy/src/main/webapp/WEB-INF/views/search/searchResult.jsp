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
<link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/css/search.css'/>">
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="./jquery/jquery.js"></script>

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

</head>
<body>

 <jsp:include page="../include/header-sub.jsp" /> 

	<!-- ${condition} hidden 값으로 넘기기 -->
<main class="wcy-main-content">	
	<input type="hidden" id="reseult-con" name="reseult-con" value="${condition}"/>
	
	<c:if test="${fn:length(allProductList)==0 && fn:length(articleList)==0 }">
		<br><br>
		<div style="text-align: center; font-size:17px;">
			이런... <h2 style="color:red; font-weight:bold; font-size:23px;" class="mt10 mb10">${search}</h2> 로 찾은 검색결과가 없습니다.
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
		<%-- <div class="col-sm-2">
			<a href="<c:url value="/board/${board.boardNo}/register"/>"
				class="btn btn-outline-dark float-right">글쓰기</a>
		</div> --%>
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
	<div style="text-align:center;">
		<small><font color="red">*검색결과가 3개 이상이면 더보기 링크가 생깁니다~</font></small>
	</div>
	<br><br>
	
	
	<div id="contents">
		<c:if test="${fn:length(onList)!=0}">
			<h3 class="mb20 contents-title">온라인 강의 검색결과</h3>
			<table class="wp100 searchResult-table">
			
				<thead>
				<tr class="trHead">
					<th>썸네일</th>
					<th>상품번호</th>
					<th>상품타입</th>
					<th>상품이름</th>
					<th>상품정보</th>
					<th>상품가격</th>
					<th>등록일</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${onList}" varStatus="status" begin="0" end="1">
						<tr>
							<td class="tdImg"><img src="${p.productThumb}" alt="${p.productThumb}" class="tdImgSize"/></td>
							<td class="tdNo">${p.productNo}</td>
							<td class="tdType">${p.productType}</td>
							<td class="tdName">
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
							<td class="tdDetail">${p.productDetail}</td>
							<td class="tdPrice">${p.productPrice}</td>
							<td class="tdDate">${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(onList)> 3}">
				<div class="link">
					<a href="#"  onclick="location.href='/search?q=${search}&condition=${condition}&productType=0';"><i class="fas fa-search-plus mr5"></i>더 보기...</a>
				</div>
			</c:if>
		</c:if>
		<br>

		<c:if test="${fn:length(offList)!=0}">
			<h3 class="mt50 mb20 contents-title">오프라인 강의 검색결과</h3>
			<table class="wp100 searchResult-table">
				<thead>
				<tr class="trHead">
					<th>썸네일</th>
					<th>상품번호</th>
					<th>상품타입</th>
					<th>상품이름</th>
					<th>상품정보</th>
					<th>상품가격</th>
					<th>등록일</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${offList}" varStatus="status" begin="0" end="1">
						<tr>
							<td class="tdImg"><img src="${p.productThumb}" alt="${p.productThumb}" class="tdImgSize"/></td>
							<td class="tdNo">${p.productNo}</td>
							<td class="tdType">${p.productType}</td>
							<td class="tdName">
								<div class="tag">
									<c:forEach var="entry" items="${tagOff}">
										<c:if test="${entry.key eq status.index}">
											<c:if test="${fn:length(entry.value) > 0}">
												<c:forEach items="${entry.value}" var="tagName">
													<a href="<c:url value='/tag/searchProductByTag/${tagName}'/>" class="hashtag">${tagName}</a>
												</c:forEach>
												<br>
											</c:if>
										</c:if>
									</c:forEach>
									<a class="title_link" href="<c:url value="/product/${p.productNo}"/>">${p.productName}</a>
								</div>
							</td>
							<td class="tdDetail">${p.productDetail}</td>
							<td class="tdPrice">${p.productPrice}</td>
							<td class="tdDate">${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(offList)> 3}">
				<div class="link">
					<a href="#" onclick="location.href='/search?q=${search}&condition=${condition}&productType=1';"><i class="fas fa-search-plus"></i>더 보기...</a>
				</div>
			</c:if>
		</c:if>

		<br>

		<!-- product -->
		<c:if test="${fn:length(productList)!=0}">
			<h3 class="mt50 mb20 contents-title">상품 검색결과</h3>
			<table class="wp100 searchResult-table">
				<thead>
				<tr class="trHead">
					<th>썸네일</th>
					<th>상품번호</th>
					<th>상품타입</th>
					<th>상품이름</th>
					<th>상품정보</th>
					<th>상품가격</th>
					<th>등록일</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${productList}" varStatus="status" begin="0" end="1">
						<tr>
							<td class="tdImg"><img src="${p.productThumb}" alt="${p.productThumb}" class="tdImgSize"/></td>
							<td class="tdNo">${p.productNo}</td>
							<td class="tdType">${p.productType}</td>
							<td class="tdName">
								<div class="tag">
									<c:forEach var="entry" items="${tagP}">
										<c:if test="${entry.key eq status.index}">
											<c:if test="${fn:length(entry.value) > 0}">
												<c:forEach items="${entry.value}" var="tagName">
													<a href="<c:url value='/tag/searchProductByTag/${tagName}'/>" class="hashtag">${tagName}</a>
												</c:forEach>
												<br>
											</c:if>
										</c:if>
									</c:forEach>
									<a class="title_link" href="<c:url value="/product/${p.productNo}"/>">${p.productName}</a>
								</div>
							</td>
							<td class="tdDetail">${p.productDetail}</td>
							<td class="tdPrice">${p.productPrice}</td>
							<td class="tdDate">${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(productList)> 3}">
				<div class="link">
					<a href="#" onclick="location.href='/search?q=${search}&condition=${condition}&productType=2';"><i class="fas fa-search-plus"></i>더 보기...</a>
				</div>
			</c:if>
		</c:if>
		<br>

		<!-- article -->
		<c:if test="${fn:length(articleList)!=0}">
			<h3 class="mt50 mb20 contents-title">게시글 검색결과</h3>
			<table class="wp100 searchResult-table">
				<thead>
				<tr class="trHead">
					<th>글번호</th>
					<th>게시판</th>
					<th>제목</th>
					<th>내용</th>
					<th>등록일</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="a" items="${articleList}" varStatus="status" begin="0" end="1">
						<tr>
							<td class="tdNo">${a.articleNo }</td>
							<td class="tdType">${a.articleBoardNo}</td>
							<td class="tdName">
								<div class="tag">
									<c:forEach var="entry" items="${tagA}">
										<c:if test="${entry.key eq status.index}">
											<c:if test="${fn:length(entry.value) > 0}">
												<c:forEach items="${entry.value}" var="tagName">
													<a href="<c:url value='/tag/searchProductByTag/${tagName}'/>" class="hashtag">${tagName}</a>
												</c:forEach>
												<br>
											</c:if>
										</c:if>
									</c:forEach>
									<a class="title_link" href="<c:url value="/board/article/${a.articleNo}"/>">${a.articleTitle}</a>
								</div>
							</td>
							<td class="tdDetail"><span>${a.articleContent}</span></td>
							<td class="tdDate">${a.articleCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(articleList)> 3}">
				<div class="link">
					<a href="#" onclick="location.href='/search?q=${search}&condition=${condition}&productType=3';"><i class="fas fa-search-plus"></i>더 보기...</a>
				</div>
			</c:if>
		</c:if>
		</div>
	</c:if>
	<br>
	<hr>
	<a href="javascript:history.back()"><button class="btn btn-outline-primary">다시 검색하기</button></a>
</main>	
	

<script src="<c:url value='/js/search-filter.js'/>"></script>
<script src="<c:url value='/js/tag.js'/>"></script>


</body>
<jsp:include page="../include/footer.jsp" />
</html>




