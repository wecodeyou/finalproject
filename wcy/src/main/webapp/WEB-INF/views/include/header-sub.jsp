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
			<form action="" method="get" class="search-form">
			<ul id="wcy-search">
				<li>
				<fieldset id="search-fieldset">
					<input type="search" id="search-input" 
						placeholder="파이썬(Python)기초 프로젝트"/>
					<button type="submit" id="search-btn">
						<i class="fa fa-search"></i>
					</button>
				</fieldset>
				</li>
			</ul>
			</form>
			<ul id="wcy-menu">
				<li><a href="#"><i class="fa fa-gift"><p class="gift-p" style="font-size:11px; padding-top:5px;">이벤트</p></i></a></li>
				<li><a href="#"><i class="fa fa-shopping-cart"><p class="cart-p" style="font-size:11px; padding-top:5px;">장바구니</p></i></a></li>
				<c:if test="${login == null || login.userType == 0 || login.userType == 1}">
					<li><a onclick="logincheck()"><i class="fa fa-user"><p class="user-p" style="font-size:11px; padding-top:5px;">마이페이지</p></i></a></li>
				</c:if>
				<c:if test="${login.userType == 2}">
					<li><a href="#"><i class="fa fa-user"><p class="user-p" style="font-size:11px; padding-top:5px;">관리자페이지</p></i></a></li>
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
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3001' />">AWS Cloud Basic</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3002' />">AWS Technical Essentials</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3003' />">Architecting on AWS</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3004' />">Windows Server New Features</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3005' />">Windows Server Azure</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=104' />">Network</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=4001' />">CCNP-Switch</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=4002' />">CCNP-Route</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=4003' />">CCNA-Basic</a></li>
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

<%@ include file="../member/login_modal.jsp" %>  

<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
<script src="<c:url value = "/js/header-sub.js"/>"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<script>

function logincheck(){
    if(${login == null}){
       alert("로그인이 필요한 서비스입니다.");
    }else{
    	location.href="<c:url value='/mypage/myinfoChange' />";
    }
       
 };

</script>


</body>
</html>