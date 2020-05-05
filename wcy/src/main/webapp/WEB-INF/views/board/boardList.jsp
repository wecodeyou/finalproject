<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>게시판</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.register_btn {
	
}

.update_btn	{
	opacity: 0.8;
}

.delete_btn {
	opacity: 0.8;
}

.up_del_btn {
	display:inline-block;
	cursor: pointer;
	margin-top: 30px; 
	opacity: 0.8;
	font-size: 80%;
}

* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
	float: left;
	width: 25%;
	padding: 0 10px;
}

/* Remove extra left and right margins, due to padding in columns */
.row {
	margin: 0 -5px;
	width:80%;
	margin-left: auto;
	margin-right: auto;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Style the counter cards */
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	/* this adds the "card" effect */
	padding: 30px;
	width:90%;
	text-align: center;
	background-color: #f1f1f1;
	font-weight: bold;
}
.card:hover, .card:focus {
	oapcity:0.6;
	text-decoration: none;
	cursor: pointer;
	/* font-weight: bold; */
}

.card_title:hover, .card_title:focus {
	color: blue;
}

/* Responsive columns - one column layout (vertical) on small screens */
@media screen and (max-width: 600px) {
	.column {
		width: 100%;
		display: block;
		margin-bottom: 20px;
	}
}
</style>
</head>
<body>

	<br>
	<div style="text-align: center;">
		<h2>커뮤니티</h2>
	</div>
	
	<hr>
	일반회원
	<div class="row">
		<c:forEach var="b" items="${boardList}">
			 <div class="column">
    			<div class="card">
    				<div class="card_title"><a href="<c:url value='/board/${b.boardNo}' />">${b.boardTitle}</a></div>
    				<br>
    				<small>${b.boardDetail}</small>
    			</div>
    			
  			</div>
		</c:forEach>
	
	</div>
	
	<br><br><br><hr>
	관리자모드
	<button class="register_btn" onclick="location.href='<c:url value='/board/register'/>'">게시판 추가하기</button>
	<br><br>
	
	<div class="row">
		<c:forEach var="b" items="${boardList}">
			 <div class="column">
    			<div class="card">
    				<div class="card_title"><a href="<c:url value='/board/${b.boardNo}' />">${b.boardTitle}</a></div>
    				<br>
    				<small>${b.boardDetail}</small>
    				<div class="up_del_btn">
						<button class="update_btn"onclick="location.href='#'">수정</button>
						<button class="delete_btn" onclick="location.href='#'">삭제</button>
					</div>
    			</div>
    			
  			</div>
		</c:forEach>
	
	</div>
	
	
	<%-- <table>
		<!--테이블 헤더-->
		<tr>
			<th>게시판명</th>
			<th>게시판 설명</th>
			<th>관리자 메뉴</th>
		</tr>
		<c:forEach var="b" items="${boardList}">
			<tr>
				<td><a href="<c:url value='/board/${b.boardNo}' />">${b.boardTitle}</a></td>
				<td>${b.boardDetail}</td>
				<td><div class="form-check">
						<button class="btn btn-info" onclick="location.href='#'">수정</button>
					</div>
					<div class="form-check">
						<button class="btn btn-danger" onclick="location.href='#'">삭제</button>
					</div></td>
			</tr>
		</c:forEach>
	</table> --%>
		
		
		<%-- <tr class="list-group list-group-horizontal ">
			<th class="list-group-item w20">게시판명</th>
			<th class="list-group-item w50">게시판 설명</th>
			<th class="list-group-item w30">관리자 메뉴</th>
		</tr>
		<c:forEach var="b" items="${boardList}">
			<tr class="list-group list-group-horizontal">
				<td class="list-group-item w20"><a
					href="<c:url value='/board/${b.boardNo}' />">${b.boardTitle}</a> <span
					class="badge badge-pill badge-warning"></span></td>
				<td class="list-group-item w50">${b.boardDetail}</td>
				<td class="list-group-item w30">
					<div class="form-check">
						<button class="btn btn-info" onclick="location.href='#'">수정</button>
					</div>
					<div class="form-check">
						<button class="btn btn-danger" onclick="location.href='#'">삭제</button>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table> --%>

	<!--                 <table>
                테이블 헤더
			        <tr class="list-group list-group-horizontal ">
                        <th class="list-group-item w30">게시판명</th>
                        <th class="list-group-item w70">게시판 설명</th>
			        </tr>
					<tr class="list-group list-group-horizontal">
						<td class="list-group-item w30"> <a href='#'></a>
						<span class="badge badge-pill badge-warning"></span></td>
						<td class="list-group-item w70"></td>
					</tr>
				</table> -->
</body>
</html>