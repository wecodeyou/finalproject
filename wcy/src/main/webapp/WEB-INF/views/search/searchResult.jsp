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

.hashtag {
	color: #3A73FB;
	font-size:11px;
	font-weight: bold;
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
    width: 344px;
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
body span {
    display: block;  
}

div p {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width:450px;height: 20px;}
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
			<div>
				<select id="condition" class="form-control" name="condition" style="display: inline; height: 41px; width: 22%;; margin-top: 1px; margin-left: 10px;">
					<option value="title">제목</option>
					<option value="titleContent">제목+내용</option>
					<option value="hashtag">해시태그</option>
				</select> 
				<input type="text" id="keywordInput" />
				<button type="button" id="searchBtn">검색</button>
				<input type="hidden" id="reseult-con" name="reseult-con" value="${condition}" /> 
			</div>
			<!-- 검색창 끝-->
	<div style="text-align:center;">
		<ul class="override" id="resultList"></ul>
	</div>
	<!-- 추천 태그 -->
	<div style="text-align:right;">
		<c:forEach var="p" items="${ptagList}" begin="1" end="5" varStatus="status">
      		<button type="button" class="search_tag" id="${p.tagNo}">${p.tagName}</button>
    	</c:forEach>
	</div>
	<!-- 추천 태그 끝-->
	</c:if>
	
	
	<c:if test="${fn:length(allProductList)!=0 || fn:length(articleList)!=0 }">
		
	<!-- 검색창 -->
	<div class="row">
		<div class="col-sm-6"></div>
			<select id="condition" class="form-control" name="condition" style="display: inline; height: 41px; width: 12%; margin-top: 1px; margin-left: 10px;">
				<option value="title">제목</option>
				<option value="titleContent">제목+내용</option>
				<option value="hashtag">해시태그</option>
			</select> 
			<input type="text" id="keywordInput" />
			<button type="button" id="searchBtn">검색</button>
			<input type="hidden" id="reseult-con" name="reseult-con" value="${condition}" /> 
	</div>
	<!-- 검색창 끝-->
	<div style="text-align:center;">
		<ul class="override" id="resultList"></ul>
	</div>
	<!-- 추천 태그 -->
	<div style="text-align:right;">
		<c:forEach var="p" items="${ptagList}" begin="1" end="5" varStatus="status">
      		<button type="button" class="search_tag" id="${p.tagNo}">${p.tagName}</button>
    	</c:forEach>
	</div>
	<!-- 추천 태그 끝-->
	<br>
			<%-- <div class="text-right">
				<a class="btn btn-outline btn-sm"
					href="<c:url value="/board/${board.boardNo}/register"/>"> <i
					class="fas fa-feather"></i><span style="color: #313D55;">
						글쓰기</span></a><br> <br>
			</div>
			<br> --%>
	
	
	<div id="contents">
	
		<!-- article -->
		<c:if test="${fn:length(articleList)!=0}">
			<h3 class=" mb20 contents-title">${fn:length(articleList)} matching results in 게시글</h3>
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
					<c:forEach var="a" items="${articleList}" varStatus="status" begin="0" end="2">
						<tr>
							<td class="tdNo">${a.articleNo }</td>
							<td class="tdType">${a.articleBoardNo}</td>
							<td class="tdName">
								<div class="tag">
									<c:forEach var="entry" items="${tagA}">
										<c:if test="${entry.key eq status.index}">
											<c:if test="${fn:length(entry.value) > 0}">
												<c:forEach items="${entry.value}" var="tagName">
													<a href="#<%-- <c:url value='/tag/searchProductByTag/${tagName}'/> --%>" class="hashtag">${tagName}</a>
												</c:forEach>
												<br>
											</c:if>
										</c:if>
									</c:forEach>
									<a class="title_link" href="<c:url value="/board/article/${a.articleNo}"/>">${a.articleTitle}</a>
								</div>
							</td> 
							<td class="tdDetail">
								<c:set var = "contentVal" value='${a.articleContent.replaceAll("\\\<.*?\\\>","")}' />
								<p>${contentVal}</p></td>
							<td class="tdDate">${a.articleCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(articleList)> 3}">
				<div class="link">
					<a href="#" onclick="location.href='/search?q=${search}&condition=${condition}&productType=3';"><i class="fas fa-search-plus fa-lg"></i>더 보기...</a>
				</div>
			</c:if>
		</c:if>
		<br>
		
		<c:if test="${fn:length(onList)!=0}">
			<h3 class="mb20 contents-title">${fn:length(onList)} matching results in 온라인 강의</h3>
			<table class="wp100 searchResult-table">
			
				<thead>
				<tr class="trHead">
					<th>썸네일</th>
					<th>상품번호</th>
					<th>상품이름</th>
					<th>상품정보</th>
					<th>상품가격</th>
					<th>등록일</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${onList}" varStatus="status" begin="0" end="2">
						<tr>
							<td class="tdImg"><img src="${p.productThumb}" alt="${p.productThumb}" class="tdImgSize"/></td>
							<td class="tdNo">${p.productNo}</td>
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
								<a class="title_link" href="<c:url value="/curriculum/sub?s=${p.productName}"/>">${p.productName}</a>
							</div>
							</td>
							<td class="tdDetail"><p>${p.productDetail}</p></td>
							<td class="tdPrice">${p.productPrice}</td>
							<td class="tdDate">${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(onList)> 3}">
				<div class="link">
					<a href="#"  onclick="location.href='/search?q=${search}&condition=${condition}&productType=0';"><i class="fas fa-search-plus fa-lg"></i>더 보기...</a>
				</div>
			</c:if>
		</c:if>
		<br>

		<c:if test="${fn:length(offList)!=0}">
			<h3 class="mt50 mb20 contents-title">${fn:length(offList)} matching results in 오프라인 강의</h3>
			<table class="wp100 searchResult-table">
				<thead>
				<tr class="trHead">
					<th>썸네일</th>
					<th>상품번호</th>
					<th>상품이름</th>
					<th>상품정보</th>
					<th>상품가격</th>
					<th>등록일</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${offList}" varStatus="status" begin="0" end="2">
						<tr>
							<td class="tdImg"><img src="${p.productThumb}" alt="${p.productThumb}" class="tdImgSize"/></td>
							<td class="tdNo">${p.productNo}</td>
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
									<a class="title_link" href="<c:url value="/curriculum/sub?s=${p.productName}"/>">${p.productName}</a>
								</div>
							</td>
							<td class="tdDetail"><p>${p.productDetail}</p></td>
							<td class="tdPrice">${p.productPrice}</td>
							<td class="tdDate">${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(offList)> 3}">
				<div class="link">
					<a href="#" onclick="location.href='/search?q=${search}&condition=${condition}&productType=1';"><i class="fas fa-search-plus fa-lg"></i>더 보기...</a>
				</div>
			</c:if>
		</c:if>

		<br>

		<!-- product -->
		<c:if test="${fn:length(productList)!=0}">
			<h3 class="mt50 mb20 contents-title">${fn:length(productList)} matching results in 상품</h3>
			<table class="wp100 searchResult-table">
				<thead>
				<tr class="trHead">
					<th>썸네일</th>
					<th>상품번호</th>
					<th>상품이름</th>
					<th>상품정보</th>
					<th>상품가격</th>
					<th>등록일</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${productList}" varStatus="status" begin="0" end="2">
						<tr>
							<td class="tdImg"><img src="${p.productThumb}" alt="${p.productThumb}" class="tdImgSize"/></td>
							<td class="tdNo">${p.productNo}</td>
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
									<a class="title_link" href="<c:url value="/curriculum/sub?s=${p.productName}"/>">${p.productName}</a>
								</div>
							</td>
							<td class="tdDetail"><p>${p.productDetail}</p></td>
							<td class="tdPrice">${p.productPrice}</td>
							<td class="tdDate">${p.productCreatedAt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(productList)> 3}">
				<div class="link">
					<a href="#" onclick="location.href='/search?q=${search}&condition=${condition}&productType=2';"><i class="fas fa-search-plus fa-lg"></i>더 보기...</a>
				</div>
			</c:if>
		</c:if>
		<br>

		
		</div>
	</c:if>
	<br>
	<hr>
	<a class="moveTop"><button class="btn btn-outline-primary">다시 검색하기</button></a>
</main>	


<script src="<c:url value='/js/search-filter.js'/>"></script>
<script src="<c:url value='/js/tag.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script>
	   //원하는 타겟으로 스크롤 부드럽게 이동 (맨위로 이동)
		jQuery(document).ready(function($){
			$(".moveTop").click(function(event){
				event.preventDefault();
				$('html,body').animate({scrollTop:0},500);
			});
		});
	</script>

</body>
<jsp:include page="../include/footer.jsp" />
</html>




