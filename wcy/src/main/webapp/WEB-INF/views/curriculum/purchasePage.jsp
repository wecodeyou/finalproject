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
<link rel="stylesheet" href="<c:url value='/css/purchase.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<style>
    .star{color: #c0c0c0}
    .star > .on{
        color: red;
    }
</style>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
	integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
	crossorigin="anonymous"></script>



</head>
<body>

	<jsp:include page="../include/header-sub.jsp" />


	<main class="wcy-main-content">
		<div class="wcy-contents">
			<div class="page-width">
				<div class="classplLeftBox"> <!-- 왼쪽 부분 -->
					<div class="classPaymentTitle">
						<div class="title">수강신청 결제</div>
					</div>
					<ul class="classpayList">
						<li class="classpayli">
							<div class="classpayListIn">
								<p class="title">
									<strong>${pro_info.productName}</strong> 
								</p>
								<p class="teacherName">
									<span class="tname01">${sub_info.spLecName}</span>
								</p>
								<div class="classdate">
									<!-- 오프라인의 경우 해당 -->
									<c:if test="${pro_info.productType == 1}">
									<div class="classdate-off">
										<p>
											<span class="dtitle">학원지점</span>
											<span>강남점</span>
										</p>
										<p>
											<span class="dtitle">강의실</span>
											<span>202호</span>
										</p>
										<p>
											<span class="dtitle">개강일</span>
											<span>2020-06-01</span>
										</p>
										<p>
											<span class="dtitle">종강일</span>
											<span>2020-08-01</span>
										</p>
										<p>
											<a onclick="open_window()" title="좌석선택"><span class="dtitle">좌석선택</span></a>
											<span><input type="text" value="" name="seat_no" id="get" placeholder="선택하신자리"/></span>
										</p>
									</div>
									</c:if>
									<!-- 온라인의 경우 해당 -->
									<c:if test="${pro_info.productType == 0}">
									<div class="classdate-on">
										<p>
											<span class="dtitle">수강일</span>
											<span>30일</span>
										</p>
									</div>
									</c:if>
									<div class="payment">
										${pro_info.productPrice}<span class="small">원</span>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div> <!-- 왼쪽부분 -->
				<form action="<c:url value='/purchase/purchase'/>" method="post">
					<input type="hidden" value="" name="seat_no" id="seat_no"/>
					<input type="hidden" name="pro_no" value="${pro_info.productNo}" />
					<input type="hidden" name="pro_price" value="${pro_info.productPrice}" />
					<input type="hidden" name="pro_type" value="${pro_info.productType}" />
						
					<button>결제</button>
				</form>
				<div class="classplRightBox"> <!-- 오른쪽 부분 -->
				
				</div> <!-- 오른쪽 부분 -->
			</div>
		</div>
	</main>
	

	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>
	
	<script type="text/javascript">
	function open_window(){
		window.open("<c:url value='/off/seat?off_no=${pro_info.productNo}'/>","","width=400,height=400,left=500");    
	 };
	 
	
	</script>

</body>
	<jsp:include page="../include/footer.jsp" />
</html>