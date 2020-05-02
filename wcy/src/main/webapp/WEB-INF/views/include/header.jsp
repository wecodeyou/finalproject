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

<style>
/* 이미지 슬라이더 스타일 변경 오버라이드 */
.bx-wrapper{border:0; background:#fbfbfb; box-shadow:none; position:relative;}

.bx-wrapper .bx-controls.bx-has-controls-auto.bx-has-pager .bx-pager{
	position:absolute;
	left:50%;
	bottom:10px;
	width:2%;
}

.bx-wrapper .bx-controls.bx-has-controls-auto.bx-has-pager .bx-controls-auto{
	position: absolute;
	right: 
}

.bx-wrapper .bx-pager{
	padding-top:0;
}

.bx-wrapper .bx-pager.bx-default-pager a{
	background:#fff;
}

pager.bx-default-pager a:hover, 
.bx-wrapper .bx-pager.bx-default-pager a.active, 
.bx-wrapper .bx-pager.bx-default-pager a:focus{
	background:#c7c7c7;
}

.bx-wrapper .bx-controls-auto .bx-start,
.bx-wrapper .bx-controls-auto .bx-stop{
	-webkit-filter: opacity(0.1) drop-shadow(0 0 0 white);
	filter: opacity(0.1) drop-shadow(0 0 0 white);
}

.bx-wrapper .bx-controls-auto .bx-stop:hover, 
.bx-wrapper .bx-controls-auto .bx-stop.active, 
.bx-wrapper .bx-controls-auto .bx-stop:focus{
	-webkit-filter: opacity(0.1) drop-shadow(0 0 0 #c7c7c7);
	filter: opacity(0.1) drop-shadow(0 0 0 #c7c7c7);
}

.bx-wrapper .bx-controls-auto .bx-start:hover, 
.bx-wrapper .bx-controls-auto .bx-start.active, 
.bx-wrapper .bx-controls-auto .bx-start:focus{
	-webkit-filter: opacity(0.1) drop-shadow(0 0 0 #c7c7c7);
	filter: opacity(0.1) drop-shadow(0 0 0 #c7c7c7);
}


</style>


<title>Insert title here</title>
</head>
<body>


	<header class="wcy-auto-hide-header">
		<div class="logo"><a href="#"><img src="<c:url value='/img/commons/wcy_logo_sample_black.png'/>" alt="Logo" /></a></div>
		
		<div class="wcy-primary-nav">
			<a href="#" class="nav-trigger">
				<span>
					<em aria-hidden="true"></em>
					Menu
				</span>
			</a> <!-- .nav-trigger -->
			
			<ul id="wcy-navigation">
				<li><a href="#">로그인</a></li>
				<li><a href="#">회원가입</a></li>
				<li><a href="#">아이디(이메일)/비밀번호 찾기</a></li>
			</ul>
		</div> <!-- .wcy-primary-nav -->
	</header> <!-- .wcy-auto-hide-header -->

	<section class="wcy-main-img">
		<div class="wcy-img-content">
			<!-- <a href="#"><img id="introImg" border="0" /></a> -->
			<a href="#"><img src="<c:url value='/img/main/sample01.png'/>" alt="" title="이미지1" /></a>
			<a href="#"><img src="<c:url value='/img/main/sample02.png'/>" alt="" title="이미지2" /></a>
			<a href="#"><img src="<c:url value='/img/main/sample03.png'/>" alt="" title="이미지3" /></a>
			<a href="#"><img src="<c:url value='/img/main/sample04.png'/>" alt="" title="이미지4" /></a>
		</div>
	</section>


	<nav class="wcy-secondary-nav">
		<ul>
			<li><a class="active" href="#">온라인 강의</a></li>
			<li><a href="#">현장 강의</a></li>
			<li><a href="#">커뮤니티</a></li>
			<li><a href="#">도움이 되는 사이트</a></li>
			<li><a href="#">고객센터</a></li>
			<li><a href="#">회사소개</a></li>
		</ul>
	</nav> <!-- .wcy-secondary-nav -->
	


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

<script>

$(document).ready(function(){
    $('.wcy-img-content').bxSlider({
    	
    	auto:true,			//자동으로 애니메이션 시작
    	speed:500,			//애니메이션 속도
    	pause:4000,			//애니메이션 유지 시간 (4초)
    	mode:'fade',		//슬라이드 모드('fade', 'horizontal', 'vertical'이 있음)
    	autoControls:true,	//시작, 중지 버튼 보이기
    	autoHover:true,		//슬라이드에 마우스 오버시 애니메이션 정지하기
    	pager:true,			//페이지 표시 보이기
    //captions:true,		//이미지 위에 텍스트 보이기
    	
    });
  });

/*
	var imgArray=new Array();
	imgArray[0]="<c:url value='/img/main/sample01.png'/>";
	imgArray[1]="<c:url value='/img/main/sample02.png'/>";
	imgArray[2]="<c:url value='/img/main/sample03.png'/>";
	imgArray[3]="<c:url value='/img/main/sample04.png'/>";

	console.log(imgArray);
	function showImg(){
		var imgNum = Math.round(Math.random()*3);
		var objImg = document.getElementById("introImg");
		objImg.src=imgArray[imgNum];

		setTimeout(showImg,3000);
	}
*/

</script>


</body>
</html>