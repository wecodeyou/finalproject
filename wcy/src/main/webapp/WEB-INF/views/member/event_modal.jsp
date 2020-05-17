<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>

<link rel="stylesheet"
	href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<link rel="stylesheet" href="<c:url value='/css/login-util.css'/>">
<link rel="stylesheet" href="<c:url value='/css/login-main.css'/>">


<script src="https://code.jquery.com/jquery-3.5.0.min.js"
	integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
	crossorigin="anonymous"></script>
<script src="<c:url value = "/resources/js/kakao.js"/>"></script>


<style>
.modal-backdrop {
	z-index: 10000;
}

.modal-backdrop.show {
	opacity: .6;
}

.modal-open {
	overflow: auto;
	/*로그인 모달 open 시, 뒤의 body 스크롤바 없앨건지 보일건지 선택(없앨경우 약간씩 움직임이 생김 ㅠㅠ)*/ .
	modal { overflow-y : hidden;
	overflow-y: auto;
}

}
.modal {
	z-index: 10001;
}

body {
	padding-right: 0 !important;
}

.container-login100-form-btn {
	width: 100% !important;
}


/* 여기부터 제가 추가했지라 */
.body-section {
	width: 840px;
	float: none;
	position: relative;
}

.body-header .body-sub-nav {
	width: 100%;
	background: #f4f4f4;
	border-radius: 5px;
	display: table;
	table-layout: fixed;
	margin-bottom: 50px;
	overflow: hidden;
}

.body-header .body-sub-nav li {
	display: table-cell;
}

.body-header .body-sub-nav li a {
	display: block;
	height: 60px;
	box-sizing: border-box;
	font-size: 18px;
	color: #888;
	padding: 0 0 0 20px;
	line-height: 60px;
	border-bottom: 4px solid #ddd;
}

.body-sub-nav li a.active {
	color: #25283D;
	border-color: #25283D;
	align-content: center;
	align-items: center;
}

.event-ul{
	margin-left: 30px;
    margin-top: 10px;
}

.event-ing{
	width: 65px;
    height: 65px;
    border-radius: 50%;
    display: block;
    background-color: #fcaf17;
    color: #fff;
    line-height: 65px;
    text-align: center;
    font-weight: bold;
}
.event-end{
	width: 65px;
    height: 65px;
    border-radius: 50%;
    display: block;
    background-color: #ccc;
    color: #fff;
    line-height: 65px;
    text-align: center;
    font-weight: bold;
}

.event-condition{
	position: absolute;
    top: 185px;
    left: 140px;
    z-index:2;
}

.event-img{
	display: block;
	margin-bottom: 40px;
}

.event-text > p{
	margin-top: 3px;
    font-size: 12px;
    color: #8a8a8a;
}

.event-img > .event-end-grayscale{
	-webkit-filter: grayscale(100%);
	filter: gray;
	z-index:1;
}

</style>


</head>
<body>

	<div class="modal fade" id="wcy-event-modal">
		<div class="modal-dialog container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-30 p-b-33">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<form class="login100-form validate-form flex-sb flex-w" style="">
					<ul class="event-ul">
						<li style="position: relative; margin-bottom: 20px;">
							<a href="#">
								<p class="event-condition"><span class="event-ing">진행중</span></p>
								<span class="event-img"><img src="<c:url value='/img/commons/event-ing.png'/>"/></span>
							</a>
							<span class="event-text">
								국가기술자격증 합격보장 이벤트
								<p> 2020-05-15 ~ 2020-06-15 </p>
							</span>
						</li>
						<li style="position: relative;">
							<a href="#">
								<p class="event-condition"><span class="event-end">마감</span></p>
								<span class="event-img"><img class="event-end-grayscale" src="<c:url value='/img/commons/event-end.png'/>"/></span>
							</a>
							<span class="event-text">
								2020 자유이용권 이벤트
								<p> 2020-01-01 ~ 2020-03-31 </p>
							</span>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="https://unpkg.com/@popperjs/core@2"></script>

	<!--===============================================================================================-->
	<script src="<c:url value = "/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
	<script src="<c:url value = "/vendor/bootstrap/js/bootstrap.min.js"/>"></script>



	<script>
		(function($) {
			"use strict";

			/*==================================================================
			[ Validate ]*/
			var input = $('.validate-input .input100');

			$('.login100-form-btn').click(function() {
				var check = true;

				for (var i = 0; i < input.length; i++) {
					if (validate(input[i]) == false) {
						showValidate(input[i]);
						check = false;
					}
				}

				return check;
			});

			/*
			$('.validate-form').on('submit',function(){
			    var check = true;

			    for(var i=0; i<input.length; i++) {
			        if(validate(input[i]) == false){
			            showValidate(input[i]);
			            check=false;
			        }
			    }

			    return check;
			});
			 */

			$('.validate-form .input100').each(function() {
				$(this).focus(function() {
					hideValidate(this);
				});
			});

			function validate(input) {
				if ($(input).attr('type') == 'email'
						|| $(input).attr('name') == 'email') {
					if ($(input)
							.val()
							.trim()
							.match(
									/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
						return false;
					}
				} else {
					if ($(input).val().trim() == '') {
						return false;
					}
				}
			}

			function showValidate(input) {
				var thisAlert = $(input).parent();

				$(thisAlert).addClass('alert-validate');
			}

			function hideValidate(input) {
				var thisAlert = $(input).parent();

				$(thisAlert).removeClass('alert-validate');
			}

		})(jQuery);
	</script>




	<script>
		
	</script>



</body>
</html>