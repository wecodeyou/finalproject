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
			<div class="acthistoryLayout"> <!-- 최근활동내역 -->
				<div class="Dtitle">${login.userName}님의 강의실</div>
				<div class="subtitle"> <!-- 수강후기 -->
					<p>온라인 강의</p>
				</div>
				<table class="table_normal">
					<colgroup>
						<col width="20%">
						<col width="*">
						<col width="20%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="line0">날짜</th>
							<th scope="col">상세내역</th>
							<th scope="col">적립/사용</th>
							<th scope="col">구분</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="text-align:center;">2019-01-01</td>
							<td >포인트 충전</td>
							<td style="text-align:center;">+300,000</td>
							<td style="text-align:center;">충전</td>
						</tr>
						<tr>
							<td style="text-align:center;">2019-01-01</td>
							<td >[온라인] 반응형 웹제작 제대로 하기</td>
							<td style="text-align:center;">-140,000</td>
							<td style="text-align:center;">사용</td>
						</tr>
					</tbody>
				</table>
				<div class="subtitle"> <!-- 게시물 -->
					<p>
					<c:choose>
					<c:when test="${login.userType == '0' }">
						구매한 오프라인 강의 목록
					</c:when>
					<c:otherwise>
						나의 오프라인 강의 목록
					</c:otherwise>
					</c:choose>
					</p>
				</div>
				
					<c:choose>
					<c:when test="${login.userType == '0' }">
				<table class="table_normal">
					<colgroup>
						<col width="20%">
						<col width="*">
						<col width="20%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="line0">썸네일</th>
							<th scope="col">강의명</th>
							<th scope="col">상세정보</th>
							<th scope="col">구매 내역</th>
							<th scope="col">상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="off" items="${offList}">
						<tr>
							<td style="text-align:center;">
							<img src="<c:url value = '${off.productThumb}'/>"/>
							</td>
							<td >${off.productName}</td>
							<td style="text-align:center;">
								<button type="button" >상세정보</button>
							</td>
							<td style="text-align:center;">
								<button type="button" >구매정보</button>
							</td>
							<td style="text-align:center;">
								<span></span><button type="button" >입장하기</button>
							</td>
						</tr>					
					</c:forEach>

					</tbody>
				</table>
					</c:when>
					<c:otherwise>
				<table class="table_normal">
					<colgroup>
						<col width="20%">
						<col width="*">
						<col width="20%">
						<col width="15%">

					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="line0">썸네일</th>
							<th scope="col">강의명</th>
							<th scope="col">상세정보</th>
							<th scope="col">개설</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="off" items="${offList}">
						<tr>
							<td style="text-align:center;">
							<img src="<c:url value = '${off.productThumb}'/>"/>
							</td>
							<td >${off.productName}</td>
							<td style="text-align:center;">
								<button type="button" >상세정보</button>
							</td>
							<td style="text-align:center;">
								<button type="button" 
								onclick="location.href = '/session/instructor/lecture/${off.productNo}'">강의시작</button>
							</td>
						</tr>					
					</c:forEach>

					</tbody>
				</table>
					</c:otherwise>
					</c:choose>						

			</div> <!-- 최근활동내역 -->
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


<<<<<<< HEAD
	</table>
	<h2>내 오프라인 강의</h2>
	<c:choose>
		<c:when test="${login.userType == ""}"></c:when>
	</c:choose>
		<table border = 0><tr>
	<th>강의명</th></tr>
	<c:forEach var = "c" items = '${pro_lec_list}' varStatus ="status" >
		<tr>
			<td><a href = "<c:url value = "/episode/?productNo=${c.productNo}"/>">${c.productName}</a></td>			
			<td>${days[status.index]}</td>
		</tr>
	</c:forEach>

	</table>
	
				
				
				
				</div></div></main>
=======
>>>>>>> branch 'master' of https://github.com/wecodeyou/finalproject.git
</body>
	<jsp:include page="../include/footer.jsp" />
</html>