<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/icheck-bootstrap@3.0.1/icheck-bootstrap.min.css" />
   
    <title>WE CODE YOU | 포인트 충전</title>
    <style>
    body{margin: 0; padding: 0;}
    .background-header{width:100%; height:40px;background: #000;}
    .fc-white{color: #fff;}
    .fw-bold{font-weight: bold;}
    .heade-info{
        padding: 7px;
    }
    .stu-name{float: right; font-size: 13px; line-height: 1.8; margin-right: 10px;}
    
	form{padding:20px;}
	
	.radios{
	background: #d8d8d861;
    border-radius: 10px;
    padding: 15px;
	}
	
	.radiostitle{
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 16px;
    padding-bottom: 9px;
    border-bottom: 1px dashed #959595;
	}
	.inputs{
	margin-top: 20px;
	}
	</style>
</head>
<body>

    <div class="header">
        <div class="background-header">
            <div class="heade-info fc-white">
                <span class="fw-bold">포인트 </span> 충전
                <span class="stu-name">WECODEYOU</span>
            </div>
        </div>
    </div>

<form action = "<c:url value = "/pay/gopay"/>" method = "post">
	<div class="radios">
		<div class="radiostitle">
			충전하실 포인트를 선택해주세요.
		</div>
		<div style="line-height: 2.5;">
	  <input type='radio' name='radiop' value='100' style="margin-right: 14px;" checked/>100 P(테스트용) <br>
	  <input type='radio' name='radiop' value='10000' style="margin-right: 14px;"/>10000 P <br>
	  <input type='radio' name='radiop' value='50000' style="margin-right: 14px;"/>50000 P <br>
	  <input type='radio' name='radiop' value='100000' style="margin-right: 14px;"/>100000 P <br>
	  <input type='radio' name='radiop' value='100000' style="margin-right: 14px;"/>200000 P <br>
	  <input type='radio' name='radiop' value='100000' style="margin-right: 14px;"/>300000 P <br>
		</div>
	</div>
	<div class="inputs">
		<div class="radiostitle">
			> 직접입력
		</div>
		<input type = "text" name = "point" style="height: 38px;"> point
	</div>

	
	<button type = "submit" class="btn btn-outline-dark" style="margin-top:15px;">충전하기</button>
	
</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</body>
</html>