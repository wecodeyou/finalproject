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

<form action = "<c:url value = "/pay/gopay"/>" method = "post">

구매할 포인트
<input type = "text" name = "point">
<br>
<br>
 라디오 버튼<br>
  <input type='radio' name='radiop' value='100' />100P(테스트용)
  <input type='radio' name='radiop' value='10000' />10000P
  <input type='radio' name='radiop' value='50000' />50000P
  <input type='radio' name='radiop' value='100000' />100000P

<input type = "submit" value = "구매하기">
</form>

</body>
</html>