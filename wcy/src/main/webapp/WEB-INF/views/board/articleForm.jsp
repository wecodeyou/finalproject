<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">
<title>게시글 작성</title>
<!-- <script src="${pageContext.request.contextPath}/resources/vendor/js/jquery-3.4.1.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--
        에디터 리소스들을 로딩하는 부분으로, 경로가 변경되면 이 부분 수정이 필요.
        주의: 서비스에 이용시 loader 에 붙은 environment=development 값을 제거해야 브라우저 캐시를 사용할 수 있습니다.
    -->
<link rel="stylesheet" href="<c:url value='/resources/vendor/editor/css/editor.css' />" type="text/css" charset="utf-8"/>
<script src="<c:url value='/resources/vendor/editor/js/editor_loader.js?environment=development' />" type="text/javascript" charset="utf-8"></script>

</head>
<body>
	<form name="tx_editor_form" id="tx_editor_form" action="<c:url value='/board/${boardNo}/register' />" method="post">
			<div>
				# 게시글 제목: 
				<input type="text" name="articleTitle" id="title"/>
			</div>
			<div>
<!-- 				# : 내용
				<textArea  name="article_content"id="content" col="50" row="15"></textArea> -->
 				<jsp:include page="/WEB-INF/views/include/editorFrame.jsp"></jsp:include>
			</div>
			<div>
				# 글쓴이(나중에 세션처리): 
				<input type="text" name="articleWriter" id="writer" value="9" readonly/>
			</div>
			<div>
					<input type="text" id="text" placeholder="#해시태그">
					<ul class="override" id="resultList" name="resultList"></ul>
			</div>
			<div>
				<div id="selectedTagList"></div> 
				<input type="hidden" name="sendTagList" id="sendTagList" />
			</div>
			<div>
					<input type="submit" id="article_register_btn" onclick="saveContent()" value="등록"/>
			</div>	
	</form>
	
	
<script type="text/javascript">
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
				 features:{
					 left:250,
					 top:65,
					 width:400,
					 height:190,
					 scrollbars:0
				}, 
				//팝업창 사이즈 
				popPageUrl:'${pageContext.request.contextPath}/daumeditor/img-popup'
				//팝업창 주소 
				} 
			},	 
		// 이미지첨부 관련 추가 
			capacity: {
				maximum: 5 * 1024*1024
			}
		},
		size: {
			contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
		}
	};
	EditorJSLoader.ready(function(Editor) {

		var editor = new Editor(config);
	});
	function saveContent() {
		document.getElementById("sendTagList").value = sendTagList;
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
        textarea.name = 'articleContent';
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
<!-- <script type="text/javascript">
$(function(){
	$("#article_register_btn").click(function(){
		
		const title = $("#title").val();
		console.log(title);
		
		const content = $("#content").val();
		console.log(content);

		const writer = $("#writer").val();
		console.log(writer);
		
		var data = {
				articleTitle : title,
				articleContent : content,
				articleWriter : writer,
				sendTagList: sendTagList
			}
			$.ajax({
				type: "POST",
				url : "/board/${boardNo}/register",
				headers:{
					"Content-Type": "application/json"
				},
				dataType: "text",
				data:JSON.stringify(data),
				success: function(data){
					console.log("received output : " + data);
					if(data === "register-success"){
							location.href = "/board/${boardNo}";
						}
					
				},
				error: function(request, status, error){
					console.log("POST : /board/${boardNo}/register 요청에 실패했습니다.")
				}
			}); /* end ajax */
	});
});

</script> -->
<script src="<c:url value='/js/tag.js'/>"></script>
</body>
</html>