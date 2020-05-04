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
</head>
<body>
	
	
	<div>

		<table border="2">	
			<tr>
				<td>
				# 게시글 제목: 
				<input type="text" name="article_title" id="title"/>
				</td>
			</tr>
			<tr>
				<td>
				# : 내용
				<textArea  name="article_content"id="content" col="50" row="15"></textArea>
				</td>
			</tr>
			<tr>
			<td>
				# 글쓴이(나중에 세션처리): 
				<input type="text" name="article_writer" id="writer" value="9" readonly/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="text" placeholder="#해시태그">
					<ul class="override" id="resultList"></ul>
				</td>
			</tr>
			<tr>
				<td>
				<div id="selectedTagList"></div> 
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" id="article_register_btn" value="등록"/>
				</td>
			</tr>
		</table>		
	</div>
<script type="text/javascript">
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

</script>
<script src="<c:url value='/js/tag.js'/>"></script>
</body>
</html>