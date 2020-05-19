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

		<div class="right-section">
			<div class="right-header">
				<ul class="right-sub-nav">
					<li><a class="active">결제 </a></li>
				</ul>
			</div>
			<div class="right-contents">
				<h4 class="contents-title">선택한 강의</h4>
				<p class="mb10">
					강의 정보 <br>
					썸네일: <img src="${sub_info.spThum}" alt="" /><br>
					계열: ${sub_info.spScope} <br>
					<br>
					강의명: ${pro_info.productName}<br>
					가격: ${pro_info.productPrice}<br>
					<br>
					강사명: ${sub_info.spLecName}<br>
					교재: ${sub_info.spBook}		<br>	
					<br>
	
					<c:if test="${pro_info.productType == 1}">
						<a onclick="open_window()" title="좌석선택" class="btn_red_regi">좌석선택</a>
						<input type="text" value="" name="seat_no" id="get" placeholder="선택하신자리"/>
					</c:if>
					<form action="<c:url value='/purchase/purchase'/>" method="post">
						<input type="hidden" value="" name="seat_no" id="seat_no"/>
						<input type="hidden" name="pro_no" value="${pro_info.productNo}" />
						<input type="hidden" name="pro_price" value="${pro_info.productPrice}" />
						<input type="hidden" name="pro_type" value="${pro_info.productType}" />
						
						<button>결제</button>
					</form>
				</p>
			</div>
		</div>
	</main>


	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>
<script type="text/javascript">
function open_window(){
	window.open("<c:url value='/off/seat?off_no=${pro_info.productNo}'/>","","width=400,height=400,left=500");    
 };
 

</script>

</body>
	<jsp:include page="../include/footer.jsp" />
</html>