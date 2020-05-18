<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>오프라인 강의 세션 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
    <script src="<c:url value='/js/stomp.js'/>"></script>
</head>
<body>
<h1>${roomInfo.name}</h1>
<p class="id">${roomInfo.id }</p>
<p class="member">${login.userNo}</p>
<div class="content" >
    <ul class="chat_box">
    </ul>

</div>
<script>
    $(function () {
        var chatBox = $('.chat_box');
        var roomId = $('.id').text();
        var member = $('.member').text();

        var sock = new SockJS("/begin-session");
        var client = Stomp.over(sock); // 1. SockJS를 내부에 들고 있는 client를 내어준다.

        // 2. connection이 맺어지면 실행된다.
        client.connect({}, function () {
            client.subscribe('/topic/off/room/' + roomId, function (note) {
            	console.log(note);
                var content = JSON.parse(note.body);
                chatBox.append('<li>' + content.message + '(' + content.writer + ')</li>')
            });
        });

    });
</script>
</body>
</html>