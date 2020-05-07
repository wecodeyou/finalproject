<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border=1>
		<tr>
			<th>차시</th>
			<th>강의내용</th>
			<!-- <th>시간</th> --> 
			<!-- 디비에 넣는거 깜빡; -->
			
			<!-- <th>진도율</th> -->
			<th>강의보기</th>
		</tr>
	<tbody>

	<c:forEach var="p" items="${episodeList}">
		<tr>
			<td>${p.episodeRowNo} 차시</td>
			<td>${p.episodeName}</td>
			<td><a href = "<c:url value = "/episode/play?episodeRowNo=${p.episodeRowNo}&episodeSource=${p.episodeSource}"/>">${p.episodeSource}  강의보기</a></td>
		</tr>
	</c:forEach>	
	</tbody>
			
		
	</table>
	<input type ="hidden" name = "episodeList" value = "${episodeList}">

</body>
</html>