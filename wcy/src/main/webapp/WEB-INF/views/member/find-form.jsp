<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">


<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">


<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

<style>

    .w200{width:200px !important;}
    .left-section{float: left; width:210px;}
    .left-section > h2{width: 210px; height: 112px; background: #25283D; color: #fff; text-align: center; display: table-cell; vertical-align: middle;}
    .left-section .left-sub-nav{width:210px; border: solid #dbdbdb; border-width: 0 1px; box-sizing: border-box;}
    .left-section .left-sub-nav>li>a{padding: 10px 20px; font-size: 14px; display: block; position: relative; border-bottom: 1px solid #dbdbdb; font-weight: bold; color: #333;}
    
    
    .right-section{width:840px; float: right; position: relative;}
    
    .right-header .right-sub-nav{width: 100%; background: #f4f4f4; border-radius: 5px; display: table; table-layout: fixed; margin-bottom: 50px; overflow: hidden;}
    .right-header .right-sub-nav li{display: table-cell;}
    .right-header .right-sub-nav li a{display: block; height: 60px; box-sizing: border-box; font-size: 18px; color: #888; padding: 0 0 0 20px; line-height: 60px; border-bottom: 4px solid #ddd;}
    .right-sub-nav li a.active{color: #25283D; border-color: #25283D;}
    
    
    .contents-title:before{display: block; content: ''; width: 50px; height: 3px; background:#25283D; position: absolute; left: 0; top: 0;}
    .contents-title{font-size: 22px; margin-bottom: 20px; color: #000; position: relative; padding-top: 5px; height: 40px; line-height: 40px;}
    
    .inputSection{
    	position: relative;
  		padding-right: 15px;
  	 	padding-left: 15px;
  	  	display: inline-block;
    }   
    .nameSection{
        position: relative;
  		padding-right: 15px;
  	 	padding-left: 45px;
  	  	display: inline-block;
    }
    .control-label{
    	font-size:15px;
    	font-weight:600;
    } 
    
    p{line-height: 150% !important;}

</style>

</head>
<body>

<jsp:include page="../include/header-sub.jsp" />


<!-- 기본적으로 아이디 찾기 창 -->
<c:if test="${target eq 'email'}">
	<main class="wcy-main-content mb220">
		<div class="left-section">
	        <h2>회원가입</h2>
	        <ul class="left-sub-nav">
	            <li><a href="<c:url value='/member/email-form' />">회원가입</a></li>
	            <li><a href="<c:url value='/member/find-form?target=email' />">아이디(이메일)찾기</a></li>
	            <li><a href="<c:url value='/member/find-form?target=pw' />">비밀번호 찾기</a></li>
	        </ul>
	    </div>
	
		<div class="right-section">
			<div class="right-header">
	            <ul class="right-sub-nav">
	                <li><a class="active">01 본인확인 정보입력</a></li>
	                <li><a>02 이메일 확인</a></li>
	            </ul> 
	        </div>
	        <div class="right-contents">
	        	<h4 class="contents-title">이메일 찾기</h4>
				<p class="mb10">회원정보에 등록한 이름과 전화번호와 입력한 정보가 같아야 이메일을 찾을 수 있습니다.</p>
				<form action="<c:url value='/member/findEmail' />" method="post" class="form-group">
					<label for="userName" class="control-label mt30">이름</label>
					<div class="nameSection">
						<input type="text" name="userName" id="userName" class="form-control mt10 w200"/>
					</div>
					<br>
					<label for="userTel" class="control-label mt30">전화번호</label>
					<div class="inputSection mb30">
						<input type="text" name="userTel" id="userTel" class="form-control mt10 w200"/>
						<!-- 이메일 찾기 결과: 입력한 정보가 존재하지 않을때 -->
						<c:if test="${msg != null }">
								${msg}
						</c:if>
					</div>
					<br>
					<button class="btn btn-outline-dark ml145">다음</button>
				</form>
			</div>
		</div>
	</main>
</c:if>


<!-- 클릭하면 비밀번호 찾기 창-->
<c:if test="${target eq 'pw' }">
	<main class="wcy-main-content mb260">
		<div class="left-section">
	        <h2>회원가입</h2>
	        <ul class="left-sub-nav">
				<li><a href="<c:url value='/member/email-form' />">회원가입</a></li>
				<li><a href="<c:url value='/member/find-form?target=email' />">아이디(이메일)찾기</a></li>
				<li><a href="<c:url value='/member/find-form?target=pw' />">비밀번호 찾기</a></li>
	        </ul>
	    </div>
	
		<div class="right-section">
			<div class="right-header">
	            <ul class="right-sub-nav">
	                <li><a class="active">01 본인확인 정보입력</a></li>
	                <li><a>02 임시 비밀번호 발급</a></li>
	            </ul> 
	        </div>
	        <div class="right-contents">
	        	<h4 class="contents-title">비밀번호 찾기</h4>
	        		<p class="mb10">회원정보에 등록한 이메일과 입력한 이메일이  같아야 임시 비밀번호가 발송됩니다.</p>
					<form action="<c:url value='/member/findPw' />" method="post" class="form-group">
						<label for="userEmail" class="control-label mt30">이메일</label>
						<div class="inputSection mb30">
							<input type="text" name="userEmail" id="userEmail" class="form-control mt10 w200"/>
						</div>
						<br>
						<button class="btn btn-outline-dark ml77">임시 비밀번호 발송</button>
					</form>
			</div>
		</div>
	</main>
</c:if>



<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
<script src="<c:url value = "/js/main.js"/>"></script>   

</body>
	<jsp:include page="../include/footer.jsp" />
</html>