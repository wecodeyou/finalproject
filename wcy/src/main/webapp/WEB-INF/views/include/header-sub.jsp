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
<link rel="stylesheet" href="<c:url value='/css/header-sub.css'/>">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/search.css'/>">
<style>
body{font-family:'Nanum Gothic Coding', monospace;}
@media only screen and (max-width: 1023px) {
  .wcy-search-menu{
  	display: none;
  }
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
					 <!-- <li><a href="<c:url value='/member/logout' />" onclick="return confirm('정말로 로그아웃 하시겠습니까?')">로그아웃</a></li> -->
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
				<li><a a onclick="logincheck()"><i class="fa fa-shopping-cart"><p class="cart-p" style="font-size:11px; padding-top:5px;">장바구니</p></i></a></li>
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
                  
                  <li class="hover-me"><a href="<c:url value='/board/1'/>">자유게시판</a></li>
                  <li class="hover-me"><a href="<c:url value='/board/4'/>">질문게시판</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="#">Code</a></li>
                           <li style="width:300px;"><a href="#">etc</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/board/7'/>">공유게시판</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="#">Teach</a></li>
                           <li style="width:300px;"><a href="#">Tip</a></li>
                        </ul>                     
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/board/5'/>">정기모임/스터디</a></li>
                  <li class="hover-me"><a href="<c:url value='/board/6'/>">IT행사</a></li>
               </ul>
            </div>
         </li>
         
         <li><a href="<c:url value='/helpsite' />">도움이 되는 사이트</a></li>
         <li><a href="<c:url value='/board/8'/>">공지사항</a></li>
         
		</ul>
	</nav> <!-- .wcy-secondary-nav -->

<%@ include file="../member/login_modal.jsp" %>   
<%@ include file="../member/event_modal.jsp" %>  



<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
<script src="<c:url value = "/js/header-sub.js"/>"></script>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- 검색 기능 -->
<script src="<c:url value='/js/search-main.js'/>"></script>
<!-- 로그아웃 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>
<script type="text/javascript">
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
			      '잠시 후 로그아웃됩니다.',
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
<script>


function logincheck(){
    if(${login == null}){
    	Swal.fire('로그인이 필요한 서비스입니다.');
    }else{
    	location.href="<c:url value='/mypage/' />";
    }
       
 };

</script>


</body>
</html>