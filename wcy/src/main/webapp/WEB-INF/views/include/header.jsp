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
         <li> 
         	<!-- <a class="active" href="#">온라인 강의<span>&#x25BE;</span></a>-->
         	<a href="#">교육 과정<span>&#x25BE;</span></a>
            <div class="sub-menu-1">	
               <ul>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=102' />">Programming</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2001' />">C Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2002' />">Python Basic</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2003' />">JAVA Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2004' />">JSP Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2005' />">Spring Framework Project</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2006' />">Android/iOS App Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2007' />">C++</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=103' />">Cloud</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3001' />">AWS Technical Essentials</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3002' />">Architecting on AWS</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3003' />">Windows Server New Features</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3004' />">Windows Server Azure</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=104' />">Network</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=4001' />">CCNA-Basic</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=4002' />">CCNP-Switch</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=4003' />">CCNP-Route</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=105' />">System/Server</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=5001' />">LinuxServer</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=5002' />">WindowsServer 2012</a></li>
                        </ul>                     
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=106' />">Hacking</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6001' />">Hacking Trace</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6002' />">Web Hacking</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6003' />">reverse Engineering</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6004' />">System Hacking</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6005' />">Network Hacking</a></li>
                        </ul>                     
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=107' />">Database</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=7001' />">R Programing</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=7002' />">Hadoop Programing</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=7003' />">Oracle(WDP)</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=7004' />">Oracle(OAEC)</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=108' />">자격증</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=8001' />">정보처리기능사-필기</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=8002' />">정보처리기능사-실기</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=8003' />">정보처리기사-필기</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=8004' />">정보처리기사-실기</a></li>
                        </ul>                  
                     </div>
                  </li>
               </ul>
            </div>
         </li>
         
          <li><a href="#">학원 둘러보기</a></li>

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
	
	
	<div class="wcy-ProgramLayout">
		<ul class="wcy-best-class">
			<li><img src="<c:url value='/img/curriculum/network01.jpg'/>" style="width:300px; height:300px;"/></li>
			<li><img src="<c:url value='/img/curriculum/network02.jpg'/>" style="width:300px; height:300px;"/></li>
			<li><img src="<c:url value='/img/curriculum/network03.png'/>" style="width:300px; height:300px;"/></li>
			<li><img src="<c:url value='/img/curriculum/network04.jpg'/>" style="width:300px; height:300px;"/></li>
			<li><img src="<c:url value='/img/curriculum/network05.jpg'/>" style="width:300px; height:300px;"/></li>
			<li><img src="<c:url value='/img/curriculum/network06.jpg'/>" style="width:300px; height:300px;"/></li>
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
       speed:800,         //애니메이션 속도
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