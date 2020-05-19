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
	#modal-btns {
	display:inline;
		margin-top:25px;
		margin-bottom:14px;
		margin-left:10%;
		padding:0px;
	}
	
</style>


<style>
.modal-backdrop {
	z-index: 100000;
	background-color: rgba(0,0,0,0.5) !important;
}


.modal-backdrop.in {
	z-index: 100000;
	opacity: 0.5 !important;
}

.modal-backdrop.show {
	opacity: 0.6;
}

.modal-open {
	overflow: auto;
	/*로그인 모달 open 시, 뒤의 body 스크롤바 없앨건지 보일건지 선택(없앨경우 약간씩 움직임이 생김 ㅠㅠ)*/ .
	modal { overflow-y : hidden;
	overflow-y: auto;
}

}
.modal {
	z-index: 100001;
	/* margin-top: 180px !important; */
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


</style>


</head>
<body>

	<div class="modal fade" id="wcy-admin-modal">
		<div class="modal-dialog container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-30 p-b-33">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close"><span aria-hidden="true">&times;</span>
				</button>
				
				
				<button type="button" id="change-btn">확인</button>
				
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
	$("#change-btn").click(function() {
			$.ajax({
				type : "POST",
				url : "/member/updateUserType",
				headers : {
					"Content-Type" : "application/json"
				},
				dataType : "text",
				success : function(data) {
					console.log("통신성공 ! result: " + data);
					if (data === "success") {
						console.log("type 강사로 변경");
						alert("변경이 완료되었습니다.");
						self.location="/";
					}
				},
				error : function() {
					console.log("통신실패! ");
					alert("취소되었습니다.");
					self.location="/";
				}
			});
	});
	</script>



</body>
</html>