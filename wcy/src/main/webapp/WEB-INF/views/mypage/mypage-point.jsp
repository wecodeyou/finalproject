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

p {
	line-height: 150% !important;
}
</style>

</head>
<body>

	<jsp:include page="../include/header-sub.jsp" />


	<main class="wcy-main-content">
		<div class="left-section">
			<h2>MyPage</h2>
			<ul class="left-sub-nav">
				<li><a href="<c:url value='/mypage/myinfoChange' />">내 정보</a></li>
				<li><a href="<c:url value='/mypage/leclist?type=on' />">수강 목록</a></li>
				<li><a class="active" href="<c:url value='/mypage/pointInfo' />">내 포인트</a></li>
				<li><a href="<c:url value='/mypage/recentAct' />">최근 활동</a></li>
				<li><a href="<c:url value='/mypage/mylec' />">내 강의실</a></li>
			</ul>
		</div>

		<div class="right-section">
			<div class="right-header">
				<ul class="right-sub-nav">
					<li><a class="active"> 내 포인트 </a></li>
				</ul>
			</div>
			<div class="right-contents">
				<h4 class="contents-title"><h1>${login.userName}님  <a href="<c:url value='/mypage/myinfoChange' />"><button>MY ></button></a></h1></h4>
				<p class="mb10">

<br>
<br>
<form action = "<c:url value = "/pay/gopay"/>" method = "post">

구매할 포인트
<input type = "text" name = "point">
<br>
<br>
 라디오 버튼<br>
  <input type='radio' name='radiop' value='100' />100P(테스트용)
  <input type='radio' name='radiop' value='10000' />10000P
  <input type='radio' name='radiop' value='50000' />50000P
  <input type='radio' name='radiop' value='100000' />100000P

<input type = "submit" value = "구매하기">
</form>
<br>
<br>
<H2>사용 가능 코드머니	${login.userPoint}</H2>

코드 머니 충전&amp;사용 내역<br>
<hr>

조회기간 <button>1개월</button><button>3개월</button><button>6개월</button><button>1년</button>
<input type="text" name="s_date" value="2020-02-04" id="s_date" class="format_date hasDatepicker" size="10">
 ~ <input type="text" name="s_date" value="2020-02-04" id="s_date" class="format_date hasDatepicker" size="10">

<a href="#"><button>조회</button></a><br>




포인트를 바로 충전 가능하게 
라디오 버튼 형식으로 금액 선택 
결제 방법: 무통장, 카카오, 카드 등<br>	
<a href="#"><button>충전</button></a>  <br> 
				

				</p>
			</div>
		</div>
	</main>


	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>

<c:if test="${login == null}">
	<script>   
	   alert("로그인이 필요한 서비스입니다.");
	   location.href="<c:url value='/' />";
	</script>
</c:if>	

</body>
	<jsp:include page="../include/footer.jsp" />
</html>