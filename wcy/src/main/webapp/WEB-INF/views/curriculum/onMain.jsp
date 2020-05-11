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


</head>
<body>

	<jsp:include page="../include/header-sub.jsp" />


	<main class="wcy-main-content">
		<div class="wcy-contents">
			<div class="page-width">
				<h1>${c.engName}</h1>
				<h2>[ <span>${c.korName}에 관련된 과정</span> ]</h2>
			</div>
			
			<article class="curriculum">
				<div class="page-width">
					<h5 class="curri-title">${c.engName}</h5>
					<ul class="curri-list">
						
						<li>
							<!-- <a href="#" onclick="location.href='/curriculum/sub.php?seq=34'"></a> -->
							<a href="#">
								<div class="curri-list-img"><img src="<c:url value='/img/curriculum/network01.jpg'/>" alt="" /></div>
							</a>
							<div class="curri-list-text">
								<h5>${c.subTitle1}</h5>
								<p>${c.subDetail1}
								<div class="curri-list-btn">
									<button type="button" onclick="" class="btn_blue">과정 상세보기</button>
									<button type="button" onclick="" class="btn_red">장바구니 담기</button>
								</div>
							</div>
						</li>
						
						<li class="mt20">
							<!-- <a href="#" onclick="location.href='/curriculum/sub.php?seq=34'"></a> -->
							<a href="#">
								<div class="curri-list-img"><img src="<c:url value='/img/curriculum/network02.jpg'/>" alt="" /></div>
							</a>
							<div class="curri-list-text">
								<h5>${c.subTitle2}</h5>
								<p>${c.subDetail2}
								<div class="curri-list-btn">
									<button type="button" onclick="" class="btn_blue">과정 상세보기</button>
									<button type="button" onclick="" class="btn_red">장바구니 담기</button>
								</div>
							</div>
						</li>
						
						<li class="mt20">
							<!-- <a href="#" onclick="location.href='/curriculum/sub.php?seq=34'"></a> -->
							<a href="#">
								<div class="curri-list-img"><img src="<c:url value='/img/curriculum/network03.png'/>" alt="" /></div>
							</a>
							<div class="curri-list-text">
								<h5>CCNP-Switch</h5>
								<p>라우터와 스위치 등의 장비를 이용하여 네트워크를 구성하는 방법을 학습하는 과정
								<div class="curri-list-btn">
									<button type="button" onclick="" class="btn_blue">과정 상세보기</button>
									<button type="button" onclick="" class="btn_red">장바구니 담기</button>
								</div>
							</div>
						</li>
						
					</ul>
				</div>
			</article>
			
		</div>
	</main>

	<jsp:include page="../include/footer.jsp" />





	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>

</body>
</html>