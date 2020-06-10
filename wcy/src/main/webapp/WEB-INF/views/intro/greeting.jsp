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



.right-section {
	width: 840px;
	float: right;
	position: relative;
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

article.company, article.history{
	font-size: 14px;
    color: #666;
    line-height: 20px;
}

.company .txt {
    background-color: #f7f7f7;
    margin-top: 60px;
    padding: 90px 20px 100px 20px;
    height: 445px;
}

.history .txt {
    background-color: #fff;
    padding: 90px 0 20px;
}


.width {
    width: 1100px;
    margin: 0 auto;
}

.company .txtLeft{
    float: left;
    width: 372px;
}
.history .txtLeft {
	float: left;
    width: 55%;
    text-align: center;
    position: relative;
}

.company .txtLeft img{
	width:372px;
	height:300px;
}
.history .txtLeft img{
	width:390px;
	height:222px;
	position: relative;
}


.history .imgbottom img{
	width:390px;
	height:222px;
	position: relative;
}

.history .txtLeft .semo{
	position: absolute;
    top: -8px;
    left: 99px;
    width: 0px;
    height: 0px;
    border-top: 30px solid #25283dd4;
    border-bottom: 30px solid transparent;
    border-left: 30px solid #25283dd4;
    border-right: 30px solid transparent;
}
.history .txtLeft .semo2{
	position: absolute;
    top: 171px;
    left: 99px;
    width: 0px;
    height: 0px;
    border-top: 30px solid transparent;
    border-bottom: 30px solid #25283dd4;
    border-left: 30px solid #25283dd4;
    border-right: 30px solid transparent;
}
.history .txtRight .semo3{
	position: absolute;
    top: 171px;
    left: 339px;
    width: 0px;
    height: 0px;
    border-top: 30px solid transparent;
    border-bottom: 30px solid #25283dd4;
    border-left: 30px solid transparent;
    border-right: 30px solid #25283dd4;
}

.company .txtRight{
	float: left;
    width: 650px;
    color: #6d6464;
    text-align: left;
    font-size: 16px;
    line-height: 26px;
    margin-top: 50px;
    margin-left: 34px;
}
.history .txtRight {
	float: right;
    width: 45%;
    text-align: left;
    position: relative;
}

.history .txtRight p{
	text-align: left;
    padding-left: 30px;
    font-size: 28px;
    color: #333;
    font-weight: bold;
}

.history .txtRight p:before {
    display: inline-block;
    content: '';
    width: 13px;
    height: 13px;
    background: #febf14;
    position: absolute;
    left: -6px;
    top: 5px;
    z-index: 1;
}


.history .txtRight ul:before {
    display: inline-block;
    content: '';
    width: 1px;
    height: 40px;
    background: #dcdcdc;
    position: absolute;
    left: 0;
    top: 5px;
}


.history .txtRight ul li:before {
    display: inline-block;
    content: '';
    width: 1px;
    height: 25px;
    background: #dcdcdc;
    position: absolute;
    left: 0;
}

.history .txtRight ul {
    text-align: left;
}

.history .txtRight ul li {
    padding-left: 30px;
    line-height: 24px;
}
.history .txtRight span {
    margin-right: 20px;
    color: #333;
}

.history .txt .imgbottom{
    width: 100%;
    position: relative;
    display:inline-block;
    margin-top: 30px;
}
.right-header .right-sub-nav1{
	width: 100%;
    background: #f4f4f4;
    border-radius: 5px;
    display: table;
    table-layout: fixed;
    margin-bottom: 50px;
    overflow: hidden;
}
.right-header .right-sub-nav1 li {
    display: table-cell;
}

.right-header .right-sub-nav1 > li > a.active , .right-header .right-sub-nav1 > li > a:hover{
    color: #25283D;
    border-color: #25283D;
    transition:all .4s ease-in-out;
}

.right-header .right-sub-nav1 li a {
    display: block;
    height: 60px;
    box-sizing: border-box;
    font-size: 18px;
    color: #888;
    padding: 0 0 0 20px;
    line-height: 60px;
    border-bottom: 4px solid #ddd;
}

</style>

</head>
<body>

	<jsp:include page="../include/header-sub.jsp" />


	<main class="wcy-main-content">
		<div class="wcy-contents">
			<div class="right-header">
				<ul class="right-sub-nav1 shadow rounded">
					<li><a class="active"> WECODEYOU 소개 </a></li>
					<li><a class="scrollMove" href="#historyCon"> WECODEYOU 연혁 </a></li>
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
				<article class="company shadow rounded">
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
			<div class="greetingCon" id="historyCon" style="margin-top:100px;">
				<h1>WCY 연혁</h1>
				<h2>[ 대한민국의 미래를 만드는 IT 교육기관]</h2>
				<p class="mb10 mt50">
					대한민국의 미래를 만드는 IT 교육기관이라는 책임감을 가지고 끊임없이 노력하겠습니다.
				</p>
				<p>
					모든 프로그래머에게 필요한 정보와 기능을 지원하기 위해 항상 최선을 다하겠습니다.
				</p>
				<article class="history">
					<div class="txt">
						<div class="width">
							<div class="txtLeft">
							<img src="<c:url value='/img/commons/company (2).jpg'/>" alt="" class="shadow rounded" />
							<div class="semo"></div>
							</div>
							<div class="txtRight">
								<p> 2019년 </p>
								<ul>
									<li><span>12월</span>제 21회 경제유니버시아드 대회 공동 주최</li>
									<li><span>10월</span>고용노동부 7차 훈련이수자평가 A등급 선정</li>
									<li><span>08월</span>2019 대한민국 소비자 선호 브랜드 대상 [IT교육 부문]</li>
									<li><span>07월</span>고용노동부 서울지방고용노동청 IT기업 잡페어 개최</li>
									<li><span>06월</span>2019 대한민국 교육산업대상 학원 부문 대상</li>
									<li><span>04월</span>혁신성장 청년인재 집중양성 사업 수행기관 선정</li>
									<li><span>02월</span>고용노동부 3차 훈련이수자평가 A등급 선정</li>
									<li><span>01월</span>1월 일본 반탄 게임아카데미 업무협약체결</li>
								</ul>
							</div>
								<div class="imgbottom">
									<div class="txtLeft">
										<img src="<c:url value='/img/commons/company (3).jpg'/>" alt="" class="shadow rounded" />
										<div class="semo2"></div>
									</div>
									<div class="txtRight">
										<img src="<c:url value='/img/commons/company (4).jpg'/>" alt="" class="shadow rounded" />
										<div class="semo3"></div>
									</div>
									
								</div>
						</div>
					</div>
				</article>
			</div>
		</div>
	</main>


	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>

	<script>
	   //원하는 타겟으로 스크롤 부드럽게 이동
		jQuery(document).ready(function($){
			$(".scrollMove").click(function(event){
				var headerHeight = $('.wcy-secondary-nav').outerHeight();
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top-headerHeight},900);
			});
		});
	</script>

	<script>
		var nBtn = $(".right-sub-nav > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
		$(function(){
			  nBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
			  nBtn.find("a").removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
			  $(this).addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
			});
		});

	</script>
	
	
</body>
	<jsp:include page="../include/footer.jsp" />
</html>