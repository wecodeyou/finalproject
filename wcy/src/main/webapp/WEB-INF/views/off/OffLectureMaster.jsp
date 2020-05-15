<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- https://docs.spring.io/spring-framework/docs/5.0.0.BUILD-SNAPSHOT/spring-framework-reference/html/websocket.html -->
<html>

<head>

<meta charset="UTF-8">

<title>JSP</title>

<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js""></script>
<script type="text/javascript" src="<c:url value='/js/stomp.js'/>"></script>
</head>

<body>
<script>
$(function(){
	var socket = new SockJS(" <c:url value='/off/lecture' />");
	var stompClient = Stomp.over(socket);
	
	stompClient.connect({}, function(frame)) {
		
	}
});

</script>
</body>
</html>
