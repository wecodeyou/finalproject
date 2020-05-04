<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	최근 활동 창입니다.

	<div>
		<h1>리뷰 목록</h1>
		<table>
			<tr>
				<th>강의 명</th>
				<th>내용</th>
				<th>작성일자</th>
			</tr>
			<%-- <c:choose>
			여기다가 내용 흩뿌리기 
			</c:choose> --%>
		</table>
	</div>
	<div>
		<h1>게시물 목록</h1>
		<table>
			<tr>
				<th>게시판 종류</th>
				<th>게시물 명</th>
				<th>내용(앞부분 일부만)</th>
				<th>작성일자</th>
				<th>댓글(새로운 댓글이 달리면 여기 아래에 new)</th>
			</tr>
		
		</table>
	</div>
	<div>
		<h1>댓글 목록</h1>
		<table>
			<tr>
				<th>게시판 종류</th>
				<th>게시물 명</th>
				<th>댓글 내용(앞부분 일부만)</th>
				<th>작성일자</th>
			</tr>
		
		</table>

	</div>


</body>
</html>