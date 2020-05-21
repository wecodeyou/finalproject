<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
    
    .content > .tx-editor-container > .tx-canvas > .tx-holder > #tx_canvas_wysiwyg > .tx-content-container{
    	padding: 15px !important;
    	width: 100% !important;
    	margin-right:0px !important;
    	margin-left:0px !important;
    }
    
    </style>
    
    <!-- 파비콘 적용 -->
	<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
    <script src="<c:url value='/js/stomp.js'/>"></script>
    
	<link rel="stylesheet" href="<c:url value='/resources/vendor/editor/css/editor.css' />" type="text/css" charset="utf-8"/>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
	<script src="<c:url value='/resources/vendor/editor/js/editor_loader.js?environment=development' />" type="text/javascript" charset="utf-8"></script>
</head>
<body>

    <div class="header">
        <div class="background-header">
            <div class="heade-info fc-white">
                <span class="fw-bold">[${roomInfo.name}]</span> 실시간 노트 공유
                <span class="stu-name">강사용</span>
            </div>
        </div>
    </div>

	<p class="id" style="display:none;">${roomInfo.id }</p>
	<p class="member" style="display:none;">${login.userNo}</p>
	
	<div class="content" style="padding: 20px;">
    <div id="chat_box">
    </div>
    <form id="note_submit">
 		<jsp:include page="/WEB-INF/views/include/editorFrame.jsp"></jsp:include>
    </form>
       <!-- <button type="button" id = "submit-btn" class="btn btn-dark">노트 전송</button> -->
</div>
	<span>
	<button type="button" id="activate-q" class="btn btn-primary" style="margin-left:20px;">질문창 활성화</button>
	<button type="button" id="deactivate-q" class="btn btn-danger" disabled>질문창 비활성화</button>
	</span>
	<p style="margin-left: 20px; margin-top: 10px; font-size:17px; font-weight:600;">학생 질문 리스트</p>
	<hr>
	<div id="question-board" style="margin-left: 20px; margin-top: 10px;">
		
	</div>
<script>
    $(function () {
        var chatBox = $('.chat_box');
        var messageInput = $('input[name="message"]');
        var sendBtn = $('.send');
        var roomId = $('.id').text();
        var member = $('.member').text();

        var sock = new SockJS("/begin-session");
        var client = Stomp.over(sock); // 1. SockJS를 내부에 들고 있는 client를 내어준다.

        client.connect({}, function () {
            client.send('/lecture/message/make', {}, JSON.stringify({id: roomId, type: 'JOIN', writer: member})); 
            client.subscribe('/topic/off/room/' + roomId, function (note) {
                var content = JSON.parse(note.body);
            if(content.type === 'NOTE'){

                chatBox.append(content.message);            	
            } else if(content.type === 'QUESTION'){
            	$('#question-board').append("<p>" + content.writer + " : " + content.message + "</p>");
            }
            

            });
        });


        
        
        $('#submit-btn').click(function(e){       
        	e.preventDefault();
            var content = Editor.getContent();
            console.log("content");       
            $('#note').remove();
            client.send('/lecture/message/note', {}, JSON.stringify({id: roomId, type:'NOTE', message: content, writer: member})); 

        }); 

        $('#activate-q').click(function(e){
            client.send('/lecture/message/note', {}, JSON.stringify({id: roomId, type:'ACTIVATE', writer: member})); 
            $(this).attr('disabled', true);
            $('#deactivate-q').attr('disabled', false);

        }); 
        
        $('#deactivate-q').click(function(e){
            client.send('/lecture/message/note', {}, JSON.stringify({id: roomId, type:'DEACTIVATE', writer: member})); 
            $(this).attr('disabled', true);
            $('#activate-q').attr('disabled', false);

        }); 
    	var config = {
    			txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
    			txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
    			txService: 'sample', /* 수정필요없음. */
    			txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
    			initializedId: "", /* 대부분의 경우에 빈문자열 */
    			wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
    			form: 'note_submit'+"", /* 등록하기 위한 Form 이름 */
    			txIconPath: "/vendor/editor/images/icon/editor/' /> ", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
    			txDecoPath: "/vendor/editor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
    			canvas: {
    	            exitEditor:{
    	            },
    				styles: {
    					color: "#123456", /* 기본 글자색 */
    					fontFamily: "굴림", /* 기본 글자체 */
    					fontSize: "10pt", /* 기본 글자크기 */
    					backgroundColor: "#fff", /*기본 배경색 */
    					lineHeight: "1.5", /*기본 줄간격 */
    					padding: "8px" /* 위지윅 영역의 여백 */
    				},
    				showGuideArea: false
    			},
    			events: {
    				preventUnload: false
    			},
    			sidebar: {
    				attachbox: {
    					show: true,
    					confirmForDeleteAll: true
    				},
    				// 이미지첨부 관련 추가
    			 attacher:{
    				 image:{ 
    					 features:{ left:250, top:65, width:400, height:190,scrollbars:0 }, 
    					//팝업창 사이즈 
    					popPageUrl:'${pageContext.request.contextPath}/daumeditor/img-popup'
    					//팝업창 주소 
    					} 
    				},	 
    			// 이미지첨부 관련 추가 
    				capacity:{
    					maximum: 5 * 1024 * 1024
    				}
    			},
    			size: {
    				contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
    			}
    		}
    	new Editor(config);
    	
        Editor.getCanvas().observeJob(Trex.Ev.__CANVAS_PANEL_KEYDOWN, function(e){
            if((e.keyCode>40 && e.keyCode<112) || (e.keyCode>123 && e.keyCode<126) || (e.keyCode>185 && e.keyCode<192) || (e.keyCode>218 && e.keyCode<223) || e.keyCode==229 || e.keyCode==32 || e.keyCode==8){
             var content = Editor.getContent();
             console.log("content");       
             $('#note').remove();
             client.send('/lecture/message/note', {}, JSON.stringify({id: roomId, type:'NOTE', message: content, writer: member}));                        
            }else{
               console.log(e.keyCode);
            }
          });// keydown 마다 전송

    });


</script>
</body>
</html>