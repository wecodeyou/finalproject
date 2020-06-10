<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- 파비콘 적용 -->
<link rel="shortcut icon"
	href="<c:url value='/img/favicon/wcy-favicon.ico'/>">
	
<link rel="stylesheet" href="<c:url value='/css/registerMain.css'/>">
<link rel="stylesheet" href="<c:url value='/css/tag-on.css'/>">
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">
<link rel="stylesheet" href="<c:url value='/css/tag-modal.css'/>">
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<style>
    .thum_upload {height:100px;padding: 12%;}
    
    .thum_input {margin: 43px 0px 0 161px;}
    
    .tag_input_div {margin: 54px 0px 0 -6px;}
    
    .tag_input{margin: -67px 0px 0 161px;display: inline-grid;}
    
    .product_name { width: 389px;height: 41px;margin-left: 13px;padding: 3px 0px 0px 7px; margin-bottom: -4px; font-size:17px;}
    
    .input_off {width: 370px; height: 34px;margin-left: 0px;padding:4px 16px 4px 6px; margin-bottom: 7px;margin-top: 9px;font-size: 17px;}
    
   	.info-title{font-weight:bold !important; }
   	
   	p{line-height: 150% !important;}
    
    .center-header .center-sub-nav-p {width: 100%; background: #f4f4f4; border-radius: 5px; display: table; table-layout: fixed; margin-top: 20px; margin-bottom: 50px; overflow: hidden;}
    .center-header .center-sub-nav-p li{display: table-cell;}
    .center-header .center-sub-nav-p li a{display: block; height: 60px; box-sizing: border-box; font-size: 18px; color: #888; padding: 0 0 0 20px; line-height: 60px; border-bottom: 4px solid #ddd;}
    .center-sub-nav-p li a.active{color: #25283D; border-color: #25283D;}

	#offForm {
		/* display:none; */
	}
	#onForm {
		display:none;
	}
	
	.btnTag {
		margin: 5px !important;
    	margin-top: 3px !important;
    	background-color: whitesmoke !important;
   	 	color: black !important;
    	opacity: 0.8 !important;
    	border: 1px solid lightslategray !important;
    	border-radius: 17px !important;
    	padding: 6px 8px 5px 12px !important;
    	cursor: pointer !important;
    	text-align: right !important;
    	font-size: 14px !important;
	}
	
	.btnTag:hover {
		background-color: #c4e0f6 !important;
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
				<h1 style="text-align:left; font-size: 30px; font-weight: 700;">온라인강의 - 회차 등록</h1>
				<form action = "/on/addepisode" method = "post" style="margin-top: 30px;">
				<input type = "hidden" name = "productNo" value = "${product.productNo}">
				<table border = "2" width = 70% align = "center" style="font-size: 17px;line-height: 2.0;">
				
					<tr>
						<td>상품번호</td><td>${product.productNo}</td></tr>
						<tr>
						<td>상품명</td><td>${product.productName}</td></tr>
						
						<tr><td>강사명</td><td>${login.userEmail}</td></tr>
				
						<tr><td>회차수</td><td><input type = "number" name = "rowNum" id = "rowNum" required>
							<input name="addButton" type="button" style="cursor:pointer;     height: 26px;line-height: 0.1;" onClick="insertRow()" value="추가" class="btn btn-outline-dark" ></td></tr>
						<tr><td colspan =2>  
						<table id="addTable" border = 0>
				
				          </table>
				          </td>
						<tr><td colspan = 2 align = "right"><button type = "submit" class="btn btn-outline-warning" style="margin-top: 20px;margin-right">등록하기</button></td>
				</table>
				</form>
			
			
			</div>
		</div>
	</main>
	
	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>
	<script src="<c:url value='/js/tag.js'/>"></script>
	


<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>


<script type = "text/javascript">

	function insertRow(){
		
		var rowNum = document.getElementById("rowNum").value;

		for (let i = 0; i < rowNum;i++){
			
				insRow();
			}
	}

	
	//Row 추가	
	function insRow() {
		var oTbl = document.getElementById("addTable");
		var oRow = oTbl.insertRow();
		//oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
		var oCell = oRow.insertCell();
		var oCell2 = oRow.insertCell();
		//삽입될 Form Tag
		var frmTag  = "강좌명<input type=text name=episodeName style=width:400px;>";
		var frmTag2 = "강좌경로<input type=text name=episodeSource value=/resources/vendor/videos/ style=width:400px;>"
	/* 	frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>"; */
		oCell.innerHTML = frmTag;
		oCell2.innerHTML = frmTag2;
	}


</script>

</body>
	<jsp:include page="../include/footer.jsp" />
</html>