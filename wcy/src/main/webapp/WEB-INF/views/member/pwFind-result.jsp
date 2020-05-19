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
	                <li><a>01 본인확인 정보입력</a></li>
	                <li><a class="active">02 임시 비밀번호 발급</a></li>
	            </ul> 
	        </div>
	        <div class="right-contents">
	        	<h4 class="contents-title">임시 비밀번호 발급 완료</h4>
				<p class="mb10" style="font-size: 17px;">입력하신 이메일 <span style="color:#ff9800; font-weight:600;">${pwFindemail}</span> 로 임시비밀번호가 발급되었습니다.</p>
				<p class="mb10" style="font-size: 17px;">임시비밀번호로 로그인 하시어 꼭 비밀번호를 변경해주세요!</p>
			</div>
		</div>
	</main>



</body>
	 <jsp:include page="../include/footer.jsp" /> 
</html>












