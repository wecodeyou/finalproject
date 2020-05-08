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


<title>loginnn</title>
<script src="<c:url value = "/resources/js/kakao.js"/>"></script>
</head>
<body>


<!-- 로그인 모달 -->
   <!-- <div class="limiter" id="wcy-login-modal"> -->
   <div class="modal fade" id="wcy-login-modal">
      <div class="container-login100 modal-dialog">
         <div class="wrap-login100 modal-content" id="modal-content">
            <form class="login100-form validate-form">
                <span class="close" id="modal_close_btn">&times;</span>
                    <div class="wcy-modal-header">
                        <span class="login100-form-title p-b-40">
                    Login
                   </span> 
                    </div>
            <div class="modal-body">
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
               <div>
					<a id="kakao-login-btn"></a>
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
            </div>
            </form>
         </div>
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


  
  <script type='text/javascript'>
  
 	var form = document.createElement("form"); //form 생성
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); 
	form.setAttribute("action", "<c:url value='/member/kakao' />");
	
	var emailField = document.createElement("input");
	emailField.setAttribute("type", "hidden");
	emailField.setAttribute("name", "email");
	form.appendChild(emailField);
  
 	var imageField = document.createElement("input");
	imageField.setAttribute("type", "hidden");
	imageField.setAttribute("name", "image");
	form.appendChild(imageField); 

 	var birthField = document.createElement("input");
	birthField.setAttribute("type", "hidden");
	birthField.setAttribute("name", "birth");
	form.appendChild(birthField); 

	var nickField = document.createElement("input");
	nickField.setAttribute("type", "hidden");
	nickField.setAttribute("name", "nickname");
	form.appendChild(nickField); 
	
	
	document.body.appendChild(form);

    //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('74411014588edc9828d086e4e4698792');
   
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    scope: 'account_email,birthday',
 
    success: function(authObj) {
     
     // 로그인 성공시, API를 호출합니다.
     Kakao.API.request({
      url: '/v2/user/me',
      success: function(res) {
       console.log(res);
       
       
       var id = res.id;      //유저의 카카오톡 고유 id
       var email = res.kakao_account.email;   
       var nickname = res.properties.nickname; 
       var image = res.properties.profile_image; 
       var birth = res.kakao_account.birthday; 
       //존재하지 않으면 undefined
       
       emailField.setAttribute("value", email);
       imageField.setAttribute("value", image);
       birthField.setAttribute("value", birth);
       nickField.setAttribute("value", nickname);
	   form.submit();
       
      },
      fail: function(error) {
       alert(JSON.stringify(error));
      }
     });
    },
    fail: function(err) {
     alert(JSON.stringify(err));
    }
   });
    //]]>
  </script>



<script>
        var myModal = document.getElementById("wcy-login-modal");
        var modal_close_btn = document.getElementById("modal_close_btn");
    
      modal_close_btn.onclick = function(){
         myModal.style.display = "none";
         $( '.modal-backdrop' ).remove();

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