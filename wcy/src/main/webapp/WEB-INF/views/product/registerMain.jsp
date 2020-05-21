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
	
<link rel="stylesheet" href="<c:url value='/css/registerMain.css'/>">
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">
<link rel="stylesheet" href="<c:url value='/css/tag-modal.css'/>">
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<style>
    .thum_upload {height:100px;padding: 12%;}
    
    .thum_input {margin: 43px 0px 0 161px;}
    
    .tag_input_div {margin: 54px 0px 0 -6px;}
    
    .tag_input{margin: -67px 0px 0 161px;display: inline-grid;}
    
    .product_name { width: 389px;height: 41px;margin-left: 13px;padding: 3px 0px 0px 7px; margin-bottom: -4px; font-size:17px;}
    
    .input_off { width: 389px;height: 41px;margin-left: 13px;padding: 3px 0px 0px 7px; margin-bottom: -4px; font-size:17px;}
    
   	.info-title{font-weight:bold !important; }
   	
   	p{line-height: 150% !important;}
    
    .center-header .center-sub-nav-p {width: 100%; background: #f4f4f4; border-radius: 5px; display: table; table-layout: fixed; margin-top: 20px; margin-bottom: 50px; overflow: hidden;}
    .center-header .center-sub-nav-p li{display: table-cell;}
    .center-header .center-sub-nav-p li a{display: block; height: 60px; box-sizing: border-box; font-size: 18px; color: #888; padding: 0 0 0 20px; line-height: 60px; border-bottom: 4px solid #ddd;}
    .center-sub-nav-p li a.active{color: #25283D; border-color: #25283D;}

	#adminUser {
		display:none;
	}
	#adminProduct {
		display:none;
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
	<%-- <%@ include file="../schedule/calendar.jsp" %>  --%> 


	<main class="wcy-main-content">
		<div class="wcy-contents">
			<div class="page-width">
			<div class="center-header">
					<ul class="center-sub-nav-p">
						<li><a href="javascript:showOffForm();"class="active">현장 강의 등록</a></li>
						<li><a href="javascript:showOnForm();" >온라인 강의 등록</a></li>
					</ul>
			</div>
			
<!-- 첫번째 네비 li 클릭 시 -->
			<div id="offForm">
				<h4 class="contents-title" style="text-align:left;">현장 강의 등록</h4>
					<div class="detail-top"> 
						<div class="detail-top-left">
<!-- 썸네일 박스 시작 -->
						<div class="mypageInfoCuponLayout2">
							<div class="myinfocuponIn2">
								<div class="myInfoBox2">
									<div class="mb10">
										<span class="fs35b" style="font-size:35px; font-weight:bold;">&nbsp;썸네일</span>
									</div>
									<i class="fas fa-images"></i>&nbsp;등록!
								</div>
<!-- 썸네일 업로드 시작 -->
								<div class="thum_input">
									<input type="file" />
								</div>
							</div>
						</div> 
<!-- 썸네일 업로드 끝-->
<!-- 썸네일 박스 끝 -->


<!-- 태그 박스 시작-->
						<div class="mypageInfoCuponLayout2">
							<div class="myinfocuponIn2">
								<div class="myInfoBox2">
									<div class="mb10">
										<span class="fs35b" style="font-size:35px; font-weight:bold; ">해시태그</span>
									</div>
									<i class="fas fa-tags"></i>&nbsp;등록!
								</div>
							
							
								<div class="tag_input_div">
									<div class="tag_input">
										<input type = "text" id="text" style="margin-top:5px;width:230px;font-size:16px;padding-left: 5px;"placeholder="#해시태그">
										<ul class="override" id="resultList"></ul>
									</div>
								</div>
							</div>
						</div>
<!-- 태그 박스 끝 -->
						<br>
<!-- selectedTagList 시작 -->
						<div id="selectedTagList" ></div>
<!-- selectedTagList 끝 -->
						
					</div>
					<div class="detail-top-right">		 						
						<h1 class="className">강의명: <input type="text" name="" class="product_name" placeholder="[현장강의]"/></h1>
						<table class="top-right-info" style="margin-left: 33px !important;">
							<tbody>
								<tr>
									<td class="info-title">지점</td><!-- off_course 테이블의 off_place -->
									<td class="info-content">
										종로점&nbsp;<input type="checkbox" id="" name="종로점">
										강남점&nbsp;<input type="checkbox" id="" name="강남점">
										<input type="hidden" name="productType" value="1"/><!-- offline productType = 1 -->	
									</td>
								</tr>
								<tr>
									<td class="info-title">강의실</td><!-- off_course 테이블의 off_room -->
									<td class="info-content"><input type="text" name="" id="" class="input_off"/></td>									
								</tr>
								<tr>
									<td class="info-title">개강 날짜</td><!-- off_course 테이블의 off_start_at -->
									<td class="info-content"><input type="text" name="" id="" class="input_off"/></td>									
								</tr>
								<tr>
									<td class="info-title">종강 날짜</td><!-- off_course 테이블의 off_end_at -->
									<td class="info-content"><input type="text" name="" id="" class="input_off"/></td>									
								</tr>
								<tr>
									<td class="info-title">강사명</td><!-- sub_product 테이블의 sp_lec_name -->
									<td class="info-content"><input type="text" name="" id="" class="input_off"/></td>
								</tr>
								<tr>
									<td class="info-title">수강료</td><!-- product 테이블의  product_price-->
									<td class="info-content"><input type="text" name="" id="" class="input_off"/></td>									
								</tr>
								<tr>
									<td class="info-title">교재</td>
									<td class="info-content"><input type="text" name="" id="" class="input_off"/></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>	<!-- detail-top : end -->		
				
				<div class="detail-contents" style="margin-top: 24px !important;"> <!-- detail-middle : start -->
					<h4 class="contents-title">과목 설명</h4>
					<div class="contents-text">
						<p class="mb10">
							<textarea class="form-control" rows="8" id="예시 product_detail"></textarea>
						</p>
						<button type="button" id="post-reply" 
								class="btn-sm btn-outline-default" style="float: right; margin-top:3px !important; background:white; color:gray;border:0.7px solid gray; ">
<!-- 전체 등록 버튼 -->            등록<i class="far fa-check-circle"></i></button>
					</div>
				</div> <!-- detail-middle : end -->
				<div class="detail-bottom"> <!-- detail-bottom : start -->
					
					
				</div> <!-- detail-bottom : end -->
			</div>
<!-- 첫번째 li 끝 -->
			
<!-- 두번째 네비 li 클릭 시 -->
			<div id="onForm">
				<h4 class="contents-title" style="text-align:left;">온라인 강의 등록</h4>
					<div class="detail-top"> 
						<div class="detail-top-left">
<!-- 썸네일 박스 시작 -->
						<div class="mypageInfoCuponLayout2">
							<div class="myinfocuponIn2">
								<div class="myInfoBox2">
									<div class="mb10">
										<span class="fs35b" style="font-size:35px; font-weight:bold;">&nbsp;썸네일</span>
									</div>
									<i class="fas fa-images"></i>&nbsp;등록!
								</div>
<!-- 썸네일 업로드 시작 -->
								<div class="thum_input">
									<input type="file" />
								</div>
							</div>
						</div> 
<!-- 썸네일 업로드 끝-->
<!-- 썸네일 박스 끝 -->


<!-- 태그 박스 시작-->
						<div class="mypageInfoCuponLayout2">
							<div class="myinfocuponIn2">
								<div class="myInfoBox2">
									<div class="mb10">
										<span class="fs35b" style="font-size:35px; font-weight:bold; ">해시태그</span>
									</div>
									<i class="fas fa-tags"></i>&nbsp;등록!
								</div>
							
							
								<div class="tag_input_div">
									<div class="tag_input">
										<input type = "text" id="text" style="margin-top:5px;width:230px;font-size:16px;padding-left: 5px;"placeholder="#해시태그">
										<ul class="override" id="resultList"></ul>
									</div>
								</div>
							</div>
						</div>
<!-- 태그 박스 끝 -->
						<br>
<!-- selectedTagList 시작 -->
						<div id="selectedTagList" ></div>
<!-- selectedTagList 끝 -->
						
					</div>
					<div class="detail-top-right">						
						<h1 class="className">강의명: <input type="text" name="" id="" class="product_name" placeholder="[온라인강의]"/></h1>
						<table class="top-right-info" style="margin-left: 33px !important;">
							<tbody>
								<tr>
									<td class="info-title">강사명</td>
									<td class="info-content">
										<input type="text" name="" id="" class="input_off"/>
										<input type="hidden" name="productType" value="0"/><!-- online productType = 1 -->	
									</td>
								</tr>
								<tr>
									<td class="info-title">수강료</td>
									<td class="info-content"><input type="text" name="" id="" class="input_off"/></td>									
								</tr>
								<tr>
									<td class="info-title">교재</td>
									<td class="info-content"><input type="text" name="" id="" class="input_off"/></td>									
								</tr>
							</tbody>
						</table>
					</div>
				</div>	<!-- detail-top : end -->		
				
				<div class="detail-contents" style="margin-top: 24px !important;"> <!-- detail-middle : start -->
					<h4 class="contents-title">과목 설명</h4>
					<div class="contents-text">
						<p class="mb10">
							<textarea class="form-control" rows="8" id="예시 product_detail"></textarea>
						</p>
						<button type="button" id="=" 
								class="btn-sm btn-outline-default" style="float: right; margin-top:3px !important; background:white; color:gray;border:0.7px solid gray; ">
<!-- 전체 등록 버튼 -->            등록<i class="far fa-check-circle"></i></button>
					</div>
				</div> <!-- detail-middle : end -->
				<div class="detail-bottom"> <!-- detail-bottom : start -->
					
					
				</div> <!-- detail-bottom : end -->
			</div>
<!-- 두번째 li 끝 -->

			</div>
		</div>
	</main>

	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>
	<script src="<c:url value='/js/tag.js'/>"></script>
	


<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>



<script>

	<!-- input창에 [현장강의] 추가하기 -->
	/* $(document).ready(function() {
		document.getElementById("offName").value = "[현장강의]";
		document.getElementById("onName").value = "[온라인강의]";
	}); */

	
	<!-- li 클릭으로 온/오프 폼 변경하기 -->
	var sBtn = $(".center-sub-nav-p > li"); //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
	$(function() {
		sBtn.find("a").click(function() { // sBtn에 속해 있는  a 찾아 클릭 하면.
			sBtn.find("a").removeClass("active"); // sBtn 속에 (active) 클래스를 삭제 한다.
			$(this).addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
		});
	});

	function showOffForm() {
		$('#offForm').show();
		$('#onForm').hide();
	}

	function showOnForm() {
		$('#onForm').show();
		$('#offForm').hide();
	}
</script>


<!-- tag -->
<script>
//sendTagList: sendTagList 로 받아서 아작스로 보내세요

</script>

</body>
<jsp:include page="../include/footer.jsp" />
</html>