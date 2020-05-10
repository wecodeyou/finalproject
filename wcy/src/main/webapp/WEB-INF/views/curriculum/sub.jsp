<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
	integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
	crossorigin="anonymous"></script>

<style>
.left-section {
	float: left;
	width: 210px;
}

.left-section>h2 {
	width: 210px;
	height: 112px;
	background: #25283D;
	color: #fff;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.left-section .left-sub-nav {
	width: 210px;
	border: solid #dbdbdb;
	border-width: 0 1px;
	box-sizing: border-box;
}

.left-section .left-sub-nav>li>a {
	padding: 10px 20px;
	font-size: 14px;
	display: block;
	position: relative;
	border-bottom: 1px solid #dbdbdb;
	font-weight: bold;
	color: #333;
}

.right-section {
	width: 840px;
	float: right;
	position: relative;
}

.right-header .right-sub-nav {
	width: 100%;
	background: #f4f4f4;
	border-radius: 5px;
	display: table;
	table-layout: fixed;
	margin-bottom: 50px;
	overflow: hidden;
}

.right-header .right-sub-nav li {
	display: table-cell;
}

.right-header .right-sub-nav li a {
	display: block;
	height: 60px;
	box-sizing: border-box;
	font-size: 18px;
	color: #888;
	padding: 0 0 0 20px;
	line-height: 60px;
	border-bottom: 4px solid #ddd;
}

.right-sub-nav li a.active {
	color: #25283D;
	border-color: #25283D;
}

.contents-title:before {
	display: block;
	content: '';
	width: 50px;
	height: 3px;
	background: #25283D;
	position: absolute;
	left: 0;
	top: 0;
}

.contents-title {
	font-size: 22px;
	margin-bottom: 20px;
	color: #000;
	position: relative;
	padding-top: 5px;
	height: 40px;
	line-height: 40px;
}

p {
	line-height: 150% !important;
}
</style>

</head>
<body>

	<jsp:include page="../include/header-sub.jsp" />


	<main class="wcy-main-content">
		<div class="left-section">
			<h2>여기다가 무얼써야하죠..?</h2>
			<ul class="left-sub-nav">
				<li><a href="#">매번매번</a></li>
				<li><a href="#">다른</a></li>
				<li><a href="#">애들이</a></li>
				<li><a href="#">나와야함</a></li>
			</ul>
		</div>

		<div class="right-section">
			<div class="right-header">
				<ul class="right-sub-nav">
					<li><a class="active">>커리큘럼 서브페이지 시퀀스 ${seq}</a></li>
				</ul>
			</div>
			<div class="right-contents">
				<h4 class="contents-title">서브 페이지의 seq는 2000번대부터 9000번대 까지
					있습니다.</h4>
				<p class="mb10">



					2001 spring <br> 2002 android<br> 2003 jsp<br> 2004
					java<br> 2005 tcp/ip소켓<br> 2006 자료구조<br> 2007 c++<br>
					2008 c언어<br> 2009 python을 이용한 웹서버 구축<br> 2010 python 기초 <br>
					<br> 3001 aws 입문<br> 3002 aws technical essentials<br>
					3003 architection on aws<br> 3004 Windows Server New Features<br>
					3005 Windows Server Azure<br> 3006 Windows Azure Cloud<br>
					<br> 4001 CCNP-Switch<br> 4002 CCNP-Route<br> 4003
					네트워크기초 <br> 4004 CCNP-통합<br> <br> 5001 linux<br>
					5002 windowsserver<br> <br> 6001 hacking trace<br>
					6002 web hacking<br> 6003 악성코드분석<br> 6004 리버스 엔지니어링<br>
					6005 시스템 해킹<br> 6006 네트워크 해킹<br> <br> 7001 r프로그래밍<br>
					7002 하둡 프로그래밍<br> 7003 oracle(wdp)<br> 7004 oracle db
					12c:sql<br> 7005 oracle - 통합<br> <br> 8001 정보처리 기능사
					- 필기<br> 8002 정보처리 기능사 - 실기<br> 8003 정보처리 기사 - 필기<br>
					8004 정보처리 기사 - 실기<br> 8005 정보처리 기사 필기/실기<br> <br>
					9001 둘러보기-종로<br> 9002 둘러보기-강남<br>

				</p>
			</div>
		</div>
	</main>

	<jsp:include page="../include/footer.jsp" />

	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>

</body>
</html>