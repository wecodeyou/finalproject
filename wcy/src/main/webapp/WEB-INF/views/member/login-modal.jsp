<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<link rel="stylesheet" href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/vendor/animate/animate.css'/>">
<link rel="stylesheet" href="<c:url value='/vendor/css-hamburgers/hamburgers.min.css'/>">
<link rel="stylesheet" href="<c:url value='/vendor/animsition/css/animsition.min.css'/>">
<link rel="stylesheet" href="<c:url value='/vendor/select2/select2.min.css'/>">
<link rel="stylesheet" href="<c:url value='/vendor/daterangepicker/daterangepicker.css'/>">
<%-- <link rel="stylesheet" href="<c:url value='/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>"> --%>
<link rel="stylesheet" href="<c:url value='/fonts/iconic/css/material-design-iconic-font.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/login-modal-util.css'/>">
<link rel="stylesheet" href="<c:url value='/css/login-modal-main.css'/>">


<title>login</title>
</head>
<body>

	<!-- <div class="limiter" id="wcy-login-modal"> -->
	<div class="modal fade" id="wcy-login-modal">
		<div class="container-login100">
			<div class="wrap-login100" id="modal-content">
				<form class="login100-form validate-form">
                <span class="close" id="modal_close_btn">&times;</span>
                    <div class="wcy-modal-header">
                        <span class="login100-form-title p-b-40">
						  Login
					    </span> 
                    </div>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">Email</span>
						<input class="input100" type="text" name="username" placeholder="Type your Email">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="pass" placeholder="Type your password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div class="text-right p-t-8 p-b-31">
						<a href="#">
							이메일/비밀번호 찾기
						</a>
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>

					<div class="txt1 text-center p-t-40 p-b-12">
						<span>
							Or Sign Up Using
						</span>
					</div>

					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="#" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>

					<div class="flex-col-c p-t-40">
						<span class="txt1 p-b-10">
							Sign Up with WE CODE YOU
						</span>

						<a href="#" class="txt2">
							Sign Up
						</a>
					</div>
				</form>
			</div>
            <div class="modal_layer"></div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
	
	
<script src="<c:url value = "/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value = "/vendor/animsition/js/animsition.min.js"/>"></script>
<script src="<c:url value = "/vendor/bootstrap/js/popper.js"/>"></script>
<script src="<c:url value = "/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value = "/vendor/select2/select2.min.js"/>"></script>
<script src="<c:url value = "/vendor/daterangepicker/moment.min.js"/>"></script>
<script src="<c:url value = "/vendor/daterangepicker/daterangepicker.js"/>"></script>
<script src="<c:url value = "/vendor/countdowntime/countdowntime.js"/>"></script>
<script src="<c:url value = "/js/main.js"/>"></script>

<script>
        var myModal = document.getElementById("myModal");
        var modal_close_btn = document.getElementById("modal_close_btn");
      
      modal_close_btn.onclick = function(){
         myModal.style.display = "none";
      }
       
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == myModal) {
                myModal.style.display = "none";
            }
        }
</script>


</body>
</html>