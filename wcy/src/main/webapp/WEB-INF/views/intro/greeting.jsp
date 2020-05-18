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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
	integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
	crossorigin="anonymous"></script>

<style>
body{font-family:'Nanum Gothic Coding', monospace;}

.greetingCon{margin:0 auto;}

	.greetingCon > h1 , .wcy-main-content .greetingCon h1{font-size:42px; font-weight:normal;}
    
    .greetingCon > h2:before , .wcy-main-content .greetingCon h2:before{display:block; content:''; width:1px; height:25px; background: #febf14; margin:0 auto; margin-bottom: 15px;}
  
    .greetingCon > h2:after , .wcy-main-content .greetingCon h2:after{display:block; content:''; width:1px; height:25px; background: #febf14; margin:0 auto; margin-top: 15px;}
    .greetingCon > h2 , .wcy-main-content .greetingCon h2{font-size:20px; font-weight:600; color:#febf14; margin-top: 50px;}

.wcy-main-content2{
		width: 100%;
		height:100%;
		margin: 190px auto 120px;
		overflow: hidden;
}

.right-section {
	width: 840px;
	float: right;
	position: relative;
}

.wcy-main-content2 > .wcy-contents > .right-header > .right-sub-nav {
	width: 80%;
	background: #f4f4f4;
	border-radius: 5px;
	display: table;
	table-layout: fixed;
	margin: 0 auto 50px;
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

.wcy-contents p {
	line-height: 150% !important;
	font-size:15px;
	font-family:'Nanum Gothic Coding', monospace;
	color: #767676;
}

.fleft{float:left !important;}

article.company{
	font-size: 14px;
    color: #666;
    line-height: 20px;
}

.company .txt {
    background-color: #f7f7f7;
    margin-top: 60px;
    padding: 90px 0 100px;
    height: 445px;
}

.width {
    width: 1100px;
    margin: 0 auto;
}

.company .txtLeft {
    float: left;
    width: 372px;
}

.company .txtLeft img{
	width:372px;
	height:300px;
}

.company .txtRight {
    float: right;
    width: 58%;
    color: #6d6464;
    text-align: left;
    font-size: 16px;
    line-height: 26px;
    margin-top: 50px;
}



</style>

</head>
<body>

	<jsp:include page="../include/header-sub.jsp" />


	<main class="wcy-main-content2">
		<div class="wcy-contents">
			<div class="right-header">
				<ul class="right-sub-nav">
					<li><a class="active"> WECODEYOU 소개 </a></li>
				</ul>
			</div>
			<div class="greetingCon">
				<h1>모든 프로그래머의 지침서 WCY입니다.</h1>
				<h2>[ 여러분과 함께 나아가는 IT 교육 사이트 ]</h2>
				<p class="mb10 mt50">
					"위코드유(WCY)"는 기존 IT 강의 사이트를 벗어나 커뮤니티적 성격이 추가된 새로운 형식의 교육 사이트입니다.
				</p>
				<p>
					모든 프로그래머에게 필요한 정보와 기능을 지원하기 위해 항상 최선을 다하겠습니다.
				</p>
				<article class="company">
					<div class="txt">
						<div class="width">
							<div class="txtLeft">
							<img src="<c:url value='/img/commons/company (1).jpg'/>" alt="" />
							</div>
							<div class="txtRight">
								<span class="fs25b">WECODEYOU</span> 는<br>
								새로운 IT 교육 플랫폼 구상을 위해 노력해 왔습니다. 우리는 프로그래머들이 코딩에 막혔을 때 기존의 강의 사이트의 영상과 질의 응답 커뮤니티 등의 기능을 모두 필요로 한다는 것을 알았습니다.
								이에 WCY는 이 모두를 충족시키는 사이트가 되는 것을 자처하며 여러분의 개발에 든든한 파트너가 되겠습니다.
								또한 수강생들의 실무 능력에 대한 적응력을 키우는데 초점을 맞추어 강의, 교육 컨설팅 뿐만 아니라 수강생과 수료생에 대한 취업지원에도 온 힘을 다하겠습니다.
							</div>
						</div>
					</div>
				</article>
			</div>
		</div>
	</main>


	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>

</body>
	<jsp:include page="../include/footer.jsp" />
</html>