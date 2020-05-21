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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
	integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
	crossorigin="anonymous"></script>


</head>
<body>

	<jsp:include page="../include/header-sub.jsp" />


	<main class="wcy-main-content">
		<div class="wcy-contents">
			<div class="page-width" >
				<h1>${c.engName}</h1>
				<h2>[ <span>${c.korName}에 관련된 과정</span> ]</h2>
			</div>
			
			<article class="curriculum">
				<div class="page-width   shadow rounded">
					<h5 class="curri-title">${c.engName}</h5>
					<ul class="curri-list">
						
						<li>
							<div class="curri-list-img">
								<img src="${c.subImg1}" alt="" />
							</div>
							<div class="curri-list-text">
								<h5>${c.subTitle1}</h5>
								<p>${c.subDetail1}
								<div class="curri-list-btn">
									<button type="button" onclick="location.href = '<c:url value='/curriculum/sub?s=${c.subTitle1}' />'" class="btn_blue">과정 상세보기</button>
									<!-- <button type="button" onclick="" class="btn_red">장바구니 담기</button> -->
								</div>
							</div>
						</li>
						
						<li class="mt20">
							<div class="curri-list-img">
								<img src="${c.subImg2}" alt="" />
							</div>
							<div class="curri-list-text">
								<h5>${c.subTitle2}</h5>
								<p>${c.subDetail2}
								<div class="curri-list-btn">
									<button type="button" onclick="location.href = '<c:url value='/curriculum/sub?s=${c.subTitle2}' />'" class="btn_blue">과정 상세보기</button>
								</div>
							</div>
						</li>
						
						<c:if test="${c.subTitle3 != null }">
						<li class="mt20">
							<div class="curri-list-img">
								<img src="${c.subImg3}" alt="" />
							</div>
							<div class="curri-list-text">
								<h5>${c.subTitle3}</h5>
								<p>${c.subDetail3}
								<div class="curri-list-btn">
									<button type="button" onclick="location.href = '<c:url value='/curriculum/sub?s=${c.subTitle3}' />'" class="btn_blue">과정 상세보기</button>
								</div>
							</div>
						</li>
						</c:if>
						<c:if test="${c.subTitle4 != null }">
						<li class="mt20">
							<div class="curri-list-img">
								<img src="${c.subImg4}" alt="" />
							</div>
							<div class="curri-list-text">
								<h5>${c.subTitle4}</h5>
								<p>${c.subDetail4}
								<div class="curri-list-btn">
									<button type="button" onclick="location.href = '<c:url value='/curriculum/sub?s=${c.subTitle4}' />'" class="btn_blue">과정 상세보기</button>
								</div>
							</div>
						</li>
						</c:if>
						<c:if test="${c.subTitle5 != null }">
						<li class="mt20">
							<div class="curri-list-img">
								<img src="${c.subImg5}" alt="" />
							</div>
							<div class="curri-list-text">
								<h5>${c.subTitle5}</h5>
								<p>${c.subDetail5}
								<div class="curri-list-btn">
									<button type="button" onclick="location.href = '<c:url value='/curriculum/sub?s=${c.subTitle5}' />'" class="btn_blue">과정 상세보기</button>
								</div>
							</div>
						</li>
						</c:if>
						<c:if test="${c.subTitle6 != null }">
						<li class="mt20">
							<div class="curri-list-img">
								<img src="${c.subImg6}" alt="" />
							</div>
							<div class="curri-list-text">
								<h5>${c.subTitle6}</h5>
								<p>${c.subDetail6}
								<div class="curri-list-btn">
									<button type="button" onclick="location.href = '<c:url value='/curriculum/sub?s=${c.subTitle6}' />'" class="btn_blue">과정 상세보기</button>
								</div>
							</div>
						</li>
						</c:if>
						<c:if test="${c.subTitle7 != null }">
						<li class="mt20">
							<div class="curri-list-img">
								<img src="${c.subImg7}" alt="" />
							</div>
							<div class="curri-list-text">
								<h5>${c.subTitle7}</h5>
								<p>${c.subDetail7}
								<div class="curri-list-btn">
									<button type="button" onclick="location.href = '<c:url value='/curriculum/sub?s=${c.subTitle7}' />'" class="btn_blue">과정 상세보기</button>
								</div>
							</div>
						</li>
						</c:if>
					</ul>
				</div>
			</article>
			
		</div>
	</main>

	
	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>

</body>
<jsp:include page="../include/footer.jsp" />
</html>