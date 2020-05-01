<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<title>tag</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" 
integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
</head>

<style>
.btnTag {
	margin: 5px;
	background-color: light-blue;
	opacity: 0.7;
	border: 0px;
}

.override {
    padding: 0px 0px 0px 0px !important;
    margin: 5px !important;
/*     margin-block-start: 0em !important;
    margin-block-end: 0em !important; */
}

#resultList li {
	list-style-type: none;
  	background-color: white;
  	width: 100px;
  	padding: 0px 4px 4px 4px;
  	margin: 2px;
  	display:inline;
}

#resultList li:hover,
#resultList li.--focus {
  	background: #e4e0ff;
  	cursor: pointer;
}

a {
  color: #3d6cec;
  font-family: helvetica;
  font-size: 90%; 
  text-decoration: none;
  /* text-transform: uppercase; */
}

/* Non-Demo Styles */
/* body {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
} */

</style>

<body>
	<!-- 태그 버튼 생성 -->
	<div id="selectedTagList"></div>
	
	<input type = "text" id="text" placeholder="#해시태그">
	<!-- <button type="button" id="btn_search" onclick="search();">검색</button>  -->
	<button type="button" id="btn_insertPtag" onclick="insertPtag();">등록</button>
	
	<ul class="override" id="resultList"></ul>

</body>

<script type="text/javascript">
	
	//input값
	var oldVal = null;
	var currentVal = null;
	
	//검색된 태그 결과 값
	var nameList = Array();
	var noList = Array();
	
	//태그 테이블에 있는 지 없는 지 (0 false, 1 true)
	var sw = 0;
	
	//등록된 태그 담는 
	var sendTagList = Array();
	
	$("#text").on("propertychange change keyup paste input", function() {
		var cv = $(this).val();
		
		
		//#로 시작하는지 검사
		if(!cv.startsWith( '#' )){
			cv = "#" + $(this).val();
		}
		
		//좌우공백제거
		currentVal = cv.replace(/ /gi, "");
		
		//space 제거
		//var currentVal = cv.replace(/ /gi, "");
		
		if (currentVal == oldVal) {
			return;
		}
		
		// input이 null값이면
		if(!currentVal){
			$("#resultList").empty();
			return; //break;
		}
		
		oldVal = currentVal;
		
		//start Ajax 검색
		$.ajax({
					type : 'POST',
					url : "/tag/checkTagDetail",
					headers : {"Content-Type" : "application/json"},
					data : oldVal,
					error : function(err) {
						console.log("ajax checkTagDetail 실행중 오류가 발생하였습니다.");
					},
					success : function(data) {
						
						//초기화
						$("#resultList").empty();
						sw = 0;
						
						//일치하는 결과가 없다면
						if(data.noList[0] === "no result"){
							console.log(data.noList[0]);						}
						else{
							sw = 1;
						}
							
							//배열에 넣기 (삭제 시 undifined로 출력됨)
							nameList = data.nameList;
							noList = data.noList;
							
							var checkWord = $("#text").val(); //검색어 입력값
							
							if (checkWord.length > 0 && data.nameList.length > 0) {
								for (i = 0; i < data.nameList.length; i++) {
									$("nameList").add(data.nameList[i]);
									$("noList").add(data.noList[i]);
									$("#resultList").append("<li 'class='resultList' value='"
	                                        + data.nameList[i]
	                                        + "' data-input='"
	                                        + data.nameList[i]
	                                        + "'>"
											+ "<a href='javascript:void(0);' value='"
											+ data.nameList[i]
											+ "'"
											+ "onclick='appendBtn("
											+ i
											+ ")' id='result"
											+ "'>"
											+ data.nameList[i]
											+ "</a>"
											+ "</li>");
								}

							}
						
						

					}
					
				});//end Ajax
				
	});//end #text-keyup-function
	
	
	//input enter 시 이벤트
	//$("#text").keyup(function(e){if(e.keyCode == 13)  함수호출 });
	
	
	function appendBtn(obj){
		if(sw == 0){ // no result
			insertTag();
			console.log('insert fucntion!');
			
		}else{
			clickLink(obj);
			console.log('clickLink fucntion!');
		}
	}
	

	function clickLink(obj) {
		var name = nameList[obj];
		var no = noList[obj];
		
		//중복검사
		if(document.getElementById(no)){
			return;
		}
		generateBtn(name, no);
	}
	
	// 새로운 태그 insert
	function insertTag(){
		
		var tag = currentVal;
		
		//insert into tag table
		$.ajax({
			type : 'POST',
			url : "/tag/insertTag",
			headers : {"Content-Type" : "application/json"},
			data : tag,
			error : function(err) {
				console.log("ajax insertTag 실행중 오류가 발생하였습니다.");
			},
			success : function(data) {
				if(data === "fail") {
					alert("태그 등록 실패!");
				} else{
					console.log("태그 등록 성공! " + data + "번 태그");
					
				    //태그 버튼 생성
				    generateBtn(tag, data);
				}
			}
			
		});//end Ajax
		
	}
	
	
	//버튼 객체 동적 생성
	function generateBtn(name, no){
		
		var btn = document.createElement( 'button' );
      	var btnText = document.createTextNode( name );
      	btn.appendChild( btnText );
      	btn.setAttribute("class", "btnTag");
      	btn.id = no; //id = tagId 값 (현재 문자열)
      	btn.value = name; //value = tagName
      	$("#selectedTagList").append(btn); 
      	
      	//리스트에 추가 <- 넘버[i]
      	sendTagList.push(no);
      	
      	for (var i = 0; i < sendTagList.length; i++) {
			console.log("등록: " + sendTagList[i] + " ");
		}
      	
      	//태그 버튼 누르면 삭제
      	btn.addEventListener ("click", function() {
      		//리스트에서 삭제 <- 넘버[i]
      		sendTagList.splice(sendTagList.indexOf(no),1);
      		
      		for (var i = 0; i < sendTagList.length; i++) {
				console.log("삭제 후 " + sendTagList[i] + " ");
			}
      		
      		//버튼 삭제
      		document.getElementById(no).remove();
      		
      		console.log("삭제완료!");
      		
      	});
      	
      	//추천 리스트 비우기
    	$("#resultList").empty();
      	//input창 비우기
    	document.getElementById('text').value = ''
    	//커서 focus
    	document.getElementById('text').focus();
	}
	
	
	//currentFocus
	var currentFocus;
	
	$(document).on("keyup", function(e){
		if(e.keyCode === 37 || e.keyCode === 39) {
			e.preventDefault(); //cancle event
			
			var children = $("#resultList").children();
			if(currentFocus === undefined) {
				currentFocus = 0;
			} else {
				currentFocus += e.keyCode === 37 ? -1 : 1;
				currentFocus < 0 && (currentFocus = children.length - 1);
				currentFocus >= children.length && (currentFocus = 0);
			}
			children.removeClass("--focus");
			children.eq(currentFocus).addClass("--focus");
		}
	}) 
	
	//enter keyCode => append btn
	
	
	//insert into ptag
	function insertPtag() {
		 
		//insert into ptag table  sendTagList(tagNo list) 보내기
		$.ajax({
			type : 'POST',
			url : "/ptag/insertPtag",
			headers : {"Content-Type" : "application/json"},
			data : JSON.stringify(sendTagList),
			error : function(err) {
				console.log("ajax insertPtag 실행중 오류가 발생하였습니다.");
			},
			success : function(data) {
				if(data === "success") {
					console.log("ptag 테이블에 등록 성공! ");
					//페이지 이동
					//self.location="/wecodeyou/WEB-INF/views/interest/interest-result.jsp";
				} else if(data === "fail") {
					alert("상품에 태그를 등록하지 못 했어요!");
				}
				
				
			}
			
		});//end Ajax
		
	}

</script>

</html>