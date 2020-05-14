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
			<div class="page-width">
				<div class="detail-top"> <!-- detail-top : start  -->
					<div class="detail-top-left">
						<div class="top-left-img">
							<img src="<c:url value='/img/curriculum/network02.jpg'/>" alt="" />
						</div>
						<div class="top-left-info">
							<ul class="info-tag">
								<li class="tag">#C언어</li>
								<li class="tag">#프로그래밍</li>
								<li class="tag">#온라인강의</li>
								<li class="tag">#교재증정</li>
								<li class="tag">#이벤트할인</li>
							</ul>
							<p>
								<span class="info-title">강의평점</span>
								<span class="info-content">5 <span class="star">★ ★ ★ ★ ★</span></span>
							</p>
							<p>
								<span class="info-title">수강후기</span>
								<span class="info-content">100 건</span>
							</p>
						</div>
					</div>
					<div class="detail-top-right">
						<h1 class="className">[현장강의] ${pro.productName}</h1>
						<table class="top-right-info">
							<tbody>
								<tr>
									<td class="info-title">강사명</td>
									<td class="info-content">홍길동</td>
								</tr>
								<tr>
									<td class="info-title">수강료</td>
									<td class="info-content">${pro.productPrice}원</td>									
								</tr>
								<tr>
									<td class="info-title">교재</td>
									<td class="info-content">(Basic) C언어 기본서</td>									
								</tr>
							</tbody>
						</table>
						<div class="top-right-button">
							<div class="button-cart">
								<a href="#" title="카트담기">
									<i class="fa fa-shopping-cart"></i>
									<span class="cart_on">
										<i class="fa fa-shopping-cart"></i>										
									</span>
								</a>
							</div>
							<div class="button-register">
								<a href="#" title="수강신청" class="btn_red_regi">좌석선택</a>
							</div>
						</div>
					</div>
				</div>	<!-- detail-top : end -->		
				
				<div class="detail-contents"> <!-- detail-middle : start -->
					<h4 class="contents-title">과목 설명</h4>
					<div class="contents-text">
						<p class="mb10">
							${pro.productDetail}
						</p>
						<p class="mb10">
							${pro.productDetail}
						</p>
						<p class="mb40">
							${pro.productDetail}
						</p>
					</div>
					<h4 class="contents-title">커리큘럼</h4>
					<div class="contents-text mb40">
						<table class="curri-table">
							<tr>
								<td class="curri-table-title">1차</td>
								<td class="curri-table-content">각 차수에 해당하는 소제목 들어가는 자리</td>
							</tr>
							<tr>
								<td class="curri-table-title">2차</td>
								<td class="curri-table-content">각 차수에 해당하는 소제목 들어가는 자리</td>
							</tr>
							<tr>
								<td class="curri-table-title">3차</td>
								<td class="curri-table-content">각 차수에 해당하는 소제목 들어가는 자리</td>
							</tr>
							<tr>
								<td class="curri-table-title">4차</td>
								<td class="curri-table-content">각 차수에 해당하는 소제목 들어가는 자리</td>
							</tr>
							<tr>
								<td class="curri-table-title">5차</td>
								<td class="curri-table-content">각 차수에 해당하는 소제목 들어가는 자리</td>
							</tr>
							<tr>
								<td class="curri-table-title">6차</td>
								<td class="curri-table-content">각 차수에 해당하는 소제목 들어가는 자리</td>
							</tr>
							<tr>
								<td class="curri-table-title">7차</td>
								<td class="curri-table-content">각 차수에 해당하는 소제목 들어가는 자리</td>
							</tr>
							<tr>
								<td class="curri-table-title">8차</td>
								<td class="curri-table-content">각 차수에 해당하는 소제목 들어가는 자리</td>
							</tr>
						</table>
					</div>
				</div> <!-- detail-middle : end -->
				<div class="detail-bottom"> <!-- detail-bottom : start -->
					<h4 class="contents-title">수강생들의 <span style="font-weight: bold">리얼후기</span></h4>
					<div class="review-head">
						<span class="review-head-red">전체</span> 수강후기<span class="review-head-gray">(100건)</span>
					</div>
					<div class="review-wrap">
						<ul class="review-container">
							<li class="review-list">
								<div class="review-list-container">
									<span class="review-title">수강후기 제목 들어갈 자리</span>
									<div class="review-star"><span class="star">★ ★ ★ ★ ★</span> 5</div>
									<p class="review-text">
										수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다.
										수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다.
										수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다.
									</p> 
									<span class="review-classTitle">수강한 과목명</span>
									<span class="review-teacherName">강사이름</span>
									<div class="writer-date">
										<span class="review-writer">김*수</span>
										<span class="review-date">2020.05.12</span>
									</div>
								</div>
							</li>
							<li class="review-list">
								<div class="review-list-container">
									<span class="review-title">수강후기 제목 들어갈 자리</span>
									<div class="review-star"><span class="star">★ ★ ★ ★ ★</span> 5</div>
									<p class="review-text">
										수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다.
										수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다.
										수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다.
									</p>
									<span class="review-classTitle">수강한 과목명</span>
									<span class="review-teacherName">강사이름</span>
									<div class="writer-date">
										<span class="review-writer">김*수</span>
										<span class="review-date">2020.05.12</span>
									</div>
								</div>
							</li>
							<li class="review-list">
								<div class="review-list-container">
									<span class="review-title">수강후기 제목 들어갈 자리</span>
									<div class="review-star"><span class="star">★ ★ ★ ★ ★</span> 5</div>
									<p class="review-text">
										수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다.
										수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다.
										수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다. 수강 후기 text가 들어갈 자리입니다.
									</p>
									<span class="review-classTitle">수강한 과목명</span>
									<span class="review-teacherName">강사이름</span>
									<div class="writer-date">
										<span class="review-writer">김*수</span>
										<span class="review-date">2020.05.12</span>
									</div>
								</div>
							</li>
						</ul>
						<div class="pageNavi">
							<ul>
								<li></li>
							</ul>
						</div>
					</div>
				</div> <!-- detail-bottom : end -->
			
			</div>
		</div>
	</main>

	<jsp:include page="../include/footer.jsp" />








	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>

</body>
</html>