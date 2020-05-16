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
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<style>
.footer > .bx-wrapper{
	-moz-box-shadow: 0 0 0px;
    -webkit-box-shadow: 0 0 0px;
    box-shadow: 0 0 0px;
    border: 0px;
    background: #25283d;
    margin-bottom: 0px !important;
    height: 80px;
    max-width:100% !important;
}

.footer > .bx-wrapper > .bx-viewport{
	height: 80px !important;
	padding: 17 80 0 80px !important;
}


</style>

</head>
<body>

    <footer id="footer" class="footer">
		<div class="familylogo">
			<a href="https://www.webjangi.com/"><img src="<c:url value='/img/footer/familylogo01.png'/>" title="웹쟁이" /></a>
			<a href="https://fontawesome.com/"><img src="<c:url value='/img/footer/familylogo02.png'/>" title="fontawesome" /></a>
			<a href="https://api.jquery.com/"><img src="<c:url value='/img/footer/familylogo03.png'/>" title="jQuery" /></a>
			<a href="https://www.google.com/"><img src="<c:url value='/img/footer/familylogo04.png'/>" title="Google" /></a>
			<a href="https://pixabay.com/ko/"><img src="<c:url value='/img/footer/familylogo05.png'/>" title="pixabay" /></a>
			<a href="https://mvnrepository.com/"><img src="<c:url value='/img/footer/familylogo06.png'/>" title="mvn repository" /></a>
			<a href="https://getbootstrap.com/"><img src="<c:url value='/img/footer/familylogo07.png'/>" title="Bootstrap" /></a>
			<a href="https://okky.kr/"><img src="<c:url value='/img/footer/familylogo08.png'/>" title="OKKY" /></a>
			<a href="https://stackoverflow.com/"><img src="<c:url value='/img/footer/familylogo09.png'/>" title="stackoverflow" /></a>
			<a href="https://github.com/"><img src="<c:url value='/img/footer/familylogo10.png'/>" title="GitHub" /></a>
			<a href="https://opentutorials.org/"><img src="<c:url value='/img/footer/familylogo11.png'/>" title="생활코딩" /></a>
		</div>
		<div class="footerinfo">
			<div class="logo">
				<img src="<c:url value='/img/footer/footer-logo.png'/>" title="wecodeyou" />
			</div>
			<div class="info">
				<ul class="links">
					<li><a href="#">사이트 도움말</a></li>
					<li><a href="#">사이트 이용약관</a></li>
					<li><a href="#">사이트 운영원칙</a></li>
					<li><a href="#"><span class="red">개인정보취급방침</span></a></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">게시중단요청서비스</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
				<ul class="address">
					<li><span class="black"> 종로점 </span> 서울특별시 종로구 돈화문로 26, 3-5층</li>
					<li><span class="black"> 강남점 </span> 서울특별시 강남구 강남대로 84길 16 제이스타워</li>
				</ul>
				<div class="copyright">
					<p>상호명:(주)위코드유&nbsp;&nbsp;&nbsp;대표자:위코유&nbsp;&nbsp;&nbsp;개인정보관리책임자:위코유</p>
					<p>학원등록번호:제 9999호 &nbsp;&nbsp;&nbsp;사업자등록번호:777-77-777777&nbsp;&nbsp;&nbsp;법인등록번호:111000-10101010&nbsp;&nbsp;&nbsp;통신판매번호:제00-000-111호</p>
					<p>상표권출원번호:0000000000000&nbsp;&nbsp;&nbsp;고객지원센터 대표번호:02-999-9999&nbsp;&nbsp;&nbsp;FAX:02-888-8888</p>
					<p>Copyright &copy; WECODEYOU. ALL RIGHTS RESERVED.</p>
				</div>
			</div>
		</div>
    </footer>
    
    
    
    <script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	
	<!-- bxSlider -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	    
    <script>
	    $(document).ready(function(){
	        $('.familylogo').bxSlider({
	           auto:true,         //자동으로 애니메이션 시작
	           speed:1000,         //애니메이션 속도
	           pause:3000,         //애니메이션 유지 시간 (2초)
	           adaptiveHeight:true,//자동으로 이미지의 높이에 맞게 슬라이드의 높이값 조절함
	           mode:'horizontal',      //슬라이드 모드('fade', 'horizontal', 'vertical'이 있음)
	           autoControls:false,   //시작, 중지 버튼 숨기기
	           autoHover:true,      //슬라이드에 마우스 오버시 애니메이션 정지하기
	           pager:false,         	//페이지 표시 보이기
	           minSlides:1,
	           maxSlides:7,
	           slideWidth:138,
	           slideMargin:80,
	           controls:false,
	           moveSlides:1,
	           shrinkItems:true,
	        });
	      });
    </script> 
    

</body>
</html>