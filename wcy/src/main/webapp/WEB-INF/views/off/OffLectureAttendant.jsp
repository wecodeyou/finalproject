<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
   
    <title>WE CODE YOU | 실시간 노트 공유</title>
<style>
    body{margin: 0; padding: 0;}
    .background-header{width:100%; height:40px;background: #000;}
    .fc-white{color: #fff;}
    .fw-bold{font-weight: bold;}
    .heade-info{
        padding: 7px;
    }
    .stu-name{float: right; font-size: 13px; line-height: 1.8; margin-right: 10px;}
    
    .teacher-contents{margin:40px 0px 30px 20px; display: flex;}
    .chat_box{margin-left: 30px;border:1px dashed #000; border-radius: 8px;padding: 10px;width: 670px;height: 400px;}
    
    .t-img{background:#000; width:90px; height:90px; border-radius: 50px;}
    .t-name{margin-top: 95px; text-align: center}
    
    .stu-contents{margin:10px 0px 30px 20px; display: inline-block;}
    .student-text{resize: none;margin-right: 30px;border:1px dashed #7d888e; border-radius: 8px;padding: 10px;}
    .student-question{resize: none;margin-right: 30px;border:0px;padding: 10px;}
    
    .s-img{background: #bbbbbb; width:90px; height:90px; border-radius: 50px; display: inline-block;}
    .s-name{margin-top: 95px; text-align: center; letter-spacing: -0.8; font-size: 14px;}
</style>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
    <script src="<c:url value='/js/stomp.js'/>"></script>
    
</head>
<body>

    <div class="header">
        <div class="background-header">
            <div class="heade-info fc-white">
                <span class="fw-bold">[${roomInfo.name}]</span> 실시간 노트 공유
                <span class="stu-name">${login.userName} 수강생</span>
            </div>
        </div>
    </div>
    <p class="id" style="display:none;">${roomInfo.id }</p>
	<p class="member" style="display:none;">${login.userNo}</p>
    
    <div class="teacher-contents">
        <div class="t-img">
            <p class="t-name">강사</p>
        </div>
        <div class="chat_box"></div>
       <!-- <textarea cols="90" rows="15" class="chat_box" readonly></textarea> -->
    </div>
    
    <div class="stu-contents">
		<div id="question-board"></div>
        <textarea cols="90" rows="5" id="question-input" class="student-text" placeholder="강사님께 질문을 전송할 수 있습니다요">
        </textarea>
        <div class="s-img">
            <p class="s-name">${login.userName} 수강생</p>
        </div>
    </div>
    <div>
        <button type="button" id="submit-q" disabled class="btn btn-dark" style="margin-left: 20px;">질문 전송</button>
      	enter 활성화 (shift+enter를 눌러 개행)<input type="checkbox" name="" id="enterAct" value="true" />	
    </div>
	
	
<script>
    $(function () {
        var chatBox = $('.chat_box');
        var roomId = $('.id').text();
        var member = $('.member').text();	// 유저의 번호로
        member = "${login.userName}";		// 유저의 이름으로
        
        var sock = new SockJS("/begin-session");
        var client = Stomp.over(sock);

        client.connect({}, function () {
            client.subscribe('/topic/off/room/' + roomId, function (note) {
                var content = JSON.parse(note.body);
                if(content.type === 'NOTE'){
    				chatBox.empty();
                    chatBox.append(content.message);         	
                } else if(content.type === 'QUESTION'){
                	$('#question-board').append("<p>나 : " + content.message + "</p>");
                } else if(content.type === 'ACTIVATE'){
                    $('#submit-q').attr('disabled', false);
                } else if(content.type === 'DEACTIVATE'){
                    $('#submit-q').attr('disabled', true);
                }  	
            });
        });
      
        String.prototype.replaceAll = function(org, dest) {
            return this.split(org).join(dest);
        }// replaceAll 만들기
        
        $('#submit-q').click(function(e){
    		var content = $('#question-input').val();
    		content = content.replaceAll("\n", "<br>"); // 줄바꿈 적용
            client.send('/lecture/message/note', {}, JSON.stringify({id: roomId, type:'QUESTION', message: content, writer: member})); 
            document.getElementById("question-input").value=''; // 보내고 나면 창비우기      
        }); 
            
        $("input:checkbox[id=enterAct]").change(function() {
        	if($("input:checkbox[id=enterAct]").is(":checked") == true){// 체크박스 여부 
    	        $('#question-input').keypress(function(e){   
    	            if(e.keyCode ==13){	// defalut = only enter
    	    			if (!e.shiftKey){ // shift+enter	 
    	 					$('#submit-q').click();
    						return false;    			
    					}
    	      	  	}   
    	       });       
            }else{ // 체크가 안돼있다면
            	$('#question-input').unbind(); // 이벤트 해제
            }
        });
    });

    

</script>
</body>
</html>