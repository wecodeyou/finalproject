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
<link rel="stylesheet" href="<c:url value='/resources/vendor/editor/css/editor.css' />" type="text/css" charset="utf-8"/>
<script src="<c:url value='/resources/vendor/editor/js/editor_loader.js?environment=development' />" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<h1>${roomInfo.name}</h1>
<p class="id">${roomInfo.id }</p>
<p class="member">${login.userNo}</p>
<div class="content" >
 <!--    <ul class="chat_box">
    </ul> -->
    <div id="chat_box">
    	<p>보이니</p>
    </div>
    <form id="tx_editor_form">
 				<jsp:include page="/WEB-INF/views/include/editorFrame.jsp"></jsp:include>
<!--     <input name="message"> -->
    <button id = "submit"></button>
    </form>
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

        // 2. connection이 맺어지면 실행된다.
        client.connect({}, function () {
            // 3. send(path, header, message)로 메시지를 보낼 수 있다.
            client.send('/lecture/message/make', {}, JSON.stringify({id: roomId, type: 'JOIN', writer: member})); 
            // 4. subscribe(path, callback)로 메시지를 받을 수 있다. callback 첫번째 파라미터의 body로 메시지의 내용이 들어온다.
            client.subscribe('/topic/off/room/' + roomId, function (note) {
            	console.log(note);
                var content = JSON.parse(note.body);
                chatBox.append( content.message);
            });
        });

        sendBtn.click(function () {
            saveContent();
            var content = $('#note').val();
            client.send('/lecture/message/note', {}, JSON.stringify({id: roomId, type:'NOTE', message: content, writer: member}));

        });
        
/*         $("#tx_editor_form").on('submit', function(e) {
   			e.preventDefault();
   			e.stopPropagation();
        	console.log("sendNote 이벤트");
            saveContent();
            var content = $('#content').text();
            console.log("content");
            client.send('/lecture/message/note', {}, JSON.stringify({id: roomId, type:'NOTE', message: content, writer: member}));
            return false;
        }); */
        $('#submit').click(function(e){
        	e.preventDefault();
        	console.log("sendNote 이벤트");
            saveContent();
            var content = $('#content').text();
            console.log("content");
            client.send('/lecture/message/note', {}, JSON.stringify({id: roomId, type:'NOTE', message: content, writer: member}));
        });
    	var config = {
    			txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
    			txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
    			txService: 'sample', /* 수정필요없음. */
    			txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
    			initializedId: "", /* 대부분의 경우에 빈문자열 */
    			wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
    			form: 'tx_editor_form'+"", /* 등록하기 위한 Form 이름 */
    			txIconPath: "${ pageContext.request.contextPath }/resources/vendor/editor/images/icon/editor/' /> ", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
    			txDecoPath: "${ pageContext.request.contextPath }/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
    			canvas: {
    	            exitEditor:{
    	                /*
    	                desc:'빠져 나오시려면 shift+b를 누르세요.',
    	                hotKey: {
    	                    shiftKey:true,
    	                    keyCode:66
    	                },
    	                nextElement: document.getElementsByTagName('button')[0]
    	                */
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
    		
    		EditorJSLoader.ready(function(Editor) {

    			var editor = new Editor(config);
    		});
    });

	function saveContent() {
		Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
	}
	/**
	 * Editor.save()를 호출한 경우 데이터가 유효한지 검사하기 위해 부르는 콜백함수로
	 * 상황에 맞게 수정하여 사용한다.
	 * 모든 데이터가 유효할 경우에 true를 리턴한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 모든 데이터가 유효할 경우에 true
	 */
	function validForm(editor) {
		// Place your validation logic here

		// sample : validate that content exists
		var validator = new Trex.Validator();
		var content = editor.getContent();
		if (!validator.exists(content)) {
			alert('내용을 입력하세요');
			return false;
		}

		return true;
	}

	/**
	 * Editor.save()를 호출한 경우 validForm callback 이 수행된 이후
	 * 실제 form submit을 위해 form 필드를 생성, 변경하기 위해 부르는 콜백함수로
	 * 각자 상황에 맞게 적절히 응용하여 사용한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 정상적인 경우에 true
	 */
	function setForm(editor) {
        var i, input;
        var form = editor.getForm();
        var content = editor.getContent();

        // 본문 내용을 필드를 생성하여 값을 할당하는 부분
        var textarea = document.createElement('textarea');
        textarea.id = 'note';
        textarea.value = content;
        form.createField(textarea);

        /* 아래의 코드는 첨부된 데이터를 필드를 생성하여 값을 할당하는 부분으로 상황에 맞게 수정하여 사용한다.
         첨부된 데이터 중에 주어진 종류(image,file..)에 해당하는 것만 배열로 넘겨준다. */
        var images = editor.getAttachments('image');
        for (i = 0; i < images.length; i++) {
            // existStage는 현재 본문에 존재하는지 여부
            if (images[i].existStage) {
                // data는 팝업에서 execAttach 등을 통해 넘긴 데이터
                alert('attachment information - image[' + i + '] \r\n' + JSON.stringify(images[i].data));
                input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'attach_image';
                input.value = images[i].data.imageurl;  // 예에서는 이미지경로만 받아서 사용
                form.createField(input);
            }
        }

        var files = editor.getAttachments('file');
        for (i = 0; i < files.length; i++) {
            input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'attach_file';
            input.value = files[i].data.attachurl;
            form.createField(input);
        }
        return true;
	}
</script>
</body>
</html>