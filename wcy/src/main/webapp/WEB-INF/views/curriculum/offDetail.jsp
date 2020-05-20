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
	<%-- <jsp:include page="../schedule/ex.jsp" />
	<%-- <%@ include file="../schedule/ex.jsp" %> --%>  
	<%@ include file="../schedule/calendar.jsp" %>  


	<main class="wcy-main-content">
		<div class="wcy-contents">
			<div class="page-width">
				<div class="detail-top"> <!-- detail-top : start  -->
					<div class="detail-top-left">
						<div class="top-left-img">
							<img src="${sub_pro.spThum}" alt="" />
						</div>
						<div class="top-left-info">
							<ul class="info-tag">
								<li class="tag">#C언어</li>
								<li class="tag">#프로그래밍</li>
								<li class="tag">#온라인강의</li>
								<li class="tag">#교재증정</li>
								<li class="tag"><a id = "addtag" href = "javascript:openTag();"><i class="fas fa-plus-circle"></i></a></li>
								<li class="tag" id = "inputtag" style ="display:none;">
								<div>	
									<div id="selectedTagList" ></div>
									<input type = "text" id="text" placeholder="#해시태그">
									<ul class="override" id="resultList"></ul>
										<a href="<c:url value='/tag/searchByBtn'/>">TAG SEARCH by BTN</a> 
									<input type="submit" id="add" value="등록"/>
								</div>
							</ul>
							<p>
								<span class="info-title">강의평점</span>
								<span class="info-content">${avg} 
									<span class="star">
										<span id="avg_star1">★</span> 
										<span id="avg_star2">★</span> 
										<span id="avg_star3">★</span> 
										<span id="avg_star4">★</span> 
										<span id="avg_star5">★</span> 
									</span>
								</span>
							</p>
							<p>
								<span class="info-title">수강후기</span>
								<span class="info-content">${review_num} 건</span>
							</p>
						</div>
					</div>
					<div class="detail-top-right">
						<h1 class="className">[현장강의] ${pro.productName}</h1>
						<table class="top-right-info">
							<tbody>
								<tr>
									<td class="info-title">강사명</td>
									<td class="info-content">${sub_pro.spLecName}</td>
								</tr>
								<tr>
									<td class="info-title">수강료</td>
									<td class="info-content">${pro.productPrice}원</td>									
								</tr>
								<tr>
									<td class="info-title">교재</td>
									<td class="info-content">${sub_pro.spBook}</td>									
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
								<a onclick="logincheck()" title="수강신청" class="btn_red_regi">수강신청</a>
							</div>
							<div class="button-register">
								<a class="modal_open_btn" data-toggle="modal" data-target="#modal2">달력보기</a>
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
						<span class="review-head-red">전체</span> 수강후기<span class="review-head-gray">(${review_num} 건)</span>
					</div>
					<div class="review-wrap">
						<ul class="review-container">
							<c:forEach var="r" items="${review}">
							<script>
							$( document ).ready(function() {
								var es;
								for(var i=0; i<${r.reviewStar}+1; i++){
									es = '#each_star' +${r.reviewNo}+"_"+ i;
									$(es).addClass("on");
								}
								return false;
							});
							</script>
							<li class="review-list">
								<div class="review-list-container">
									<div class="review-star">
										<span class="star">
											<span id="each_star${r.reviewNo}_1">★</span> 
											<span id="each_star${r.reviewNo}_2">★</span> 
											<span id="each_star${r.reviewNo}_3">★</span> 
											<span id="each_star${r.reviewNo}_4">★</span> 
											<span id="each_star${r.reviewNo}_5">★</span> 
										</span> ${r.reviewStar}</div>
									<p class="review-text">
										${r.content}
									</p> 
									<span class="review-classTitle">${pro.productName}</span>
									<!-- <span class="review-teacherName">강사이름</span> -->
									<div class="writer-date">
										<span class="review-writer">김*수</span>
										<span class="review-date">${r.reviewCreatedAt}</span>
									</div>
								</div>
							</li>
							</c:forEach>
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

	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>
	<script src="<c:url value='/js/tag.js'/>"></script>
	


<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>
<script type="text/javascript">

$( document ).ready(function() {
	var s;
	for(var i=0; i<${avg}+1; i++){
		s = '#avg_star' + i;
		$(s).addClass("on");
	}
	return false;
});



function logincheck(){
    if(${login == null}){
    	Swal.fire('로그인 후 좌석선택이 가능합니다.');
    }else{
    	location.href="<c:url value='/curriculum/purchase?pro_no=${pro.productNo}'/>";
    }
       
 };
 

 
 function openTag(){
	 
	 $("#inputtag").show();
	 
 }
 
 $("#add").click(function(){
	 
	 var productInfo = {
				productNo: ${pro.productNo},
				sendTagList: sendTagList
			}
	 
	 $.ajax({
			type: "POST",
			url : "/admin/addtag",
			headers:{
				"Content-Type": "application/json"
			},
			dataType: "text",
			data:JSON.stringify(productInfo),
			success: function(data){
				console.log("received output : " + data);
				if(data === "input_success"){
					console.log("입력완료")
					location.reload();
				}
				
			},
			error: function(request, status, error){
				console.log("POST : /product/register 요청에 실패했습니다.")
			}
		}); /* end ajax */
	 
 });
 
 
 
 
 
</script>

</body>
<jsp:include page="../include/footer.jsp" />
</html>