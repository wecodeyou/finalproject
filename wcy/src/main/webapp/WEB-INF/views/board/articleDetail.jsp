<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">
<title>article</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" 
integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

<style>

.a_content {
	margin:50px;
	/* text-align:center; */

}

.reply_input {
	width:100%;

}

</style>
</head>
<body>

	<br>
	<div style="text-align: center;">
		<h2>${board.boardTitle}</h2>
	</div>
<%-- <a href="javascript:history.back()">게시판으로 돌아가기</a>
	<button onclick="location.href='<c:url value='/board/${board.boardNo}'/>'">게시판으로 돌아가기</button> --%>
	<a href="javascript:history.back()">게시판으로 돌아가기</a><br>
	제목: ${article.articleTitle}
	생성일: ${article.articleCreatedAt}
	수정일: ${article.articleModifiedAt}
	<hr>
	
	<img src='<c:url value="/resources/img/commons/defaults/samplePic.jsp"/>' alt="프로필 사진" class="thumb" style="width:30%;" >
	작성자: ${user.userName}
	이메일: ${user.userEmail}
	가입일 : ${user.userCreatedAt}
	<hr>
	
	<div class="a_content">
		내용: ${article.articleContent}
	</div>
	
	<hr>
	
	<c:forEach var="r" items="${replyList}">
		<c:choose>
			<c:when test="${r.replyOrder< 1}">
				<p class="r_content">${r.replyContent}</p>
				${r.userName}님
				<small> ${r.replyCreatedAt}</small>
				<small> <a href="javascript:kaja(repl${r.replyNo})" class="">답글달기</a></small>
				<form class="repl-form" action="addReply.seo">
					<label for="exampleFormControlTextarea1"></label>
					<textarea class="reply_input" id="exampleFormControlTextarea1"
						rows="3" name="content"></textarea>
					<input type="hidden" name="re_depth" value="${r.replyDepth}" /> <input
						type="hidden" name="a_no" value="${article.articleNo}" /> <input
						type="submit" class="btn btn-primary mb-2" style="float: right;" />
				</form>
				<br><br>
			</c:when>
			<c:otherwise>
				<span></span>
				${r.userName}
				<small class="text-muted">${r.replyCreatedAt}</small>
				<p class="r_content">${r.replyContent} + 2</p>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
<%-- 	<form
		action="<c:url value='/board/reply-register/${article.articleNo}'/>"
		method="POST"> --%>
		<div>
		<div>
			<input type="text" id="reply-writer" value="9" readonly>
		</div>
			<input type="hidden" id="reply-article" value="${article.articleNo}" readonly>
			<input type="hidden" id="reply-board" value="${article.articleBoardNo}" readonly>
		<textarea class="reply_input" id="reply-content"
			rows="3" name="content"></textarea>
		<span class="input-group-btn">
			<button class="btn btn-primary" id="post-reply">답글달기</button>
		</span>
		</div>
<!-- 	</form> -->
<hr>
	<%-- <c:forEach var="r" items="${replyList}">
		<c:choose>
			<c:when test="${r.replyOrder< 1}">
				<h5 class="mb-3" style="float: left;">${r.userName}</h5>
				<small> ${r.replyCreatedAt}</small>
				<p class="mb-1" style="margin: 3%;">${r.replyContent}</p>
				<small> <a href="javascript:kaja(repl${r.replyNo})" class="">답글달기</a></small>
				<form class="repl-form" action="addReply.seo">
					<label for="exampleFormControlTextarea1"></label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3" name="content"></textarea>
					<input type="hidden" name="re_depth" value="${r.replyDepth}" /> <input
						type="hidden" name="a_no" value="${article.articleNo}" /> <input
						type="submit" class="btn btn-primary mb-2" style="float: right;" />
				</form>
			</c:when>
			<c:otherwise>
				<span></span>
				<h5 class="mb-1">${r.userName}</h5>
				<small class="text-muted">${r.replyCreatedAt}</small>
				<p class="mb-1">${r.replyContent}</p>
			</c:otherwise>
		</c:choose>

	</c:forEach>

	<form
		action="<c:url value='/board/reply-register/${article.articleNo}'/>"
		method="POST">
		<textarea class="form-control" id="exampleFormControlTextarea1"
			rows="3" name="content"></textarea>
		<span class="input-group-btn">
			<button class="btn btn-primary" type="submit">답글달기</button>
		</span>
	</form> --%>

<script type="text/javascript">
$(function(){
	
	$("#post-reply").click(function(){
		
		const writer = $("#reply-writer").val();
		console.log(writer);
		
		const content = $("#reply-content").val();
		console.log(content);

		const article = $("#reply-article").val();
		console.log(article);
		
		const board = $("#reply-board").val();
		console.log(board);		
		
		const url = "/board/" + board + "/post-reply"
		var data = {
				replyContent : content,
				replyWriter : writer,
				replyArticleNo: article
			}
			$.ajax({
				type: "POST",
				url : url,
				headers:{
					"Content-Type": "application/json"
				},
				dataType: "text",
				data:JSON.stringify(data),
				success: function(data){
					console.log("received output : " + data);
					if(data === "post-reply-success"){
							alert('댓글이 추가되었습니다');
							window.location.reload();
						}else{
							alert('웹사이트 오류입니다');
						}
					
				},
				error: function(request, status, error){
					console.log("POST : /board/${boardNo}/register 요청에 실패했습니다.")
					alert('댓글 등록에 실패하였습니다');
				}
			}); /* end ajax */
	});
});
function kaja(selector){
	$(selector).toggleClass("hidden");
}
</script> 
</body>
</html>