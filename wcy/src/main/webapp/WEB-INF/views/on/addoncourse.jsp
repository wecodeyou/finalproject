<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "/on/addepisode" method = "post">

<table border = "2" width = 70% align = "center">

	<tr>
		<td>상품번호</td><td>${product.productNo}</td></tr>
		<tr>
		<td>상품명</td><td>${product.productName}</td></tr>
		
		<tr><td>강사명</td><td>${login.userEmail}</td></tr>
 		<tr><td>강의카테고리</td>   
							<td>
								<select name="onType" id="onType">
									<option value="0">programming</option>
									<option value="1">cloud</option>
									<option value="2">network</option>
									<option value="3">system&server</option>
									<option value="4">hacking</option>
									<option value="5">database</option>
									<option value="6">자격증</option>					
								</select>
							</td></tr>
		<tr><td>강의일수</td><td><input type = "text" name = "days" required></td></tr>
</table>
</form>
</body>
</html>