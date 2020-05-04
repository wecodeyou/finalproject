<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>게시글</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
    
/* 
---------------------------end css reset------------------------------------
*/    
    
.board-page {

	width: 100%;
	background-color: antiquewhite;
	margin: 0 auto;
	
}
.board {
	margin: 0 auto;
	width: 80%;
	background-color: azure;
	margin: 0 auto;
	
}

.float-left {
	float: left;
}
	.float-right {
		float:right;
        
}
    
    .article {
        width:70%;
        margin: 0 auto;
    }
    .article-header {
        margin: 0 auto;
		margin-bottom: 10%; 
    }
    .header > div > h2 {
        font-size: 5vw;
        margin: 0 auto;
    }
    .flexbox >  p {
        display: flex;
        width: 30%;
        align-self: flex-start;
        border-right:1px ;
        margin: 0 auto;
    }
    .content {
        padding: 5%;
    }
    .comment-group {
        width: 100%;

    }
        .reply {
        width: 60%;
        margin: 0 auto;
        padding: 2.5%;
        border: 1px dashed;
    	background-color: red;
    }
    #comment-form {
        border: 1px solid;
        margin-top: 10%;
        width: 80%;
        padding-top: 5%;
        padding-bottom: 5%;
        margin-bottom:10%;

    }
    .comment{
        width: 60%;
        border: 1px solid;
        padding-left: 10%;
        padding-right:10%;
    }
    .textarea {
        width: 100%;
        height:100%;
    }
    .reply-form {
        flex: left;
        align-items: flex-start;
        justify-content: flex-start;
        width: 60%;
        height: 100%;
        
        background-color: #084B8A;
        border: 1px dashed;

    }
    .reply-form > input {
        width: 30%;
        margin: 0 auto;
    }
    .thumb {
        width: 30%;
        max-height: auto;
        margin: 0 auto;
        margin-bottom: 10%;
        margin-top:10%;
    }
    .comment-content {
        background-color: beige;
    }

	.class-header {
		width: 100%;
		text-align: center;
		margin-top: 10%;
		margin-bottom: 5%;
	}
	h2 {
		font-size: 5vw;
		margin: 0 auto;
		
	}
    .repl{
        width: 100%;
        margin-left:5%;
        background-color: rgb(241,241,241);
    }
    .repl-form {
        width: 60%;
        margin: 0 auto;

    }
    .hidden{
    display: none;
    }
    .article {
    margin-bottom: 10%;
    }
</style>
</head>
<body>
	<div class="container" id="container">
		<div class="content">

			<div class="title">
				<ul>
					<li style="text-align: center;"><h2>${board.boardTitle}</h2></li>
				</ul>
				<button onclick="location.href='<c:url value='/board/${board.boardNo}'/>'">게시판으로 돌아가기</button>
			</div>
			<hr>
			<div class="content_in">
	            <div class="article">
		            <div class= "article-header">
		                <div class="row">
		                    <div class="col-md">
		                    <h2>${article.articleTitle}</h2>
		                        <p class="float-right" >생성일: ${article.articleCreatedAt}</p>
		                        <p class="float-right">수정일: ${article.articleModifiedAt}</p>
           		           </div>
                        </div>
		            </div>
		            <div class="article-content">
        		<div style="margin-top:10%;">
        		${article.articleContent}
        		</div>
        </div>
        </div>
    <hr/>
    <div id=info-writer class="container" style="width: 80%;margin-top: 5%; margin-bottom: 5%; border: 1px solid;">
    <div class="row" style="padding-top: 10%;">
    <div class="col-sm">
    <img src='<c:url value="/resources/img/commons/defaults/samplePic.jsp"/>' alt="프로필 사진" class="thumb" style="width:30%;" >
        </div>
        <div class="col-sm">
        <h5>${user.userName}</h5>
            <p>${ user.userEmail}</p>
            <p>가입일 : ${user.userCreatedAt}</p>
        </div>
        </div>
    </div>
<hr/>

	<c:forEach var="r" items="${replyList}">
	<c:choose>
	<c:when test="${r.replyOrder< 1}">
	<div class="comment-group">
<div class="list-group">
  <div class="list-group-item list-group-item-action flex-column align-items-start" style="text-align: justify;max-height: 30%;text-overflow: ellipsis;">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-3" style="float:left;">${r.userName}</h5>
      <small> ${r.replyCreatedAt}</small>
    </div>
    <p class="mb-1" style="margin: 3%;">${r.replyContent}</p>
    <small>    
        <a href="javascript:kaja(repl${r.replyNo})" class="">답글달기</a></small>
  </div>
     <div id="repl${r.replyNo}" class="list-group-item list-group-item-action flex-column align-items-start hidden" style="padding: auto 0;">
      <form class="repl-form" action="addReply.seo" >
  <div class="form-group row d-flex align-items-start justify-content-between">
    <label for="exampleFormControlTextarea1"></label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content"></textarea>
			<input type="hidden" name="re_depth" value="${r.replyDepth}" />
			<input type="hidden" name="a_no" value="${article.articleNo}"/>
      <input type="submit" class="btn btn-primary mb-2" style="float: right;"/>
  </div>
    </form>
    </div>
</c:when>
<c:otherwise>
  <div class="list-group-item list-group-item-action flex-column align-items-start repl">
    <div class="d-flex w-100 justify-content-between"><span></span>
      <h5 class="mb-1">${r.userName}</h5>
      <small class="text-muted">${r.replyCreatedAt}</small>
    </div>
    <p class="mb-1">${r.replyContent}</p>
  </div>    
</c:otherwise>
 </c:choose>
</div>
</div>

</c:forEach>   

<div id="comment-form">
<div class="input-group" style="margin:5%;">
<form action="<c:url value='/board/reply-register/${article.articleNo}'/>" method="POST">
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content"></textarea>
  <span class="input-group-btn">
    <button class="btn btn-primary" type="submit">답글달기</button>
  </span>
</form>
  </div>
</div>
            </div>
        </div>

    </div>
<script>
function kaja(selector){
	$(selector).toggleClass("hidden");
}
</script> 
</body>
</html>