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
<style>
@media only screen and (max-width: 1023px) {
  .wcy-search-menu{
  	display: none;
  }
  .wcy-main-content{
  	
  }
} 



</style>

<title>Insert title here</title>
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
			<form action="" method="get" class="search-form">
			<ul id="wcy-search">
				<li>
				<fieldset id="search-fieldset"><input type="search" id="search-input" placeholder="파이썬(Python)기초 프로젝트"/><button type="submit" id="search-btn"><i class="fa fa-search"></i></button></fieldset>
				</li>
			</ul>
			</form>
			<ul id="wcy-menu">
				<li><a href="#"><i class="fa fa-gift"><p class="gift-p" style="font-size:11px; padding-top:5px;">이벤트</p></i></a></li>
				<li><a href="#"><i class="fa fa-shopping-cart"><p class="cart-p" style="font-size:11px; padding-top:5px;">장바구니</p></i></a></li>
				<li><a onclick="logincheck()"><i class="fa fa-user"><p class="user-p" style="font-size:10px; padding-top:5px;">마이페이지</p></i></a></li>
				<li><a href="#"><i class="fa fa-headset"><p class="headset-p" style="font-size:11px; padding-top:5px;">고객센터</p></i></a></li>
			</ul>
		</nav>
		
	</header> <!-- .wcy-auto-hide-header -->


	<nav class="wcy-secondary-nav">
		<ul>
		
			<li><a class="active" href="#">온라인 강의<span>&#x25BE;</span></a>
				<div class="sub-menu-1">
					<ul>
						<li class="hover-me"><a href="#">Programming</a>
							<div class="sub-menu-2">
								<ul>
									<li style="width:300px;"><a href="#">Spring Framework Open Source Project</a></li>
									<li style="width:300px;"><a href="#">Android App 개발</a></li>
									<li style="width:300px;"><a href="#">JSP Programming</a></li>
									<li style="width:300px;"><a href="#">JAVA Programming</a></li>
									<li style="width:300px;"><a href="#">TCP/IP 소켓 프로그래밍</a></li>
									<li style="width:300px;"><a href="#">자료구조</a></li>
									<li style="width:300px;"><a href="#">C++</a></li>
									<li style="width:300px;"><a href="#">C언어</a></li>
									<li style="width:300px;"><a href="#">Python을 이용한 웹서버 구축 </a></li>
									<li style="width:300px;"><a href="#">Python 기초 </a></li>
								</ul>
							</div>
						</li>
						<li class="hover-me"><a href="#">Cloud</a>
							<div class="sub-menu-2">
								<ul>
									<li style="width:300px;"><a href="#">AWS Cloud 입문</a></li>
									<li style="width:300px;"><a href="#">AWS Technical Essentials</a></li>
									<li style="width:300px;"><a href="#">Architecting on AWS</a></li>
									<li style="width:300px;"><a href="#">Windows Server New Features</a></li>
									<li style="width:300px;"><a href="#">Windows Server Azure</a></li>
									<li style="width:300px;"><a href="#">Windows Azure Cloud</a></li>
								</ul>
							</div>
						</li>
						<li class="hover-me"><a href="#">Network</a>
							<div class="sub-menu-2">
								<ul>
									<li style="width:300px;"><a href="#">CCNP-Switch</a></li>
									<li style="width:300px;"><a href="#">CCNP-Route</a></li>
									<li style="width:300px;"><a href="#">네트워크기초</a></li>
								</ul>
							</div>
						</li>
						<li class="hover-me"><a href="#">System/Server</a>
							<div class="sub-menu-2">
								<ul>
									<li style="width:300px;"><a href="#">LinuxServer</a></li>
									<li style="width:300px;"><a href="#">WindowsServer 2012</a></li>
								</ul>							
							</div>
						</li>
						<li class="hover-me"><a href="#">Hacking</a>
							<div class="sub-menu-2">
								<ul>
									<li style="width:300px;"><a href="#">Hacking Trace</a></li>
									<li style="width:300px;"><a href="#">Web Hacking</a></li>
									<li style="width:300px;"><a href="#">악성코드분석</a></li>
									<li style="width:300px;"><a href="#">리버스엔지니어링</a></li>
									<li style="width:300px;"><a href="#">시스템 해킹</a></li>
									<li style="width:300px;"><a href="#">네트워크 해킹</a></li>
								</ul>							
							</div>
						</li>
						<li class="hover-me"><a href="#">Database</a>
							<div class="sub-menu-2">
								<ul>
									<li style="width:300px;"><a href="#">R 프로그래밍</a></li>
									<li style="width:300px;"><a href="#">하둡 프로그래밍</a></li>
									<li style="width:300px;"><a href="#">Oracle(WDP)</a></li>
									<li style="width:300px;"><a href="#">Oracle Database 12c:SQL</a></li>
								</ul>
							</div>
						</li>
						<li class="hover-me"><a href="#">자격증</a>
							<div class="sub-menu-2">
								<ul>
									<li style="width:300px;"><a href="#">정보처리기능사-필기</a></li>
									<li style="width:300px;"><a href="#">정보처리기능사-실기</a></li>
									<li style="width:300px;"><a href="#">정보처리기사-필기</a></li>
									<li style="width:300px;"><a href="#">정보처리기사-실기</a></li>
								</ul>						
							</div>
						</li>
					</ul>
				</div>
			</li>
			
			<li><a href="#">현장 강의<span>&#x25BE;</span></a>
				<div class="sub-menu-1">
					<ul>
						<li><a href="#">Programming</a></li>
						<li><a href="#">Cloud</a></li>
						<li><a href="#">Network</a></li>
						<li><a href="#">System/Server</a></li>
						<li><a href="#">Hacking</a></li>
						<li><a href="#">Database</a></li>
						<li><a href="#">자격증</a></li>
					</ul>
				</div>
			</li>
			
			<li><a href="#">커뮤니티<span>&#x25BE;</span></a></li>
			<li><a href="#">도움이 되는 사이트</a></li>
			<li><a href="#">고객센터</a></li>
			<li><a href="#">회사소개</a></li>
		</ul>
	</nav> <!-- .wcy-secondary-nav -->

<%@ include file="../member/login_modal.jsp" %>  

<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
<script src="<c:url value = "/js/header-sub.js"/>"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<script>


function logincheck(){
	   if(${login == null}){
	      alert("로그인이 필요한 서비스입니다.");
	   }else{
	      location.href="<c:url value='/mypage/' />";
	   }
	      
	};

</script>


</body>
</html>