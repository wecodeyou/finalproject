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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<link rel="stylesheet" href="<c:url value='/css/search.css'/>">

<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">


<!-- 인기강의 슬라이더 -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>



<style>
/* 이미지 슬라이더 스타일 변경 오버라이드 */
.bx-wrapper{border:0; background:#fff; box-shadow:none; position:relative; margin: 90px auto 0px;}
.wcy-ProgramLayout > .bx-wrapper{margin: 45px auto 0px;}


@media only screen and (max-width: 1023px) {
   .bx-wrapper{
      margin-top:0px;
   }
}

.bx-wrapper .bx-pager, .bx-wrapper .bx-controls-auto{
   bottom: 10px;
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

.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-controls-direction > a{
	margin-top: 15px;
	top:100%;
} 

.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-prev{
	left: 94%;
}
.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-next{
	right: 0%;
}
 

@media only screen and (max-width: 1225px) {
	.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-prev{
		left: 93%;
	}
}
@media only screen and (max-width: 1060px) {
	.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-prev{
		left: 92%;
	}
}
@media only screen and (max-width: 945px) {
	.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-prev{
		left: 91%;
	}
}
@media only screen and (max-width: 815px) {
	.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-controls-direction > .bx-prev{
		left: 90%;
	}
}
@media only screen and (max-width: 760px) {
	.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-controls-direction > a{
		display:none;
	} 
}


.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-pager{
	bottom: -35px;
}
.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-pager > .bx-pager-item > a:hover,
.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-pager > .bx-pager-item > a.active,
.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-pager > .bx-pager-item > a:focus{
	background: #807e7e;
}
.wcy-ProgramLayout > .bx-wrapper > .bx-controls > .bx-pager > .bx-pager-item > a{
	background: #c9c9c9;
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
                <li><a href="<c:url value='/member/logout' />" onclick="return confirm('정말로 로그아웃 하시겠습니까?')">로그아웃</a></li>
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
				<li><a href="#"><i class="fa fa-shopping-cart"><p class="cart-p" style="font-size:11px; padding-top:5px;">장바구니</p></i></a></li>
				<c:if test="${login == null || login.userType == 0 || login.userType == 1}">
					<li><a onclick="logincheck()"><i class="fa fa-user"><p class="user-p" style="font-size:11px; padding-top:5px;">마이페이지</p></i></a></li>
				</c:if>
				<c:if test="${login.userType == 2}">
					<li><a href="<c:url value='/admin' />"><i class="fa fa-user"><p class="user-p" style="font-size:11px; padding-top:5px;">관리자페이지</p></i></a></li>
				</c:if>
				<li><a href="#"><i class="fa fa-headset"><p class="headset-p" style="font-size:11px; padding-top:5px;">고객센터</p></i></a></li>
			</ul>
		</nav>
		
	</header> <!-- .wcy-auto-hide-header -->

   <nav class="wcy-secondary-nav">
      <ul>
     	 <li><a href="<c:url value='/greeting' />">WeCodeYou<span>&#x25BE;</span></a>
            <div class="sub-menu-1">
                <ul>
                  <li class="hover-me"><a href="<c:url value='/greeting' />">인삿말</a></li>
                  <li class="hover-me"><a href="<c:url value='/intro' />">소개</a></li>
                  <li class="hover-me"><a href="<c:url value='/location' />">오시는 길</a></li>  
               </ul>
            </div>
         </li>
			<!-- 오프라인 강의 -->
         <li> 
         	<a href="#">현장 강의<span>&#x25BE;</span></a>
            <div class="sub-menu-1">	
               <ul>
                  <li class="hover-me"><a href="<c:url value='/curriculum/classroom' />">강의실 둘러보기</a>
                 	 <div class="sub-menu-2">
                 	  <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/classroom' />">종로점</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/classroom' />">강남점</a></li>
                      </ul>
                     </div>
                  </li>
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
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=R Programing' />">R Programing</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?s=Hadoop Programing' />">Hadoop Programing</a></li>
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

         <li><a href="<c:url value='/board/list'/>">커뮤니티<span>&#x25BE;</span></a>
            <div class="sub-menu-1">
                <ul>
                  
                  <li class="hover-me"><a href="#">자유게시판</a></li>
                  <li class="hover-me"><a href="#">질문게시판</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="#">Code</a></li>
                           <li style="width:300px;"><a href="#">etc</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="#">공유게시판</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="#">Teach</a></li>
                           <li style="width:300px;"><a href="#">Tip</a></li>
                        </ul>                     
                     </div>
                  </li>
                  <li class="hover-me"><a href="#">정기모임/스터디</a></li>
                  <li class="hover-me"><a href="#">IT행사</a></li>
               </ul>
            </div>
         </li>
         
         <li><a href="#">도움이 되는 사이트</a></li>
         <li><a href="#">공지사항</a></li>
         
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
				<ul>
					<li class="on" style="width:27.875px; margin-bottom: 15px;">
						<a href="javasctipt:void(0);" title="기초완성반"">
							기초완성반
						</a>
					</li>
					<li style="width:27.875px; margin-bottom: 15px;">
						<a href="javasctipt:void(0);" title="기초완성반">
							네트워크
						</a>
					</li>
					<li style="width:27.875px; margin-bottom: 15px;">
						<a href="javasctipt:void(0);" title="기초완성반">
							프로그래밍
						</a>
					</li>
					<li style="width:27.875px;">
						<a href="javasctipt:void(0);" title="기초완성반">
							데이터베이스
						</a>
					</li>
				</ul>
			</div>
			<div class="mainProgramTabCon">
				<ul>
					<li class="on" style="display:block;">
						<div class="mainProgramTabTitle">
							<strong>[오프라인]</strong> IT 통합 기초
						</div>
						<div class="mainProgramTabContent01">
							<img src="<c:url value='/img/curriculum/network02.jpg'/>" alt="IT통합 기초반" class="leftImage" />
							<table class="pProgram01">
								<tbody>
									<tr>
										<td class="ppTitle">기초탄탄</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">기초튼튼</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">탄탄기초</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">튼튼기초</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					
					<li style="display:none;">
						<div class="mainProgramTabTitle">
							<strong>[오프라인]</strong> IT 통합 기초
						</div>
						<div class="mainProgramTabContent01">
							<img src="<c:url value='/img/curriculum/network02.jpg'/>" alt="IT통합 기초반" class="leftImage" />
							<table class="pProgram01">
								<tbody>
									<tr>
										<td class="ppTitle">기초탄탄</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">기초튼튼</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">탄탄기초</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">튼튼기초</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					
					<li style="display:none;">
						<div class="mainProgramTabTitle">
							<strong>[오프라인]</strong> IT 통합 기초
						</div>
						<div class="mainProgramTabContent01">
							<img src="<c:url value='/img/curriculum/network02.jpg'/>" alt="IT통합 기초반" class="leftImage" />
							<table class="pProgram01">
								<tbody>
									<tr>
										<td class="ppTitle">기초탄탄</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">기초튼튼</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">탄탄기초</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">튼튼기초</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					
					<li style="display:none;">
						<div class="main-class-con-title">
							<strong>[오프라인]</strong> IT 통합 기초
						</div>
						<div class="mainProgramTabContent01">
							<img src="<c:url value='/img/curriculum/network02.jpg'/>" alt="IT통합 기초반" class="leftImage" />
							<table class="pProgram01">
								<tbody>
									<tr>
										<td class="ppTitle">기초탄탄</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">기초튼튼</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">탄탄기초</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
									</tr>
									<tr>
										<td class="ppTitle">튼튼기초</td>
										<td>확실하게 짚고 넘어가는 IT 기초 정복반</td>
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
					<a href="javasctipt:;" onclick="reviewClick('01')">자바</a>
				</li>
				<li id="review01" class="">
					<a href="javasctipt:;" onclick="reviewClick('01')">C언어</a>
				</li>
				<li id="review01" class="">
					<a href="javasctipt:;" onclick="reviewClick('01')">파이썬</a>
				</li>
				<li id="review01" class="">
					<a href="javasctipt:;" onclick="reviewClick('01')">네트워크</a>
				</li>
				<li id="review01" class="">
					<a href="javasctipt:;" onclick="reviewClick('01')">데이터베이스</a>
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
					<ul>
						<li class="real">
							<a href="javascript:;">
								<div class="textBox">
									<p class="textBox-title">이 수업 진짜 최고!</p>
									<p class="textBox-star">★ ★ ★ ★ ★ 수강생 평점 5</p>
									<p class="textBox-text">
										이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.
										이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.
										이 수업 듣고 자바 기초는 완전 정복했어요.이 수업 듣고 자바 기초는 완전 정복했어요.
										<p class="textBox-writer">김*수 수강생</p>
									</p>
								</div>
								<div class="imgBox">
									<div class="imgBox-title">[온라인] 자바 java wcy 강의</div>
									<img src="<c:url value='/img/main/main-review-java.png'/>" alt="java" />
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="wcy-ProgramLayout">
		<div class="class-title2">
			과목별 인기강의 
			<span  style="font-size:17px; font-weight:400;">&nbsp;&nbsp;&nbsp;수강생들이 사랑한 강의</span>
		</div>
		<ul class="wcy-best-class">
			<li class="hover-wrap">

					<a href="#"><img src="<c:url value='/img/curriculum/network01.jpg'/>" style="width:300px; height:300px;"/></a>
					<h3>[온라인] Python</h3>
					<div class="hover-bottom">
						<a href="#"><i class="fas fa-cart-plus"></i></a>
						<a href="#"><i class="fas fa-search-plus"></i></a>
					</div>
			</li>
			<li><a href="#"><img src="<c:url value='/img/curriculum/network08.jpg'/>" style="width:300px; height:300px;"/></a></li>
			<li><a href="#"><img src="<c:url value='/img/curriculum/network03.png'/>" style="width:300px; height:300px;"/></a></li>
			<li><a href="#"><img src="<c:url value='/img/curriculum/network04.jpg'/>" style="width:300px; height:300px;"/></a></li>
			<li><a href="#"><img src="<c:url value='/img/curriculum/network05.jpg'/>" style="width:300px; height:300px;"/></a></li>
			<li><a href="#"><img src="<c:url value='/img/curriculum/network06.jpg'/>" style="width:300px; height:300px;"/></a></li>
		</ul>
	</div>



</main> <!-- .cd-main-content -->


<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
<script src="<c:url value = "/js/main.js"/>"></script>
<!-- jquery 이미지 슬라이더 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<!-- 인기강의 슬라이더 -->
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<!-- 검색 기능 -->
<script src="<c:url value='/js/search-main.js'/>"></script>

<script>

$(document).ready(function(){
    $('.wcy-img-content').bxSlider({
       
       auto:true,         //자동으로 애니메이션 시작
       speed:500,         //애니메이션 속도
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
       maxSlides:4,
       shrinkItems:true,
       slideWidth:300,
       slideMargin:30
       //ticker:true,		//뉴스기사처럼 흘러가는것 
       //tickerHover:true	//마우스 호버시 정지
    });
  });
  
  
function logincheck(){
    if(${login == null}){
       alert("로그인이 필요한 서비스입니다.");
    }else{
    	location.href="<c:url value='/mypage/myinfoChange' />";
    }
       
 };

 
 // 인기강의 슬라이더

 
</script>


</body>
</html>