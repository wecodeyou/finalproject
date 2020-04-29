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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" 
integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
</head>

<style>
	
	.btnTag {
		margin:5px;
		background-color:light-gray;
		opacity:0.7;
		border:0px;
	}

</style>

<body>
<%-- 	<c:forEach var="tag" items="${nameList}" >
		${tag.tagName} <br/>
	</c:forEach> --%>
	
	<!-- 태그 버튼 생성 -->
	<div id="selectedTagList"></div>
	
	<input type = "text" id="text" placeholder="검색어를 입력하세요.">
	<button type="button" id="btn_insert">추가</button> 
	<ul id="resultList"></ul>
	
	

</body>

<script type="text/javascript">
	
	var oldVal = null;
	
	var nameList = Array();
	var noList = Array();
	
	//var selectedVal = null;
	//$("text").filter("[value='null']").val("");
	
	$("#text").on("propertychange change keyup paste input", function() {
		var currentVal = $(this).val();
		if (currentVal == oldVal) {
			return;
		}
		
		// input이 null값이면
		if(!currentVal){
			$("#resultList").empty();
			return; //break;
		}
		console.log("search: " + currentVal);
		
		oldVal = currentVal;
		
		
		//start Ajax
		$.ajax({
					type : 'POST',
					url : "/tag/checkTagDetail",
					headers : {"Content-Type" : "application/json"},
					data : oldVal,
					error : function(err) {
						console.log("ajax checkTagDetail 실행중 오류가 발생하였습니다.");
					},
					success : function(data) {
						
						//자바 배열에 넣기
						nameList = data.nameList;
						noList = data.noList;
						
						$("#resultList").empty();
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
										+ "onclick='clickLink("
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
	
	function clickLink(obj) {
		var name = nameList[obj];
		var no = noList[obj];
		
		//console.log("중복검사: " + document.getElementById(name).val());
		var jb = document.getElementById( name );
		if(jb){
			console.log("id로 찾은 값: " + jb);
		}
		
		//중복검사
		if(document.getElementById(name)){
			return;
		}
		
		//버튼 객체 동적 생성
		var btn = document.createElement( 'button' );
      	var btnText = document.createTextNode( name );
      	btn.appendChild( btnText );
      	btn.setAttribute("class", "btnTag");
      	btn.setAttribute("id", name);
      	btn.setAttribute("name", name);
      	btn.value = no; //value = tagId 값 (현재 문자열)
      	document.body.appendChild( btn );
      	btn.setAttribute("onclick", "f1(this)");
		
      	var divStart = "<div>";
      	var divEnd = "</div>";
      	$("#selectedTagList").append(btn);
      	
      	console.log("방금 들어간 버튼 값: " + name.value);
				
	}
	
	function f1(objButton){  
	    alert(objButton.value);
	}
	

</script>

</html>