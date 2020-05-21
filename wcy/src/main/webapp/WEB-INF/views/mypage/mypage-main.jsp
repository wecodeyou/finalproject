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
<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">





<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">
<link rel="stylesheet" href="<c:url value='/css/mypage.css'/>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/icheck-bootstrap@3.0.1/icheck-bootstrap.min.css" />
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
							<select id="sel_onoff" name="sel_onoff" onchange="change_form()">
								<option value="off" selected="selected">오프라인</option>
								<option value="on">온라인</option>
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
										<div id="off_form">
										<!-- 오프라인 강의 -->
										<c:forEach var="m" items="${mm_list}"> 
										<c:if test="${m.productType == 1}">
										<div class="boxWebzineBorad">
											<div class="webzineLeft">
												<div class="boxwebzineLeftIn">
													<img src="${m.spThum}" alt="" /> 
												</div>
											</div>
											<div class="webzineRight">
												<div class="title">
													[현장강의] ${m.productName}
												</div>
												<a class="rBtn reviewWriteBtn" > <!-- 수강후기 작성 -->
													<c:if test="${m.isWrite == 0}">
														<button class="rBtn reviewWriteBtn" title="수강후기 작성" onclick="open_window(this)" value="${m.productNo}" id="window_btn${m.productNo}">수강후기 작성</button>
													</c:if>
													<c:if test="${m.isWrite == 1}">
														<button class="rBtn reviewWriteBtn" title="" disabled="disabled">가자~ 이미 썼다네~</button>																			
													</c:if>
													<i class="fas fa-angle-right"></i>
												</a>
												<a href="<c:url value='/mypage/recentAct' />" title="수강후기 보기" class="rBtn reviewLookBtn" style="margin-top:50px;"> <!-- 내가 작성한 수강후기 보기 -->
													내가 쓴 수강후기 보기
													<i class="fas fa-angle-right"></i>
												</a>
												<div>
													<table class="myclassInfoTabel">
														<tbody>
															<tr>
																<td class="title">구매일시</td>
																<td style="padding-right:25px;">${m.purchaseDate}
																<td class="title">개강일</td>
																<td>${m.offStartAt}</td>
															</tr>
															<tr>
																<td class="title">지점</td>
																<td>${m.offPlace}</td>
																<td class="title">강의실</td>
																<td>${m.offRoom}</td>
															</tr>
															<tr>
																<td class="title">강사</td>
																<td>${m.spLecName}</td>
																<td class="title"></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="price">
													<div class="normality">
														<div class="productTitle">상품금액</div>
														<span class="productPrice">${m.purchaseAmount}</span>point
													</div>
												</div>
											</div>
										</div>
										
										 <!-- 첫번째 강의 -->
										</c:if>
										</c:forEach>			
										</div>
										
										<div id="on_form" style="display: none;">
										<!-- 온라인 강의 -->
										<c:forEach var="m" items="${mm_list}"> 
										<c:if test="${m.productType == 0}">
										<div class="boxWebzineBorad">
											<div class="webzineLeft">
												<div class="boxwebzineLeftIn">
													<img src="${m.spThum}" alt="" />
												</div>
											</div>
											<div class="webzineRight">
												<div class="title">
													[온라인] ${m.productName}
												</div>
												<a class="rBtn reviewWriteBtn" > <!-- 수강후기 작성 -->
													<button class="rBtn reviewWriteBtn" title="수강후기 작성" onclick="open_window(this)" value="${m.productNo}">수강후기 작성</button>
													<i class="fas fa-angle-right"></i>
												</a>
												<a href="<c:url value='/mypage/recentAct' />" title="수강후기 보기" class="rBtn reviewLookBtn" style="margin-top:50px;"> <!-- 내가 작성한 수강후기 보기 -->
													내가 쓴 수강후기 보기
													<i class="fas fa-angle-right"></i>
												</a>
												<div>
													<table class="myclassInfoTabel">
														<tbody>
															<tr>
																<td class="title">구매일시</td>
																<td style="padding-right:25px;">${m.purchaseDate}
																<td class="title"></td>
																<td></td>
															</tr>
															<tr>
																<td class="title">강사</td>
																<td>${m.spLecName}</td>
																<td class="title"></td>
																<td></td>
															</tr>
															<tr>
																<td class="title"></td>
																<td></td>
																<td class="title"></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="price">
													<div class="normality">
														<div class="productTitle">상품금액</div>
														<span class="productPrice">${m.purchaseAmount}</span>point
													</div>
												</div>
											</div>
										</div> <!-- 첫번째 강의 -->
										</c:if>
										</c:forEach>		
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>	
					
					<script language="javascript" type="text/javascript">


 </script>
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
<script type="text/javascript">

function change_form(){
	
	var Select = document.getElementById("sel_onoff");
	var selectValue = Select.options[Select.selectedIndex].value;
	
	if(selectValue == 'on'){
		document.getElementById("off_form").style.display = "none";
		document.getElementById("on_form").style.display = "block";
	}else{
		document.getElementById("off_form").style.display = "block";
		document.getElementById("on_form").style.display = "none";		
	}
}// 온/오프 변경창 




</script>
<script type="text/javascript">
var open_win;
var p;
function open_window(obj){
	open_win = window.open("<c:url value='/mypage/review?p="+obj.value+"'/>","","width=400,height=350,left=700,top=300");    
};// 수강후기 팝업창 
</script>
</body>
	<jsp:include page="../include/footer.jsp" />
</html>