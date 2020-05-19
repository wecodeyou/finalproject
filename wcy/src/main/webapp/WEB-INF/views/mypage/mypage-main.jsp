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
<link rel="stylesheet" href="<c:url value='/css/mypage.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<style>
	html,body{height:100%;}
</style>
</head>
<body>

<jsp:include page="../include/header-sub.jsp" />


	<main class="wcy-main-content">
		<div class="wcy-contents">
			<!-- 최상단 박스 -->
			<div class="mypageInfoCuponLayout">
				<div class="myinfocuponIn">
					<div class="myInfoBox">
						<div class="mb10">
							<span class="fs35b" style="font-size:35px; font-weight:bold;">${login.userName}</span>님,
						</div>
						안녕하세요!
						<a href="<c:url value='/mypage/myinfoChange' />"><i class="fas fa-cog"></i>회원정보 수정</a>
					</div>
					<ul class="myCuponBox">
						<li class="list01">
							<div class="mycuboxIn">
								<a href="<c:url value='/mypage/pointInfo' />">
									<i class="fas fa-coins"></i>
									<div class="textBox">
										<span class="moneyText">WCY Point</span>
										<div class="moneyBox">
											<span class="money">${login.userPoint}</span>Point
										</div>
									</div>
								</a>
							</div>
						</li>
						<li class="list02">
							<div class="mycuboxIn">
								<a href="<c:url value='/mypage/recentAct' />">
									<i class="fas fa-clipboard-list"></i>
									<div class="textBox">
										<span class="moneyText">최근활동</span>
										<div class="moneyBox">
											모두보기
										</div>
									</div>
								</a>
							</div>
						</li>
						<li class="list03">
							<div class="mycuboxIn">
								<a href="<c:url value='/mypage/mylec' />">
									<i class="fas fa-chalkboard-teacher"></i>
									<div class="textBox">
										<span class="moneyText">내 강의실</span>
										<div class="moneyBox">
											입장하기
										</div>
									</div>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div> <!-- 최상단 박스 -->
			<!-- 수강목록 -->
			<div class="mypageClassSection">
				<div class="titleBox">
					<div class="title">수강신청 목록</div>
					<div class="selectric-wrapper">
						<div class="selectric-hide-select">
							<select id="sel_onoff" name="sel_onoff">
								<option value="온라인" selected="selected">온라인</option>
								<option value="오프라인">오프라인</option>
							</select>
						</div>
					</div>
					<a href="#" class="addBtn" title="더보기">+</a>
					</div>
					<div class="classviewList classlectureList listLayout">
						<div class="registerListLayout">
							<ul class="registerListIn">
								<li>
									<div class="boxWebzineBoradLayout">
										<!-- 첫번째 강의 -->
										<div class="boxWebzineBorad">
											<div class="webzineLeft">
												<div class="boxwebzineLeftIn">
													<img src="<c:url value='/img/mypage/mypageleclist.PNG'/>" alt="" />
												</div>
											</div>
											<div class="webzineRight">
												<div class="title">
													[온라인] 초보자를 위한 정보 보안및 해킹 방어 개론
												</div>
												<a href="#" title="수강후기  작성" class="rBtn reviewWriteBtn"> <!-- 수강후기 작성 -->
													수강후기 작성
													<i class="fas fa-angle-right"></i>
												</a>
												<a href="#" title="수강후기 보기" class="rBtn reviewLookBtn" style="margin-top:50px;"> <!-- 내가 작성한 수강후기 보기 -->
													내가 쓴 수강후기 보기
													<i class="fas fa-angle-right"></i>
												</a>
												<div>
													<table class="myclassInfoTabel">
														<tbody>
															<tr>
																<td class="title">구매일시</td>
																<td style="padding-right:25px;">2019.09
																<td class="title">개강일</td>
																<td>2019.10.01</td>
															</tr>
															<tr>
																<td class="title">지점</td>
																<td>강남점</td>
																<td class="title">강의시간</td>
																<td>14:00~15:30</td>
															</tr>
															<tr>
																<td class="title">강사</td>
																<td>김길동</td>
																<td class="title">강의실</td>
																<td>502호</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="price">
													<div class="normality">
														<div class="productTitle">상품금액</div>
														<span class="productPrice">142,000</span>원
													</div>
												</div>
											</div>
										</div> <!-- 첫번째 강의 -->
										<!-- 두번째 강의 -->
										<div class="boxWebzineBorad">
											<div class="webzineLeft">
												<div class="boxwebzineLeftIn">
													<img src="<c:url value='/img/mypage/mypageleclist.PNG'/>" alt="" />
												</div>
											</div>
											<div class="webzineRight">
												<div class="title">
													[온라인] 초보자를 위한 정보 보안및 해킹 방어 개론
												</div>
												<a href="#" title="수강후기  작성" class="rBtn reviewWriteBtn"> <!-- 수강후기 작성 -->
													수강후기 작성
													<i class="fas fa-angle-right"></i>
												</a>
												<a href="#" title="수강후기 보기" class="rBtn reviewLookBtn" style="margin-top:50px;"> <!-- 내가 작성한 수강후기 보기 -->
													내가 쓴 수강후기 보기
													<i class="fas fa-angle-right"></i>
												</a>
												<div>
													<table class="myclassInfoTabel">
														<tbody>
															<tr>
																<td class="title">구매일시</td>
																<td style="padding-right:25px;">2019.09
																<td class="title">개강일</td>
																<td>2019.10.01</td>
															</tr>
															<tr>
																<td class="title">지점</td>
																<td>강남점</td>
																<td class="title">강의시간</td>
																<td>14:00~15:30</td>
															</tr>
															<tr>
																<td class="title">강사</td>
																<td>김길동</td>
																<td class="title">강의실</td>
																<td>502호</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="price">
													<div class="normality">
														<div class="productTitle">상품금액</div>
														<span class="productPrice">142,000</span>원
													</div>
												</div>
											</div>
										</div> <!-- 두번째 강의 -->
										<!-- 세번째 강의 -->
										<div class="boxWebzineBorad">
											<div class="webzineLeft">
												<div class="boxwebzineLeftIn">
													<img src="<c:url value='/img/mypage/mypageleclist.PNG'/>" alt="" />
												</div>
											</div>
											<div class="webzineRight">
												<div class="title">
													[온라인] 초보자를 위한 정보 보안및 해킹 방어 개론
												</div>
												<a href="#" title="수강후기  작성" class="rBtn reviewWriteBtn"> <!-- 수강후기 작성 -->
													수강후기 작성
													<i class="fas fa-angle-right"></i>
												</a>
												<a href="#" title="수강후기 보기" class="rBtn reviewLookBtn" style="margin-top:50px;"> <!-- 내가 작성한 수강후기 보기 -->
													내가 쓴 수강후기 보기
													<i class="fas fa-angle-right"></i>
												</a>
												<div>
													<table class="myclassInfoTabel">
														<tbody>
															<tr>
																<td class="title">구매일시</td>
																<td style="padding-right:25px;">2019.09
																<td class="title">개강일</td>
																<td>2019.10.01</td>
															</tr>
															<tr>
																<td class="title">지점</td>
																<td>강남점</td>
																<td class="title">강의시간</td>
																<td>14:00~15:30</td>
															</tr>
															<tr>
																<td class="title">강사</td>
																<td>김길동</td>
																<td class="title">강의실</td>
																<td>502호</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="price">
													<div class="normality">
														<div class="productTitle">상품금액</div>
														<span class="productPrice">142,000</span>원
													</div>
												</div>
											</div>
										</div> <!-- 세번째 강의 -->
										
									</div>
								</li>
							</ul>
						</div>
					</div>
			</div> <!-- 수강목록 -->
		</div>
	</main>

   <script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
   <script src="<c:url value = "/js/main.js"/>"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>

<c:if test="${login == null}">
   <script>   
   	  Swal.fire('로그인이 필요한 서비스입니다.');
      location.href="<c:url value='/' />";
   </script>
</c:if>


</body>
	<jsp:include page="../include/footer.jsp" />
</html>