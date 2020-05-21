<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.css" />
<link rel="stylesheet" href="<c:url value='/css/search.css'/>">

<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">


<style>
body{font-family:'Nanum Gothic Coding', monospace;}
/* 이미지 슬라이더 스타일 변경 오버라이드 */
.bx-wrapper{
	border:0 !important; 
	background:#fff; 
	position:relative; 
	margin: 90px auto 0px;
	-webkit-box-shadow: 0 0 0px !important;
	box-shoadow:0 0 0px !important;
	}
.wcy-ProgramLayout2 > .bx-wrapper{margin: 45px 0 0 0;}


@media only screen and (max-width: 1023px) {
   .bx-wrapper{
      margin-top:0px !important;
   }
}

.bx-wrapper .bx-pager, .bx-wrapper .bx-controls-auto{
   bottom: 10px !important;
}

@media only screen and (max-width: 600px) {
   .bx-wrapper .bx-pager, .bx-wrapper .bx-controls-auto{
      display:none;
   }
}

.bx-wrapper .bx-pager{
   padding-top:0;
}

.bx-wrapper .bx-pager.bx-default-pager a{
   background:#fff;
}

.bx-wrapper .bx-pager.bx-default-pager a:hover, 
.bx-wrapper .bx-pager.bx-default-pager a.active, 
.bx-wrapper .bx-pager.bx-default-pager a:focus{
   background:#c7c7c7;
}

.bx-wrapper .bx-controls-direction a{z-index:0 !important;}


.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-controls-direction > a{
	margin-top: 15px;
	top:100%;
} 

.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-prev{
	left: 94%;
}
.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-next{
	right: 0%;
}
 

@media only screen and (max-width: 1225px) {
	.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-prev{
		left: 93%;
	}
}
@media only screen and (max-width: 1060px) {
	.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-prev{
		left: 92%;
	}
}
@media only screen and (max-width: 945px) {
	.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-prev{
		left: 91%;
	}
}
@media only screen and (max-width: 815px) {
	.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-prev{
		left: 90%;
	}
}
@media only screen and (max-width: 760px) {
	.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-controls-direction > a{
		display:none;
	} 
}


.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-pager{
	bottom: -40px !important;
}
.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-pager > .bx-pager-item > a:hover,
.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-pager > .bx-pager-item > a.active,
.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-pager > .bx-pager-item > a:focus{
	background: #807e7e;
}
.wcy-ProgramLayout2 > .bx-wrapper > .bx-controls > .bx-pager > .bx-pager-item > a{
	background: #c9c9c9;
}

.main-reviewLayout > .reviewLayoutIn > .reviewTextBox > .reviewConBox > .bx-wrapper{
	background: transparent !important;
	margin: 0px !important;
	border:0px;
	-webkit-box-shadow: 0 0 0px;
	box-shoadow:0 0 0px;
}
.main-reviewLayout > .reviewLayoutIn > .reviewTextBox > .reviewConBox > .bx-wrapper > .bx-viewport{
	height:380px !important;
	overflow:visible;
}

</style>


<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
</head>
<body>

   <header class="wcy-auto-hide-header">
      <div class="logo"><a href="<c:url value='/' />"><img src="<c:url value='/img/commons/wcy_logo_sample_black.png'/>" alt="Logo" /></a></div>
      
      <nav class="wcy-primary-nav">
         <a href="#" class="nav-trigger">
            <span>
               <em aria-hidden="true"></em>
               Menu
            </span>
         </a> <!-- .nav-trigger -->
         
         <ul id="wcy-navigation">
            <c:if test="${login == null}">
               <li><a class="modal_open_btn" data-toggle="modal" data-target="#wcy-login-modal">로그인</a></li>
               <li><a href="<c:url value='/member/email-form' />">회원가입</a></li>
               <li><a href="<c:url value='/member/find-form?target=email' />">아이디(이메일)찾기&nbsp;</a></li>
               <li><a href="<c:url value='/member/find-form?target=pw' />">&nbsp;비밀번호 찾기</a></li>
            </c:if>
            
            <c:if test="${login != null}">
               <li>${login.userName}님 반갑습니다.</li>
               <!--   <li><a href="<c:url value='/member/logout' />" onclick="logoutConfirm()">로그아웃</a></li>-->
                <li><a onclick="logoutConfirm()">로그아웃</a></li>
            </c:if>
            
         </ul>
      </nav> <!-- .wcy-primary-nav -->


		<nav class="wcy-search-menu">
			<div class="search-form">
				<ul id="wcy-search">
					<li>
						<fieldset id="search-fieldset">
							<input type="search" id="search-input"
								placeholder="파이썬(Python)기초 프로젝트" />
							<button type="submit" id="search-btn">
								<i class="fa fa-search"></i>
							</button>
						</fieldset>
					</li>
				</ul>
			</div>
			<ul id="wcy-menu">
				<li><a class="modal_open_btn" data-toggle="modal" data-target="#wcy-event-modal"><i class="fa fa-gift"><p class="gift-p" style="font-size:11px; padding-top:5px;">이벤트</p></i></a></li>
				<li><a onclick="logincheck()"><i class="fa fa-shopping-cart"><p class="cart-p" style="font-size:11px; padding-top:5px;">장바구니</p></i></a></li>
				<c:if test="${login == null || login.userType == 0 || login.userType == 1}">
					<li><a onclick="logincheck()"><i class="fa fa-user"><p class="user-p" style="font-size:11px; padding-top:5px;">마이페이지</p></i></a></li>
				</c:if>
				<c:if test="${login.userType == 2}">
					<li><a href="<c:url value='/admin' />"><i class="fa fa-user"><p class="user-p" style="font-size:11px; padding-top:5px;">관리자페이지</p></i></a></li>
				</c:if>
				<li><a href="<c:url value='board/2'/>"><i class="fa fa-headset"><p class="headset-p" style="font-size:11px; padding-top:5px;">고객센터</p></i></a></li>
			</ul>
		</nav>
		
	</header> <!-- .wcy-auto-hide-header -->

   <nav class="wcy-secondary-nav">
      <ul>
     	 <li><a href="<c:url value='/greeting' />">WeCodeYou<span>&#x25BE;</span></a>
            <div class="sub-menu-1">
                <ul>
                  <li class="hover-me"><a href="<c:url value='/greeting' />">인삿말/소개</a></li>
                  <li class="hover-me"><a href="<c:url value='/location' />">오시는 길</a></li>  
               </ul>
            </div>
         </li>
			<!-- 오프라인 강의 -->
         <li> 
         	<a href="#">현장 강의<span>&#x25BE;</span></a>
            <div class="sub-menu-1">	
               <ul>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=102' />">Programming</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=C Programming' />">C Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Python Basic' />">Python Basic</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=JAVA Programming' />">JAVA Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=JSP Programming' />">JSP Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Spring Framework Project' />">Spring Framework Project</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Android/iOS App Programming' />">Android/iOS App Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=C++' />">C++</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=103' />">Cloud</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=AWS Technical Essentials' />">AWS Technical Essentials</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Architecting on AWS' />">Architecting on AWS</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Windows Server New Features' />">Windows Server New Features</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Windows Server Azure' />">Windows Server Azure</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=104' />">Network</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=CCNA-Basic' />">CCNA-Basic</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=CCNP-Switch' />">CCNP-Switch</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=CCNP-Route' />">CCNP-Route</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=105' />">System/Server</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=LinuxServer' />">LinuxServer</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=WindowsServer 2012' />">WindowsServer 2012</a></li>
                        </ul>                     
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=106' />">Hacking</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Hacking Trace' />">Hacking Trace</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Web Hacking' />">Web Hacking</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=reverse Engineering' />">reverse Engineering</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=System Hacking' />">System Hacking</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Network Hacking' />">Network Hacking</a></li>
                        </ul>                     
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=107' />">Database</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=R Programming' />">R Programing</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Hadoop Programming' />">Hadoop Programing</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Oracle(WDP)' />">Oracle(WDP)</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Oracle(OAEC)' />">Oracle(OAEC)</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=108' />">License</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=정보처리기능사-필기' />">정보처리기능사-필기</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=정보처리기능사-실기' />">정보처리기능사-실기</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=정보처리기사-필기' />">정보처리기사-필기</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=정보처리기사-실기' />">정보처리기사-실기</a></li>
                        </ul>                  
                     </div>
                  </li>
               </ul>
            </div>
         </li>
         	<!-- 온라인 강의 -->         
         <li> 
         	<a href="#">온라인 강의<span>&#x25BE;</span></a>
            <div class="sub-menu-1">	
               <ul>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=109' />">Programming</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=파이썬 기초정복 30강!' />">파이썬 기초정복 30강!</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=자바 java wcy 강의' />">자바 java wcy 강의</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=SpringFramework 프로젝트 짜보기 20강 완성' />">SpringFramework 프로젝트 짜보기 20강 완성</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=IT 통합 기초' />">IT 통합 기초</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=자바스크립트와 제이쿼리' />">자바스크립트와 제이쿼리</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=Visual Basic 2017 제대로 사용하기' />">Visual Basic 2017 제대로 사용하기</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=110' />">Design</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=HTML,CSS 기초와 웹구현하기' />">HTML,CSS 기초와 웹구현하기</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=CSS 고급 레이아웃' />">CSS 고급 레이아웃</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=프론트엔드 개발환경의 이해와 실습' />">프론트엔드 개발환경의 이해와 실습</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=111' />">Business</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=파이어베이스로 웹앱 구성' />">파이어베이스로 웹앱 구성</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=반응형 웹제작 제대로 하기' />">반응형 웹제작 제대로 하기</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=하이브리드 웹/앱 배우기 기초' />">하이브리드 웹/앱 배우기 기초</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=직접 구현하며 익히는 자료구조' />">직접 구현하며 익히는 자료구조</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=JSP 기초부터 실무까지' />">JSP 기초부터 실무까지</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=나홀로 제작 쇼핑몰' />">나홀로 제작 쇼핑몰</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=112' />">Big Data/Security</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=빅데이터 분석 R 프로그래밍' />">빅데이터 분석 R 프로그래밍</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=초보자를 위한 정보 보안및 해킹 방어 개론' />">초보자를 위한 정보 보안및 해킹 방어 개론</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=파일 다운로드 취약점, 공격 기법과 실무사례' />">파일 다운로드 취약점, 공격 기법과 실무사례</a></li>
                        </ul>                     
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=113' />">Server/License</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=LINUX 기초 익히기' />">LINUX 기초 익히기</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=정보처리 기능사 (교안+이론+문제)' />">정보처리 기능사 (교안+이론+문제)</a></li>
                           <li style="width:350px;"><a href="<c:url value='/curriculum/sub?s=정보처리기사 (신유형 분석)' />">정보처리기사 (신유형 분석)</a></li>
                        </ul>                     
                     </div>
                  </li>  
               </ul>
            </div>
         </li>

         <li>
         	<c:if test="${login.userType == 2}">
         		<a href="<c:url value='/board/list'/>">커뮤니티<span>&#x25BE;</span></a>
         	</c:if>
         	<c:if test="${login == null || login.userType == 0 || login.userType == 1}">
         		<a href="<c:url value='#'/>">커뮤니티<span>&#x25BE;</span></a>
         	</c:if>
            <div class="sub-menu-1">
                <ul>
                  
                  <li class="hover-me"><a href="<c:url value='board/1'/>">자유게시판</a></li>
                  <li class="hover-me"><a href="<c:url value='board/4'/>">질문게시판</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="#">Code</a></li>
                           <li style="width:300px;"><a href="#">etc</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='board/7'/>">공유게시판</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="#">Teach</a></li>
                           <li style="width:300px;"><a href="#">Tip</a></li>
                        </ul>                     
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='board/5'/>">정기모임/스터디</a></li>
                  <li class="hover-me"><a href="<c:url value='board/6'/>">IT행사</a></li>
               </ul>
            </div>
         </li>
         
         <li><a href="<c:url value='/helpsite' />">도움이 되는 사이트</a></li>
         <li><a href="<c:url value='/board/8'/>">공지사항</a></li>
         
      </ul>
   </nav> <!-- .wcy-secondary-nav -->
   
   <section class="wcy-main-img">
      <div class="wcy-img-content">
         <a href="#"><img src="<c:url value='/img/main/mainrollingimg1.png'/>" alt="" title="이미지1" /></a>
         <a href="#"><img src="<c:url value='/img/main/mainrollingimg2.png'/>" alt="" title="이미지2" /></a>
         <a href="#"><img src="<c:url value='/img/main/mainrollingimg3.png'/>" alt="" title="이미지3" /></a>
         <a href="#"><img src="<c:url value='/img/main/mainrollingimg4.png'/>" alt="" title="이미지4" /></a>
      </div>
   </section>

<%@ include file="../member/login_modal.jsp" %>  
<%@ include file="../member/event_modal.jsp" %>  


<main class="wcy-main-content sub-nav-hero">
	<div class="wcy-ProgramLayout">
		<div class="wcy-ProgramBox">
			<div class="class-title">
				WECODEYOU 추천 강의
			</div>
			<div class="mainProgramTabLsit">
				<ul class="maingProgramTabList-ul">
					<li class="on" style="width:27.875px; margin-bottom: 15px;">
						<a href="javascript:basic();" title="기초완성반">
							기초완성반
						</a>
					</li>
					<li style="width:27.875px; margin-bottom: 15px;">
						<a href="javascript:network();" title="네트워크">
							네트워크
						</a>
					</li>
					<li style="width:27.875px; margin-bottom: 15px;">
						<a href="javascript:programming();" title="프로그래밍">
							프로그래밍
						</a>
					</li>
					<li style="width:27.875px;">
						<a href="javascript:bigdata();" title="빅데이터">
							빅데이터
						</a>
					</li>
				</ul>
			</div>
			<div class="mainProgramTabCon">
				<ul class="mainProgramTabCon-ul">
					<li class="basicCon" style="display:list-item;">
						<div class="mainProgramTabTitle">
							<strong>[오프라인]</strong> IT 통합 기초
						</div>
						<div class="mainProgramTabContent01">
							<img src="<c:url value='/img/main/main-recommend-b.png'/>" alt="IT통합 기초반" class="leftImage" />
							<table class="pProgram01">
								<tbody>
									<tr>
										<td class="ppTitle">기초탄탄</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">용어정립</td>
										<td>IT관련 생소한 용어 확실히 정리</td>
									</tr>
									<tr>
										<td class="ppTitle">운영체제</td>
										<td>운영체제 활용을 통한 여러 기능 학습</td>
									</tr>
									<tr>
										<td class="ppTitle">상위과정</td>
										<td>상위과정을 위한 역량 갖추기</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					
					<li class="networkCon" style="display:none;">
						<div class="mainProgramTabTitle">
							<strong>[오프라인]</strong> CCNA Basic
						</div>
						<div class="mainProgramTabContent01">
							<img src="<c:url value='/img/main/main-recommend-n.png'/>" alt="네트워크" class="leftImage" />
							<table class="pProgram01">
								<tbody>
									<tr>
										<td class="ppTitle">CCNA 란?</td>
										<td>Cisco Certified Network Associate</td>
									</tr>
									<tr>
										<td class="ppTitle">초급 네트워킹</td>
										<td>네트워크 설치 및 운영능력 향상</td>
									</tr>
									<tr>
										<td class="ppTitle">자격증 준비</td>
										<td>네트워크 운영상 여러 트러블 슈팅 능력</td>
									</tr>
									<tr>
										<td class="ppTitle">기초내용</td>
										<td>초적인 네트워킹 학습을 포함</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					
					<li class="programmingCon" style="display:none;">
						<div class="mainProgramTabTitle">
							<strong>[온라인]</strong> Visual Basic 2017 제대로 사용하기
						</div>
						<div class="mainProgramTabContent01">
							<img src="<c:url value='/img/main/main-recommend-p.png'/>" alt="프로그래밍" class="leftImage" />
							<table class="pProgram01">
								<tbody>
									<tr>
										<td class="ppTitle">설치부터</td>
										<td>Visual Studio 플랫폼 설치</td>
									</tr>
									<tr>
										<td class="ppTitle">맞춤패키지</td>
										<td>필요 목표에 따른 패키지 구성 가능</td>
									</tr>
									<tr>
										<td class="ppTitle">초급강좌</td>
										<td>개발 플랫폼 설치 및 환경 구성</td>
									</tr>
									<tr>
										<td class="ppTitle">Tool 활용</td>
										<td>샘플강의를 통해 무료강좌 수강 가능</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					
					<li class="databaseCon" style="display:none;">
						<div class="mainProgramTabTitle">
							<strong>[온라인]</strong> 빅데이터 분석 R 프로그래밍
						</div>
						<div class="mainProgramTabContent01">
							<img src="<c:url value='/img/main/main-recommend-big.png'/>" alt="빅데이터" class="leftImage" />
							<table class="pProgram01">
								<tbody>
									<tr>
										<td class="ppTitle">내장 함수</td>
										<td>R의 내장 통계 함수 활용 데이터 분석</td>
									</tr>
									<tr>
										<td class="ppTitle">통계학</td>
										<td>통계학 분야 활용법 학습</td>
									</tr>
									<tr>
										<td class="ppTitle">검증·분석</td>
										<td>R검증 및 분석을 통한 데이터 시각화</td>
									</tr>
									<tr>
										<td class="ppTitle">데이터 분석</td>
										<td>데이터 시각화를 이용한 실전 분석</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	
	<div class="main-reviewLayout">
		<div class="reviewLayoutIn">
			<ul class="reviewTitleTab" id="reviewTitleTab">
				<li id="review01" class="on">
					<a href="javasctipt:;">자바</a>
				</li>
				<li id="review01" class="">
					<a href="javasctipt:;">C언어</a>
				</li>
				<li id="review01" class="">
					<a href="javasctipt:;">파이썬</a>
				</li>
				<li id="review01" class="">
					<a href="javasctipt:;">네트워크</a>
				</li>
				<li id="review01" class="">
					<a href="javasctipt:;">데이터베이스</a>
				</li>
			</ul>
			<div class="reviewTextBox">
				<div class="reviewConBox">
					<div class="prevNextBox">
						<a href="javascript:void(0);" class="prevBu"><i class="fas fa-arrow-left"></i></a>
						<a href="javascript:void(0);" class="nextBu"><i class="fas fa-arrow-right"></i></a>
					</div>
					<div class="reviewConBoxTitle">
						<p>위코드유 실제 수강생들의 생생한 리뷰</p>
					</div>
					<ul class="reviewChangeBox">
						<li class="real">
							<a href="javascript:;">
								<div class="textBox">
									<p class="textBox-title">이 수업 진짜 최고!</p>
									<p class="textBox-star">★ ★ ★ ★ ★ 수강생 평점 5</p>
									<p class="textBox-text">
										홍강사님은 정말 최고의 강사님이에요. 이 분꺼 온라인도 듣고 오프라인도 들어봤는데 진짜 최고에요~<br>
										웹페이지 하나 만드는 수업 한번 들어보세요 여러분 ~~ 회원가입이랑 로그인 구현하는건 일도 아니네요 <br>
										이거 두개 구현하면 뭐 다한거지 뭐 안그래요?하하핳ㅎㅎㅎㅎ
										<p class="textBox-writer">김*수 수강생</p>
									</p>
								</div>
								<div class="imgBox">
									<div class="imgBox-title">[온라인] 자바 java wcy 강의</div>
									<img src="<c:url value='/img/main/main-review-java.png'/>" alt="java" />
								</div>
							</a>
						</li>
						<li class="real">
							<a href="javascript:;">
								<div class="textBox">
									<p class="textBox-title">강사님이 잘가르쳐요.</p>
									<p class="textBox-star">★ ★ ★ ★ ★ 수강생 평점 5</p>
									<p class="textBox-text">
										강사님이 노련하신 분이라서 수업 진행이 정말 매끄럽습니다.<br>
										열심히 듣고 예습, 복습 잘 하면 수업내용 따라가기 더 수월하네요. 강사님께 감사인사드립니다.ㅎㅎ<br>
										다른 과목도 이 강사님 수업으로 듣고 싶어요~~
										<p class="textBox-writer">박*민 수강생</p>
									</p>
								</div>
								<div class="imgBox">
									<div class="imgBox-title">[오프라인] C Programming </div>
									<img src="<c:url value='/img/main/main-review-c.png'/>" alt="java" />
								</div>
							</a>
						</li>
						<li class="real">
							<a href="javascript:;">
								<div class="textBox">
									<p class="textBox-title">기초부터 알려줍니다!</p>
									<p class="textBox-star">★ ★ ★ ★ ★ 수강생 평점 5</p>
									<p class="textBox-text">
										이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.
										이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.
										이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.
										<p class="textBox-writer">김*수 수강생</p>
									</p>
								</div>
								<div class="imgBox">
									<div class="imgBox-title">[온라인] 파이썬 기초정복 30강!</div>
									<img src="<c:url value='/img/main/main-review-python.png'/>" alt="java" />
								</div>
							</a>
						</li>
						<li class="real">
							<a href="javascript:;">
								<div class="textBox">
									<p class="textBox-title">네트워크 전문가 될듯 ㅎㅎ</p>
									<p class="textBox-star">★ ★ ★ ★ ★ 수강생 평점 5</p>
									<p class="textBox-text">
										네트워크 전문가 되기 어렵지 않아용 <br>
										중간중간 딴소리를 하시는게 좀 있지만 그래도 잘 가르쳐 주십니다요. <br>
										한달 빡시게 했더니 네트워크 기초는 잘 잡힌듯 합니다. 감사감사
										<p class="textBox-writer">류*성 수강생</p>
									</p>
								</div>
								<div class="imgBox">
									<div class="imgBox-title">[오프라인] CCNP-Route</div>
									<img src="<c:url value='/img/main/main-review-net.png'/>" alt="java" />
								</div>
							</a>
						</li>
						<li class="real">
							<a href="javascript:;">
								<div class="textBox">
									<p class="textBox-title">이 수업 왜 안들으세요?</p>
									<p class="textBox-star">★ ★ ★ ★ ★ 수강생 평점 5</p>
									<p class="textBox-text">
										강사님이 노련하신 분이라서 수업 진행이 정말 매끄럽습니다.<br>
										열심히 듣고 예습, 복습 잘 하면 수업내용 따라가기 더 수월하네요. 강사님께 감사인사드립니다.ㅎㅎ<br>
										다른 과목도 이 강사님 수업으로 듣고 싶어요~~
										<p class="textBox-writer">박*민 수강생</p>
									</p>
								</div>
								<div class="imgBox">
									<div class="imgBox-title">[오프라인] Oracle WDP</div>
									<img src="<c:url value='/img/main/main-review-data.png'/>" alt="java" />
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="wcy-ProgramLayout2">
		<div class="class-title2">
			과목별 인기강의 
			<span  style="font-size:17px; font-weight:400;">&nbsp;&nbsp;&nbsp;수강생들이 사랑한 강의</span>
		</div>
		<ul class="wcy-best-class">
			<c:forEach var="sp" items="${sp_data}">
				<li class="hover-layout">
					<div class="overrap-bottom">
			            <p>${sp.spBook}</p>
			            <p>${sp.spLecName}</p>
	        		</div>
					<div class="hover-wrap">
						<a href="#"><img src="${sp.spThum}" style="width:300px; height:300px;"/></a>
						<h3>${sp.spScope}</h3>
						<div class="hover-bottom">
							<a href="#" title="장바구니"><i class="fas fa-cart-plus"></i></a>
							<a href="<c:url value='/curriculum/sub?s=${sp.spBook}' />" title="상세보기"><i class="fas fa-search-plus" style="left:77px;"></i></a>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>

	<div class="wcy-boardLayout">
		<div class="boardWrap">
			<div class="boardNotice">
				<h1>공지사항<a href="<c:url value='/board/8'/>" class="more">더보기 ></a></h1>
				<ul>
					<c:forEach var="n" items="${noti_list}">
					<li>
						<a href="<c:url value='/board/article/${n.articleNo}'/>">${n.articleTitle}
						<%-- <img src="<c:url value='/img/commons/new.png'/>" alt="new" /> --%>
						</a>
						<span>${n.articleCreatedAt}</span>
					</li>
					</c:forEach>
					
				</ul>
			</div>
			<div class="boardFAQ">
				<h1>FAQ<a href="#" class="more2">더보기 ></a></h1>
				<ul>
					<li>
						<a href="#">강의는 어떻게 구매하나요?</a>
						<span>2017-05-01</span>
					</li>
					<li>
						<a href="#">포인트로는 무엇을 살 수 있나요?</a>
						<span>2017-05-01</span>
					</li>
					<li>
						<a href="#">동영상이 끊길 때 어떻게 해야 되나요?</a>
						<span>2016-07-13</span>
					</li>
					<li>
						<a href="#">취소나 환불을 하고 싶어요.</a>
						<span>2016-04-03</span>
					</li>
				</ul>
			</div>
		</div>
	</div>

</main> <!-- .cd-main-content -->


<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
<script src="<c:url value = "/js/main.js"/>"></script>
<!-- jquery 이미지 슬라이더 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<!-- 검색 기능 -->
<script src="<c:url value='/js/search-main.js'/>"></script>

<!-- 로그아웃 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>
<script>
function logoutConfirm(){
	Swal.fire({
	  title: 'Are you sure?',
	  text: "정말로 로그아웃 하시겠습니까?",
	  type: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'YES',
	}).then((result) => {
		 if (result.value) {
			Swal.fire(
		      '로그아웃!',
		      '로그아웃되었습니다.',
		      'success',
		    )
		 window.setTimeout(function(){
			 window.location.href="/member/logout";
		 },1000);
		 //location.href="/member/logout"
	    }
	})
};
</script>

<!-- 추천강의 변환 -->
<script>
	var s1=$('.maingProgramTabList-ul > li');	//ul > li 를 s1 으로 정함
	$(function(){
		s1.find("a").click(function(){			//s1의 아래에 속해 있는 a태그를 찾아서 클릭할 경우
			s1.removeClass("on");				//s1(li)의 클래스 on을 삭제
			$(this).parent().addClass("on");	//현재 클릭한 a의 부모인 li에 on클래스를 삽입
		});
	});
	
	var s2=$('.mainProgramTabCon-ul > li');
	function basic(){
		$('.basicCon').show();
		s2.not('.basicCon').hide();

		
	}
	
	function network(){
		$('.networkCon').show();
		s2.not('.networkCon').hide();
		
	}
	
	function programming(){
		$('.programmingCon').show();
		s2.not('.programmingCon').hide();
		
	}
	function bigdata(){
		$('.databaseCon').show();
		s2.not('.databaseCon').hide();
		
	}
</script>


<!-- 설문조사 pop up modal -->
<script>
	window.onload = function(){
		showInterestModal();
	};
	
	function showInterestModal(){
		
		 $.ajax({
	            type: "POST",
	            url: "/member/checkUserInterest",
	            headers: {
	                   "Content-Type": "application/json"
	               },
	            dataType : "text",
	            success: function(data) {
	               console.log("통신성공 ! result: " + data);   
	               if(data === "pass") {
	            	   return;
	               }else if(data === "success"){
	            	   console.log("설문조사 모달을 엽니다.");
	            	   self.location="/interest_list/form";
	            	   $("#interest-modal").trigger("click");
	               }
	            },
	            error: function(){
	               console.log("통신실패!");
	            }
	         });
		
		
	} 

</script>

<script>

$(document).ready(function(){
    $('.wcy-img-content').bxSlider({
       
       auto:true,         //자동으로 애니메이션 시작
       speed:700,         //애니메이션 속도
       pause:4000,         //애니메이션 유지 시간 (4초)
       adaptiveHeight:true,//자동으로 이미지의 높이에 맞게 슬라이드의 높이값 조절함
       mode:'fade',      //슬라이드 모드('fade', 'horizontal', 'vertical'이 있음)
       autoControls:false,   //시작, 중지 버튼 숨기기
       autoHover:true,      //슬라이드에 마우스 오버시 애니메이션 정지하기
       pager:true         //페이지 표시 보이기
       //captions:true,      //이미지 위에 텍스트 보이기

    });
  });
$(document).ready(function(){
    $('.reviewChangeBox').bxSlider({
       
       auto:true,         //자동으로 애니메이션 시작
       speed:500,         //애니메이션 속도
       pause:2000,         //애니메이션 유지 시간 (4초)
       adaptiveHeight:true,//자동으로 이미지의 높이에 맞게 슬라이드의 높이값 조절함
       mode:'fade',      //슬라이드 모드('fade', 'horizontal', 'vertical'이 있음)
       autoControls:false,   //시작, 중지 버튼 숨기기
       autoHover:true,      //슬라이드에 마우스 오버시 애니메이션 정지하기
       pager:false,         //페이지 표시 보이기
	   controls:false,
    });
  });
  

$(document).ready(function(){
    $('.wcy-best-class').bxSlider({
       
       auto:true,         //자동으로 애니메이션 시작
       speed:700,         //애니메이션 속도
       pause:3000,         //애니메이션 유지 시간 (4초)
       adaptiveHeight:true,//자동으로 이미지의 높이에 맞게 슬라이드의 높이값 조절함
       mode:'horizontal',      //슬라이드 모드('fade', 'horizontal', 'vertical'이 있음)
       autoControls:false,   //시작, 중지 버튼 숨기기
       autoHover:true,      //슬라이드에 마우스 오버시 애니메이션 정지하기
       pager:true,         	//페이지 표시 보이기
       minSlides:1,
       maxSlides:5,
       shrinkItems:true,
       slideWidth:300,
       slideMargin:30
       //ticker:true,		//뉴스기사처럼 흘러가는것 
       //tickerHover:true	//마우스 호버시 정지
    });
  });
  
  
function logincheck(){
    if(${login == null}){
    	Swal.fire('로그인이 필요한 서비스입니다.');
       //alert("로그인이 필요한 서비스입니다.");
    }else{
    	location.href="<c:url value='/mypage/' />";
    }
       
 };

 
</script>



</body>
</html>