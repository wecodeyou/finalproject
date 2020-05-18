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
    <div class="chat_box">
    </div>


</div>
	<h2>질문 출력창</h2>
	<div id="question-board">
		
	</div>
	<textArea id="question-input"></textArea>
	<button type="button" id="submit-q" disabled>질문등록</button>
<script>
    $(function () {
        var chatBox = $('.chat_box');
        var roomId = $('.id').text();
        var member = $('.member').text();

        var sock = new SockJS("/begin-session");
        var client = Stomp.over(sock);

        client.connect({}, function () {
            client.subscribe('/topic/off/room/' + roomId, function (note) {
                var content = JSON.parse(note.body);
                if(content.type === 'NOTE'){
    				chatBox.empty();
                    chatBox.append(content.message);         	
                } else if(content.type === 'QUESTION'){
                	$('#question-board').append("<p>" + content.writer + " : " + content.message + "</p>");
                } else if(content.type === 'ACTIVATE'){
                    $('#submit-q').attr('disabled', false);
                } else if(content.type === 'DEACTIVATE'){
                    $('#submit-q').attr('disabled', true);
                }  	
            });
        });
        $('#submit-q').click(function(e){
    		var content = $('#question-input').val();
            client.send('/lecture/message/note', {}, JSON.stringify({id: roomId, type:'QUESTION', message: content, writer: member})); 

        }); 
    });


</script>
</body>
</html>