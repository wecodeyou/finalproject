<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	text-align:center;
}

table .article_th {
	height:40px;
	background-color:#DBD9D9;/*gray*/
}

table .article_tr {
	height:50px;
}

table .article_no_td {
	width:5%;
}

table .article_title_td {
	width:30%;
	text-align:left;
}

table .article_writer_td {
	width:8%;
}

table .article_clicks_td {
	width:5%;
}

table .article_likes_td {
	width:5%;
}

table .article_created_td {
	width:15%;
	font-size:small;
}

table .article_modified_td {
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
	<table>
		<thead>
			<tr class="article_th">
				<th class="">번호</th>
				<th class="">제목</a></th>
				<th class="">글쓴이</th>
				<th class="">조회수</th>
				<th class="">좋아요</a></th>
				<th class="">생성일</a></th>
				<th class="">수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="a" items="${articleList}" varStatus="status">
				<tr class="article_tr">
							<td class="article_no_td">${a.articleNo}</td>
							<td class="article_title_td">
						<div class="tag">
							<c:forEach var="entry" items="${tagMap}">
								<c:if test="${entry.key eq status.index}">
									<c:if test="${fn:length(entry.value) > 0}">
										<c:forEach items="${entry.value}" var="item">
											<a href="#" class="hashtag">${item}</a>
										</c:forEach>
										<br>
									</c:if>
								</c:if>
							</c:forEach>
							<a class="title_link" href="<c:url value='/board/article/${a.articleNo}'/>">${a.articleTitle}</a>
						</div>
					</td>
							<td class="article_writer_td">${a.articleWriter}</td>
							<td class="article_clicks_td">${a.articleClicks}</td>
							<td class="article_likes_td">${a.articleLikes}</td>
							<td class="article_created_td">${a.articleCreatedAt}</td>
							<td class="article_modified_td">${a.articleModifiedAt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

<br><br><br>

	<script>

		<!-- <div class="side_right"> 우측 사이드 영역</div> -->
 <%-- $(function(){
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
}); --%>

</script>
</body>
</html>