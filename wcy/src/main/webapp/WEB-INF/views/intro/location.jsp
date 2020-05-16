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

.right-sub-nav > li > a.active
 {
	color: #25283D;
	border-color: #25283D;
}

.right-sub-nav > li > a:hover{
	color: #25283D;
	border-color: #25283D;
	transition:all .4s ease-in-out;
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

.gangnam{display: none;}

.bold{font-weight: 600 !important;}

</style>

</head>
<body>

	<jsp:include page="../include/header-sub.jsp" />


	<main class="wcy-main-content">
		<div class="left-section">
			<h2>WeCodeYou</h2>
			<ul class="left-sub-nav">
				<li><a href="#">인삿말</a></li>
				<li><a href="#">WCY 소개</a></li>
				<li><a class="active" href="#">오시는 길</a></li>
			</ul>
		</div>

		<div class="right-section">
			<div class="right-header">
				<ul class="right-sub-nav">
					<li><a class="active" href="javascript:mapchoiceJ();"> 종로 </a></li>
					<li><a class="" href="javascript:mapchoiceG();"> 강남 </a></li>
				</ul>
				
				<div class="right-contents jongro">
					<h4 class="contents-title">WeCodeYou <span class="bold">종로점</span> 오시는 길 안내</h4>
					<div id="map1" style="width:100%; height:350px;"></div>
				</div>
				
				<div class="right-contents gangnam">
					<h4 class="contents-title">WeCodeYou <span class="bold">강남점</span> 오시는 길 안내</h4>
					<div id="map2" style="width:100%; height:350px;"></div>
				</div>
				
			</div>
		</div>
	</main>
	
	
	
	

	<jsp:include page="../include/footer.jsp" />

	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=947482f976d50aef18432cb401577b10"></script>
	
	
	<!-- 카카오 지도 -->
	<script>
	var mapContainer1 = document.getElementById('map1'), // 지도를 표시할 div 
	    mapOption1 = { 
	        center: new kakao.maps.LatLng(37.571181, 126.992549), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
	    mapOption2 = { 
	        center: new kakao.maps.LatLng(37.496685, 127.030124), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map1 = new kakao.maps.Map(mapContainer1, mapOption1); 
	var map2 = new kakao.maps.Map(mapContainer2, mapOption2); 
	
	// 마커가 표시될 위치입니다 
	var markerPosition1  = new kakao.maps.LatLng(37.571181, 126.992549); 
	var markerPosition2  = new kakao.maps.LatLng(37.496685, 127.030124); 

	// 마커를 생성합니다
	var marker1 = new kakao.maps.Marker({
	    position: markerPosition1
	});
	var marker2 = new kakao.maps.Marker({
	    position: markerPosition2
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker1.setMap(map1);
	marker2.setMap(map2);
	
	// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
	var iwContent1 = '<div style="padding:5px;">위코드유 종로점</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	var iwContent2 = '<div style="padding:5px;">위코드유 강남점</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

	// 인포윈도우를 생성합니다
	var infowindow1 = new kakao.maps.InfoWindow({
	    content : iwContent1
	});
	var infowindow2 = new kakao.maps.InfoWindow({
	    content : iwContent2
	});

	// 마커에 마우스오버 이벤트를 등록합니다
	kakao.maps.event.addListener(marker1, 'mouseover', function() {
	  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
	    infowindow1.open(map1, marker1);
	});
	kakao.maps.event.addListener(marker2, 'mouseover', function() {
	    infowindow2.open(map2, marker2);
	});

	// 마커에 마우스아웃 이벤트를 등록합니다
	kakao.maps.event.addListener(marker1, 'mouseout', function() {
	    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
	    infowindow1.close();
	});
	kakao.maps.event.addListener(marker2, 'mouseout', function() {
	    infowindow2.close();
	});
	
	var sBtn = $(".right-sub-nav > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
	$(function(){
		  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
		  sBtn.find("a").removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
		  $(this).addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
		});
	});

	
 	function mapchoiceJ(){
 		$('.jongro').show();
	 	$('.gangnam').hide();
 	}
 	function mapchoiceG(){
 		$('.jongro').hide();
 		$('.gangnam').show();
 		map2.relayout();
 		map2.setCenter(new kakao.maps.LatLng(37.496685, 127.030124));
		
 	}

	
	</script>

</body>
</html>