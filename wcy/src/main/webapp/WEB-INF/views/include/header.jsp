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

<style>
/* 이미지 슬라이더 스타일 변경 오버라이드 */
.bx-wrapper{border:0; background:#fff; box-shadow:none; position:relative; margin-bottom:0px; margin-top:90px;}

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
				<li><a href="#"><i class="fa fa-gift"><p class="gift-p" style="font-size:11px; padding-top:5px;">이벤트</p></i></a></li>
				<li><a href="#"><i class="fa fa-shopping-cart"><p class="cart-p" style="font-size:11px; padding-top:5px;">장바구니</p></i></a></li>
				<li><a onclick="logincheck()"><i class="fa fa-user"><p class="user-p" style="font-size:10px; padding-top:5px;">마이페이지</p></i></a></li>
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
         	<a href="#">온라인 강의<span>&#x25BE;</span></a>
            <div class="sub-menu-1">	
               <ul>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=102' />">Programming</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2001' />">Spring Framework Open Source Project</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2002' />">Android App 개발</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2003' />">JSP Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2004' />">JAVA Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2005' />">TCP/IP 소켓 프로그래밍</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2006' />">자료구조</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2007' />">C++</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2008' />">C언어</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2009' />">Python을 이용한 웹서버 구축 </a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2010' />">Python 기초 </a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=103' />">Cloud</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3001' />">AWS Cloud 입문</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3002' />">AWS Technical Essentials</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3003' />">Architecting on AWS</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3004' />">Windows Server New Features</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3005' />">Windows Server Azure</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=3006' />">Windows Azure Cloud</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=104' />">Network</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=4001' />">CCNP-Switch</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=4002' />">CCNP-Route</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=4003' />">네트워크기초</a></li>
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
                     <div class="sub-menu-2">600
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6001' />">Hacking Trace</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6002' />">Web Hacking</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6003' />">악성코드분석</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6004' />">리버스엔지니어링</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6005' />">시스템 해킹</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6006' />">네트워크 해킹</a></li>
                        </ul>                     
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/on_main?seq=107' />">Database</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=7001' />">R 프로그래밍</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=7002' />">하둡 프로그래밍</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=7003' />">Oracle(WDP)</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=7004' />">Oracle Database 12c:SQL</a></li>
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
         
         <li><a href="#">현장 강의<span>&#x25BE;</span></a>
            <div class="sub-menu-1">
                <ul>
                  <li class="hover-me"><a href="<c:url value='/curriculum/off_main?seq=109' />">학원 둘러보기</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=9001' />">종로점</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=9002' />">강남점</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/off_main?seq=102' />">Programming</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2001' />">Spring Framework Open Source Project</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2002' />">Android App 개발</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2003' />">JSP Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2004' />">JAVA Programming</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2008' />">C언어</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2009' />">Python을 이용한 웹서버 구축 </a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=2010' />">Python 기초 </a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/off_main?seq=104' />">Network</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=4004' />">CCNP - 통합</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=4003' />">네트워크기초</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/off_main?seq=105' />">System/Server</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=5001' />">LinuxServer</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=5002' />">WindowsServer 2012</a></li>
                        </ul>                     
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/main?seq=106' />">Hacking</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6001' />">Hacking Trace</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6002' />">Web Hacking</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6005' />">시스템 해킹</a></li>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=6006' />">네트워크 해킹</a></li>
                        </ul>                     
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/main?seq=107' />">Database</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=7005' />">Oracle - 통합</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="hover-me"><a href="<c:url value='/curriculum/main?seq=108' />">자격증</a>
                     <div class="sub-menu-2">
                        <ul>
                           <li style="width:300px;"><a href="<c:url value='/curriculum/sub?seq=8005' />">정보처리기사 - 필기/실기</a></li>
                        </ul>                  
                     </div>
                  </li>
               </ul>
            </div>
         </li>
         
         <li><a href="<c:url value='/board/list'/>">커뮤니티<span>&#x25BE;</span></a>
            <div class="sub-menu-1">
                <ul>
                  <li class="hover-me"><a href="#">공지사항</a></li>
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
         <li><a href="#">고객센터</a></li>
         
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

<main class="wcy-main-content sub-nav-hero">
   <div>
      <p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, quos, voluptate, sunt, in suscipit quibusdam quis dignissimos eligendi repellendus ipsam exercitationem adipisci nostrum fugit accusamus quae cum nisi accusantium eaque.
      </p>

      <p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, dolore, impedit eveniet necessitatibus voluptate distinctio quam repellendus voluptates voluptatum inventore rem sapiente minus esse saepe iste harum architecto numquam quis vero dignissimos beatae est id libero adipisci enim odio natus commodi explicabo modi similique nesciunt deserunt vel consectetur velit omnis quaerat corrupti. Cumque, perspiciatis, culpa, reprehenderit laboriosam obcaecati deleniti soluta tempora ipsum ipsam iure temporibus dolore modi quidem cum doloribus ex vel suscipit sapiente ut esse optio voluptates molestias natus nostrum illo nihil quisquam facilis hic atque voluptas quae pariatur placeat officia doloremque quia ea recusandae rem iste asperiores iusto debitis quod incidunt id nemo repellendus itaque. Iure, vel, expedita quam repellendus aliquam fugit autem obcaecati libero reiciendis excepturi officia voluptate molestiae quis itaque consequatur nulla ea sunt facilis cupiditate tempora sequi nam in asperiores! Sunt, maxime at id eaque debitis quasi a possimus eveniet eum velit tempore quidem voluptates expedita quibusdam officiis. Ipsum, quaerat, vero, adipisci enim autem inventore eum maiores consectetur culpa molestiae cumque sed qui dolorem. Placeat, quae deleniti molestiae minima cupiditate quaerat sit est perspiciatis error iste. Ratione, minus, commodi, magni laborum doloribus libero ullam quos tenetur quis molestias ipsam consequuntur harum asperiores culpa nostrum omnis.
      </p>

      <p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, dolore, impedit eveniet necessitatibus voluptate distinctio quam repellendus voluptates voluptatum inventore rem sapiente minus esse saepe iste harum architecto numquam quis vero dignissimos beatae est id libero adipisci enim odio natus commodi explicabo modi similique nesciunt deserunt vel consectetur velit omnis quaerat corrupti. Cumque, perspiciatis, culpa, reprehenderit laboriosam obcaecati deleniti soluta tempora ipsum ipsam iure temporibus dolore modi quidem cum doloribus ex vel suscipit sapiente ut esse optio voluptates molestias natus nostrum illo nihil quisquam facilis hic atque voluptas quae pariatur placeat officia doloremque quia ea recusandae rem iste asperiores iusto debitis quod incidunt id nemo repellendus itaque. Iure, vel, expedita quam repellendus aliquam fugit autem obcaecati libero reiciendis excepturi officia voluptate molestiae quis itaque consequatur nulla ea sunt facilis cupiditate tempora sequi nam in asperiores! Sunt, maxime at id eaque debitis quasi a possimus eveniet eum velit tempore quidem voluptates expedita quibusdam officiis. Ipsum, quaerat, vero, adipisci enim autem inventore eum maiores consectetur culpa molestiae cumque sed qui dolorem. Placeat, quae deleniti molestiae minima cupiditate quaerat sit est perspiciatis error iste. Ratione, minus, commodi, magni laborum doloribus libero ullam quos tenetur quis molestias ipsam consequuntur harum asperiores culpa nostrum omnis.
      </p>

      <p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, quos, voluptate, sunt, in suscipit quibusdam quis dignissimos eligendi repellendus ipsam exercitationem adipisci nostrum fugit accusamus quae cum nisi accusantium eaque.
      </p>

      <p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, dolore, impedit eveniet necessitatibus voluptate distinctio quam repellendus voluptates voluptatum inventore rem sapiente minus esse saepe iste harum architecto numquam quis vero dignissimos beatae est id libero adipisci enim odio natus commodi explicabo modi similique nesciunt deserunt vel consectetur velit omnis quaerat corrupti. Cumque, perspiciatis, culpa, reprehenderit laboriosam obcaecati deleniti soluta tempora ipsum ipsam iure temporibus dolore modi quidem cum doloribus ex vel suscipit sapiente ut esse optio voluptates molestias natus nostrum illo nihil quisquam facilis hic atque voluptas quae pariatur placeat officia doloremque quia ea recusandae rem iste asperiores iusto debitis quod incidunt id nemo repellendus itaque. Iure, vel, expedita quam repellendus aliquam fugit autem obcaecati libero reiciendis excepturi officia voluptate molestiae quis itaque consequatur nulla ea sunt facilis cupiditate tempora sequi nam in asperiores! Sunt, maxime at id eaque debitis quasi a possimus eveniet eum velit tempore quidem voluptates expedita quibusdam officiis. Ipsum, quaerat, vero, adipisci enim autem inventore eum maiores consectetur culpa molestiae cumque sed qui dolorem. Placeat, quae deleniti molestiae minima cupiditate quaerat sit est perspiciatis error iste. Ratione, minus, commodi, magni laborum doloribus libero ullam quos tenetur quis molestias ipsam consequuntur harum asperiores culpa nostrum omnis.
      </p>

      <p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, dolore, impedit eveniet necessitatibus voluptate distinctio quam repellendus voluptates voluptatum inventore rem sapiente minus esse saepe iste harum architecto numquam quis vero dignissimos beatae est id libero adipisci enim odio natus commodi explicabo modi similique nesciunt deserunt vel consectetur velit omnis quaerat corrupti. Cumque, perspiciatis, culpa, reprehenderit laboriosam obcaecati deleniti soluta tempora ipsum ipsam iure temporibus dolore modi quidem cum doloribus ex vel suscipit sapiente ut esse optio voluptates molestias natus nostrum illo nihil quisquam facilis hic atque voluptas quae pariatur placeat officia doloremque quia ea recusandae rem iste asperiores iusto debitis quod incidunt id nemo repellendus itaque. Iure, vel, expedita quam repellendus aliquam fugit autem obcaecati libero reiciendis excepturi officia voluptate molestiae quis itaque consequatur nulla ea sunt facilis cupiditate tempora sequi nam in asperiores! Sunt, maxime at id eaque debitis quasi a possimus eveniet eum velit tempore quidem voluptates expedita quibusdam officiis. Ipsum, quaerat, vero, adipisci enim autem inventore eum maiores consectetur culpa molestiae cumque sed qui dolorem. Placeat, quae deleniti molestiae minima cupiditate quaerat sit est perspiciatis error iste. Ratione, minus, commodi, magni laborum doloribus libero ullam quos tenetur quis molestias ipsam consequuntur harum asperiores culpa nostrum omnis.
      </p>

      <p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur, dolore, impedit eveniet necessitatibus voluptate distinctio quam repellendus voluptates voluptatum inventore rem sapiente minus esse saepe iste harum architecto numquam quis vero dignissimos beatae est id libero adipisci enim odio natus commodi explicabo modi similique nesciunt deserunt vel consectetur velit omnis quaerat corrupti. Cumque, perspiciatis, culpa, reprehenderit laboriosam obcaecati deleniti soluta tempora ipsum ipsam iure temporibus dolore modi quidem cum doloribus ex vel suscipit sapiente ut esse optio voluptates molestias natus nostrum illo nihil quisquam facilis hic atque voluptas quae pariatur placeat officia doloremque quia ea recusandae rem iste asperiores iusto debitis quod incidunt id nemo repellendus itaque. Iure, vel, expedita quam repellendus aliquam fugit autem obcaecati libero reiciendis excepturi officia voluptate molestiae quis itaque consequatur nulla ea sunt facilis cupiditate tempora sequi nam in asperiores! Sunt, maxime at id eaque debitis quasi a possimus eveniet eum velit tempore quidem voluptates expedita quibusdam officiis. Ipsum, quaerat, vero, adipisci enim autem inventore eum maiores consectetur culpa molestiae cumque sed qui dolorem. Placeat, quae deleniti molestiae minima cupiditate quaerat sit est perspiciatis error iste. Ratione, minus, commodi, magni laborum doloribus libero ullam quos tenetur quis molestias ipsam consequuntur harum asperiores culpa nostrum omnis.
      </p>
   </div>
</main> <!-- .cd-main-content -->



<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
<script src="<c:url value = "/js/main.js"/>"></script>
<!-- jquery 이미지 슬라이더 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

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
       pager:true,         //페이지 표시 보이기
       //captions:true,      //이미지 위에 텍스트 보이기
       
    });
  });

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