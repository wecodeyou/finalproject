<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 파비콘 적용 -->
<link rel="shortcut icon"
   href="<c:url value='/img/favicon/wcy-favicon.ico'/>">

<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- search / tag -->
<link rel="stylesheet" href="<c:url value='/css/search.css'/>">
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">

<!-- table을 위함  -->
<link rel="stylesheet" href="<c:url value='/css/blog-post.css'/>">
<link rel="stylesheet" href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.css" />
<title>WE CODE YOU | 커뮤니티</title>
<style>

.post-reply {
   margin-top: 1px !important;
   margin-bottom: 1px !important;
}

.a_content {
   margin: 50px;
   /* text-align:center; */
}

.reply_input {
   width: 100%;
   border: 1px;
}

.r_content {
   margin-top: 5px;
   margin-bottom: 4px;
   font-size: 15px;
}

.r_writer {
   margin-top: 5px;
   margin-bottom: 10px;
   font-size: 13px;
}

.hashtag {
   color: #3A73FB;
   font-size: 11px;
   font-weight: bold;
}

.hash_tag {
   display: inline-block;
   border-radius: 13px;
   opacity: 0.8;
   text-align: center;
   font-size: 13px;
   margin: 3px 3px;
   margin-bottom: 4px;
   margin-right: 1px; padding : 4px 9px;
   background: #dfedff;
   border: 0.3px solid #d5e7ff;
   padding: 4px 9px;
}

.hash_tag:hover {
   background: white;
   border: 0.3px solid #c0dbff;
}

.wcy-main-content {
   width: 1190px !important;
   margin-left:80px;
   /*    margin-left:0px !important;
   margin-right:0px !important; */
}

.article-table {
   text-align: left;
}

.article-gradient-tr {
   background: #c3cfde;
   opacity: 0.8;
   font-size: 13px;
}

.write-btn {
   text-align: left !important;
   margin-bottom: 0px !important;
   padding: 0px !important;
}

.left-section-article {
   float: left;
   width: 210px;
   margin-top: 0px;
}

.left-section-article>h2 {
   width: 180px;
   height: 112px;
   background: #25283D;
   color: #fff;
   text-align: center;
   display: table-cell;
   vertical-align: middle;
}

.left-section-article .left-sub-nav-article {
   width: 180px;
   border: solid #dbdbdb;
   border-width: 0 1px;
   box-sizing: border-box;
}

.left-section-article .left-sub-nav-article>li>a {
   padding: 10px 20px;
   font-size: 14px;
   display: block;
   position: relative;
   border-bottom: 1px solid #dbdbdb;
   font-weight: bold;
   color: #333;
}

.left-section-article .left-sub-nav-article>li:hover {
   background: #f4f4f4;
}

.right-section-article {
   width: 980px;
   float: right;
   position: relative;
}

.right-header-article .right-sub-nav-article {
   width: 100%;
   background: #f4f4f4;
   border-radius: 5px;
   display: table;
   table-layout: fixed;
   margin-bottom: 50px;
   overflow: hidden;
}

.right-header-article .right-sub-nav-article li {
   display: table-cell;
}

.right-header-article .right-sub-nav-article li a {
   display: block;
   height: 60px;
   box-sizing: border-box;
   font-size: 18px;
   color: #888;
   padding: 0 0 0 20px;
   line-height: 60px;
   border-bottom: 4px solid #ddd;
}

.right-sub-nav-article li a.active {
   color: #25283D;
   border-color: #25283D;
}

.contents-title-article:before {
   display: block;
   content: '';
   width: 50px;
   height: 3px;
   background: #25283D;
   position: absolute;
   left: 0;
   top: 0;
}

.contents-title-article {
   font-size: 22px;
   margin-bottom: 20px;
   color: #000;
   position: relative;
   padding-top: 5px;
   height: 40px;
   line-height: 40px;
   text-align: left;
}

.contents-box-article {
<<<<<<< HEAD
	width: 100%;
	height: auto;
	padding: 8px;
	box-sizing: border-box;
	overflow-x: hidden;
	overflow-y: hidden;
	text-align: left;
	font-size: 17px;
	min-height:400px;
=======
   width: 100%;
   height: auto;
   padding: 8px;
   box-sizing: border-box;
   overflow-x: hidden;
   overflow-y: hidden;
   text-align: left;
   font-size: 17px;
>>>>>>> branch 'master' of https://github.com/wecodeyou/finalproject.git
}

   .hidden {
   display: none !important;
}
</style>
</head>

<body>

   <jsp:include page="../include/header-sub.jsp" />


   <main class="wcy-main-content">
      <div class="wcy-contents">
         <div class="left-section-article">
            <h2>커뮤니티</h2>
            <ul class="left-sub-nav-article shadow rounded">
               <li><a href="<c:url value='/board/1'/>">자유게시판</a></li>
               <li><a href="<c:url value='/board/4'/>">질문게시판</a></li>
               <li><a href="<c:url value='/board/7'/>">공유게시판</a></li>
               <li><a href="<c:url value='/board/5'/>">정기모임/스터디</a></li>
               <li><a href="<c:url value='/board/6'/>">IT행사</a></li>
            </ul>
         </div>
         <div class="right-section-article">
            <div class="right-contents-article">
               <h4 class="contents-title-article">${board.boardTitle} </h4>
                  <c:if test="${login.userNo == user.userNo}">
                     <div class="text-right">
                        <a class="btn btn-outline btn-sm" href="<c:url value="#"/>">
                           <i class="fas fa-feather"></i><span style="color:#313D55;"> 수정하기</span></a><br><br>
                     </div>
                  </c:if>
               <div >
                  <div class="container" style="text-align:left !important;">
                     <div class="row">
                        <!-- Post Content Column -->
                        <div class="col-lg-8" style="padding-top:5px;margin-left: -23px;">
                           
                           <!-- Author -->
                           <p style="text-align:left; font-size:16px;padding-left:8px; color:#bf8fbe">
                              글쓴이<i class="fas fa-user-tag"></i> <a href="#"> ${user.userName}</a>
                           </p><br><br>
                           
                           <!-- Title -->
                           <span style="font-size:26px; font-weight:bold; padding-left:8px;">
                              ${article.articleTitle} 댓글 수 ${countReply}
                           </span><br>
                           <hr>
                           <!-- Date/Time -->
                           <p style="padding-left:8px;">작성일 <fmt:formatDate value="${article.articleCreatedAt}" pattern="yyyy년 MM월 dd일  kk시 mm분" /></p>


                           <hr>
                           <!-- Preview Image -->
                           <!-- <img class="img-fluid rounded"
                              src="http://placehold.it/900x300" alt=""> -->
                           <!-- Post Content -->
                           <div class="contents-box-article">
                              <p >${article.articleContent} </p>
                           </div>
                           <hr>

                           <!-- Single Comment -->
                           <c:forEach var="r" items="${replyList}" varStatus = "status">
                                <c:choose>
                                   
                                   <c:when test="${r.replyOrder == 0}">
                                      <c:if test="${status.index ne 0 }">
                                         <hr>
                                      </c:if>
                                   
                                      <div class="media mb-4">
                                       <img class="d-flex mr-3 rounded-circle" src="${profileImg[status.index]}" alt="" width = "60px" height = "60px">
                                             <div class="media-body">
                                                <div class="r_writer">${r.userName} <i class="far fa-comment-dots"></i></div>
                                                <p class="r_content">${r.replyContent}</p>
                                                   <input type="hidden" id="reply-writer" value="${login.userNo}" />
                                                      <div style="text-align:right; margin-bottom:5px;">
                                                         <small> <fmt:formatDate value="${r.replyCreatedAt}" pattern="yyyy.MM.dd  kk:mm" /></small>
                                                            <small> <a href="javascript:showReplyForm('.repl${r.replyNo}')" 
                                                                  class="btn btn-outline-primary btn-xs" style="font-size: 12px;font-weight: bold;padding: 3px; margin: 0px 0 3px 5px;">답글</a></small>
                                                      </div>
                                                      <c:set var = "indexNo" value = "${status.index}" />
                                                   <hr style="margin-bottom: 0 !important;margin-top: 0 !important;margin-left: -75px !important;">
                                             </div><!-- media body -->
                                       </div><!-- media mb-4s -->
                                       
                                       
                                       <div class="media mb-4 hidden repl${r.replyNo}"  style="margin-left: 57px;" >
                                       <%-- <img class="d-flex mr-3 rounded-circle" src="${login.userProfileImg}" alt="" width = "60px" height = "60px"> --%>
                                          <div class="media-body">
                                             <div class="r_writer">${r.userName}님에게 답글 남기기 <i class="far fa-comment-dots"></i></div>
                                             <div style="text-align:right; margin-bottom:5px;">
                                                <form method="post" action="/board/${board.boardNo}/post-reply">
                                                   <input type="hidden" id="reply-writer" name="" value="${login.userNo}" />
                                                   <input type="hidden" name="replyParent" value="${r.replyNo}"/>
                                                   <input type="hidden" name="replyArticleNo" value="${article.articleNo}"/>
                                                      <textArea rows="2" cols="90" id="reply-content"name="replyContent" style="border: 1px solid #ccc;float:left;resize:none;background: #eaeaea6b;padding: 5px;font-size: 12px;"></textArea>                                          
                                                      <small>
                                                         <input type="submit" id="post-reply" value="달기" class="btn-sm btn-outline-default"
                                                          style="float: right; margin-top:3px !important; background:white; color:gray;border:0.7px solid gray; "/>
                                                      </small>
                                                    </form>
                                             </div>
                                          </div><!-- media body -->
                                       </div><!-- media mb-4s -->
                                       
                                       
                                   </c:when>
                                       
                                       <c:otherwise>
                                          <div class="media mt-4"  style="margin-left: 35px;">
                                             <i class="fas fa-reply fa-rotate-180" style="color:gray;margin-top: 18px; margin-right: 7px;"></i>
                                             <img class="d-flex mr-3 rounded-circle" src="${profileImg[status.index]}" alt="" width = "50px" height = "50px">
                                             <div class="media-body">
                                                <div class="r_writer">${r.userName}님</div>
                                                <p class="r_content">${r.replyContent}</p>
                                                   <div style="text-align:right; margin-bottom:0px;">
                                                         <small> <fmt:formatDate value="${r.replyCreatedAt}" pattern="yyyy.MM.dd  kk:mm" /></small>
                                                      </div>
                                             </div>
                                          </div>
                                       </c:otherwise>
                                       
                                    </c:choose>
                                    </c:forEach>
                              
                           <!-- Comments Form -->
                           <div class="card my-4">
                              <h5 class="card-header">댓글을 남겨봐요 <i class="far fa-comment-dots"></i></h5>
                              <div class="card-body" style="padding-bottom:7px;">
                                 <textarea class="form-control" rows="2" id="reply-content"></textarea>
                                       <input type="hidden" id="reply-writer" name="replyWriter"value="${login.userNo}" /> 
                                       <input type="hidden" id="reply-article" name="replyArticleNo" value="${article.articleNo}" /> 
                                       <button type="button" id="post-reply" class="btn-sm btn-outline-default"
                                        style="float: right; margin-top:3px !important; background:white; color:gray;border:0.7px solid gray; ">
                                        등록<i class="far fa-check-circle"></i></button>
                              </div>

                           </div>      
                              

                        </div>
                     
                        <!-- Sidebar Widgets Column -->
                        <div class="col-md-4">

                           <!-- Search Widget -->
                           <div class="card my-4">
                              <h5 class="card-header">Search</h5>
                              <div class="card-body">
                                 <div class="input-group">
                                    <input  id="search-input-article" type="text" class="form-control" placeholder="Search for..."/>
                                       <button id="search-btn-article" class="btn btn-secondary" type="button">검색</button>
                     
                                 </div>
                                 
                              </div>
                           </div>

                           <!-- Categories Widget -->
                           <div class="card my-4">
                              <h5 class="card-header">해시태그</h5>
                              <div class="card-body">
                                 <div class="row">
                                    <div style="margin-left:24px;">
                                          <c:forEach var="t" items="${tag}">
                                             <button type="button" id="${t.tagNo}" class="hash_tag">${t.tagName}</button>
                                          </c:forEach>
                                          
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>

                     </div>
                     <!-- /.row -->
                  </div>
               </div>
            </div>
         </div>
      </div>
   </main>



   <!-- 필요할지도 모르는 스크립트 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script type="text/javascript" src="./jquery/jquery.js"></script>

   <script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
   <script src="<c:url value = "/js/main.js"/>"></script>
   
   <script src="<c:url value = "/vendor/jquery/jquery.min.js"/>"></script>
   <script src="<c:url value = "/vendor/jquery/bootstrap.bundle.min.js"/>"></script>
   
   <script src="<c:url value='/js/tag.js'/>"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>
   
   
   <script type="text/javascript">
$(function(){
   
   //엔터키 입력 이벤트
   $("#reply-content").keydown(function(key) {

      if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
         $("#post-reply").click();
      }
      
   });
   
   $("#post-reply").click(function(){
      
      if(${login == null}){
         Swal.fire('로그인이 필요한 서비스입니다.');
            return;
      }
      
      const writer = $("#reply-writer").val();
      console.log(writer);
      if(writer === "") {
         Swal.fire('로그인이 필요한 서비스입니다.');
         return;
      }
      
      const content = $("#reply-content").val();
      console.log("content " + content);
      if(content === "" || content.startsWith( '/ /gi' )){
           Swal.fire('내용을 입력해주세요!');
         return;
      }

      const article = $("#reply-article").val();
      console.log(article);
      
      const url = "/board/" + ${board.boardNo} + "/post-comment"
      var data = {
            replyContent : content,
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
                    Swal.fire('댓글이 추가되었습니다.');

                     window.location.reload();
                  }else{
                    Swal.fire('웹사이트 오류입니다.');
                  }
               
            },
            error: function(request, status, error){
               console.log("POST : /board/${boardNo}/register 요청에 실패했습니다.")
                Swal.fire('댓글 등록에 실패하였습니다.');

            }
         }); /* end ajax */
   });
});
function showReplyForm(selector){
   $(selector).toggleClass("hidden");
}
</script> 

<script>
//tag btn 클릭 시 검색
$('.hash_tag').click(function() {
   var id_check = $(this).attr("id");
   //alert("clicked: " + id_check);
   location.href = '/tag/searchProductByTag/'+ id_check;
});

</script>

<script>
//start jQuery
$(function() {

   //검색 버튼 이벤트 처리
   $("#search-btn-article").click(
         function() {
            console.log("검색 버튼이 클릭됨!");
            const keyword = $("#search-input-article").val();
            
            console.log("검색어: " + keyword);

            const condition = "titleContent";
            var url = "/search?q=" + keyword;
            location.href = "/search?q=" + keyword + "&condition=" + condition;

         });

   });
});//end jQuery

</script>

</body>

<jsp:include page="../include/footer.jsp" />

</html>