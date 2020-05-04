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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

body {
	line-height: 1;
}

.container {
	height: 700px;
}

ol, ul {
	list-style: none;
}

blockquote, q {
	quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

/* 
---------------------------end css reset------------------------------------
*/
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

body {
	line-height: 1;
	font-family: "나눔바른고딕";
}

ol, ul {
	list-style: none;
}

blockquote, q {
	quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

a:active {
	text-decoration: underline;
}
/* 
---------------------------end css reset------------------------------------
*/
td:nth-child(6n + 1) {
	width: 5%;
}

td:nth-child(6n + 2) {
	width: 10%;
	padding: 0;
}

td:nth-child(6n + 2):hover {
	background-color: white;
}

td:nth-child(6n + 3) {
	width: 30%;
}

td:nth-child(6n + 4) {
	width: 15%;
	/*display: none;*/
}

td:nth-child(6n + 5) {
	width: 15%;
	/*display: none;*/
}

td:nth-child(6n) {
	width: 15%;
	/*display: none;*/
}

th {
	color: white;
}

th>a:link {
	color: white;
}

th:nth-child(6n + 1) {
	width: 10%;
}

th:nth-child(6n + 2) {
	width: 15%;
}

th:nth-child(6n + 3) {
	width: 35%;
}

th:nth-child(6n + 4) {
	width: 15%;
	/*display: none;*/
}

th:nth-child(6n + 5) {
	width: 15%;
}

th:nth-child(6n) {
	width: 15%;
}

table {
	width: 100%;
	border: 1px solid;
	text-align: center;
	margin: 0 auto;
	box-shadow: 2px 2px 2px;
	margin-top: 5%;
}

tr:nth-child(2n + 1) {
	
}

tr:nth-child(2n) {
	
}

thead {
	background-color: #084B8A;
	color: white;
	padding: 1%;
}

h2 {
	font-size: 4vw;
	margin: 0 auto;
	color: cornflowerblue;
}

.class-header {
	width: 100%;
	text-align: center;
	margin-bottom: 5%;
}

#search-form {
	border: #084B8A double;
	background-color: #084B8A;
	padding: 2%;
	width: 50%;
	margin: 0 auto;
}

tr {
	text-align: center;
	border-bottom: 1px solid;
	margin: 1%;
	padding-top: 0;
}

tr:hover {
	font-weight: bold;
}

#page {
	margin: 3%;
}

#admin-panel {
	background-color: #084B8A;
	width: 40%;
	margin-top: 1%;
	color: yellow;
	font-weight: bold;
	padding: 1%;
	float: right;
}

#admin-panel>button {
	margin: 2%;
}
</style>
<script type="text/javascript" src="./jquery/jquery.js"></script>

</head>
<body>
	<div class="container" id="container">
		<div class="content">
			<!-- 컨텐츠 영역 -->
			<div class="title">
				<ul>
					<li style="text-align: center;"><h2>${board.boardTitle}</h2>
				</ul>
			</div>
			<hr>
			<div class="content_in">
				<button onClick="location.href = '<c:url value="/board/${board.boardNo}/register"/>' ">게시글 추가하기</button>
				<table>
					<thead>
						<tr class="list-group list-group-horizontal">
							<th class="list-group list-group-horizontal">번호</th>
							<th class="list-group list-group-horizontal"><a
								href='#'>제목</a></th>
							<th class="list-group list-group-horizontal">글쓴이</th>
							<th class="list-group list-group-horizontal">조회수</th>
							<th class="list-group list-group-horizontal"><a
								href='#'>좋아요</a></th>
							<th class="list-group list-group-horizontal"><a
								href='#'>
									생성일</a></th>
							<th class="list-group list-group-horizontal">수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="a" items="${articleList}">
						<tr class="d-flex flex-row justify-content-between align-items-center list-group list-group-horizontal">
								<div class="row">
								<div class="col-md-4">
									<td class="list-group list-group-horizontal">${a.articleNo}</td> 
									<td class="list-group list-group-horizontal"><a href="<c:url value='/board/article/${a.articleNo}'/>">${a.articleTitle}</a></td>
									<td class="list-group list-group-horizontal">${a.articleWriter}</td>
									<td class="list-group list-group-horizontal">${a.articleClicks}</td>
									<td class="list-group list-group-horizontal">${a.articleLikes}</td>
									<td class="list-group list-group-horizontal">${a.articleCreatedAt}</td>
									<td class="list-group list-group-horizontal">${a.articleModifiedAt}</td>
								</div>
								</div>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				


			</div>
			<!--End content_in-->
		</div>
		<!--End content-->

		<!-- <div class="side_right"> 우측 사이드 영역</div> -->
		<!--		End #container-->
	</div>
<script>
/* $(function(){
	$('#register-button').click(function(){
		
		$.ajax({
			type: "POST",
			url : "<c:url value='/board/${boardNo}/write-article'/>",
			headers:{
				"Content-Type": "application/json"
			},
			dataType: "text",
			data:JSON.stringify(data),
			success: function(data){
				console.log("received output: " + data);
				if(data === "off_success"){
					location.href = "/product";
				} else{
					$('#message').text("서버에러가 발생하였습니다");
				}
			},
			error: function(request, status, error){
				$('#message').text("통신에 실패하였습니다");
			}
		});  end ajax 					
	});
});
*/
</script>
</body>
</html>