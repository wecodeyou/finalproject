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


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/icheck-bootstrap@3.0.1/icheck-bootstrap.min.css" />
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">
<link rel="stylesheet" href="<c:url value='/css/purchase.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.css" />

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<style>
    .page-width-purchase{width:1100px; margin:0 auto; display:inline-flex;}


</style>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
	integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
	crossorigin="anonymous"></script>



</head>
<body>

	<jsp:include page="../include/header-sub.jsp" />


	<main class="wcy-main-content">
		<div class="wcy-contents">
			<div class="page-width-purchase">
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
								<p class="teachername">
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
												<a onclick="open_window()" title="좌석선택"><span class="stitle seatchoiceBtn">좌석선택</span></a>
												<span><input type="text" value="" name="seat_no" id="get" placeholder="선택좌석" readonly
														style="border:0px;color:#FF5722;font-size:16px;font-weight:600;"/></span>
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
										${pro_info.productPrice}<span class="small">point</span>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<div class="refundLayout">
						<div class="title">강의 환불/변경 규정 안내</div>
						<div class="text">
							<p class="mb20">환불 안내</p>
							개강일이 지난 이후에는 온라인/전화상담을 통한 환불이 불가하며, 학원 방문 후 환불 신청이 가능 합니다. <br>
							개강 후 과목군에 따라 등록인원이 3~4명 이하일 경우 폐반의 가능성이 있습니다. <br>
							수강료 전액환불은 개강일 전까지만 가능합니다. <br>
							개강 후 환불은 학원 설립, 운영 및 과외학습에 관한 법률에 의거하여 총 교습시간의 1/3 경과 전까지는 2/3 환불, 1/2 경과 전까지는 1/2 환불해 드리며,1/2 경과 후에는환불 불가합니다.<br><br>
							[온라인 현장강의]<br>
							진도율 기준으로 1/3 수강 전 까지는 2/3 환불, 1/2 수강 전 까지는 1/2를 환불해 드리며 1/2 경과 후에는 환불 불가합니다.<br>
							* 진도율에 상관 없이 수업일 기준 1/2 시점이 지난 이후에는 환불이 불가합니다.<br>
							* 개강일이 지난 후 온라인 현장강의 상품의 환불은 학원 방문을 통해서만 가능합니다. (온라인 공제환불 불가)<br>
							수업 일수별 환불은 진행되지 않습니다.<br><br>
						</div>
						<div class="refundchkBox checkbox icheck-alizarin">
							<input type="checkBox" title="위 환불, 변경 규정 안내를 확인하였습니다." id="refundchk">
							<label for="refundchk"><span style="font-size: 14px;">위 환불, 변경 규정 안내를 확인하였습니다.</span></label>
						</div>
					</div>
				</div> <!-- 왼쪽부분 -->
				<div class="classplRightBox"> <!-- 오른쪽 부분 : 수강생 정보-->
					<div class="crSection01">
						<div class="crtitle">수강생 정보</div>
						<div class="crContent">
							<p class="crcName">${login.userName}</p>
							<p class="crcTel">${login.userTel}</p>
							<p class="crcEmail">${login.userEmail}</p>
						</div>
						<div class="crSection02">
							<div class="crtitle">내 포인트</div>
							<div class="crContent">
								<p class="crcName">${login.userPoint}<span class="small">point</span></p>
								<button class="btn btn-outline-warning" style="width: 90px;height: 30px;font-size: 13px;letter-spacing: -1.5px;margin-bottom: 10px;margin-right: 14px;">포인트 충전</button>
							</div>
						</div>
						<div class="crSection04">
							<div class="crtitle">결제 금액</div>
							<div class="crContent">
								<p class="crcName">${pro_info.productPrice}<span class="small">point</span></p>
							</div>
						</div>
						<div class="crSection05">
							<form action="<c:url value='/purchase/purchase'/>" method="post">
								<input type="hidden" value="" name="seat_no" id="seat_no"/>
								<input type="hidden" name="pro_no" value="${pro_info.productNo}" />
								<input type="hidden" name="pro_price" value="${pro_info.productPrice}" />
								<input type="hidden" name="pro_type" value="${pro_info.productType}" />
									
								<button class="btn btn-danger" style="width: 100%;height: 50px;">수강신청 결제하기 ></button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	

	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>
	
	<script type="text/javascript">
	function open_window(){
		window.open("<c:url value='/off/seat?off_no=${pro_info.productNo}'/>","","width=302,height=340,left=500,top=150");    
	 };
	 
	 
	 function seatChk(){
		    var Form = document.getElementById('submit');
		    var seat = document.getElementById('seat_no').value;
		    
		    if(seat == null || seat == ""){
		        alert("좌석 선택해주세요.")
		    }else{
		        Form.submit();
		    }
		}
	</script>

</body>
	<jsp:include page="../include/footer.jsp" />
</html>