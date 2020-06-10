<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-client_id" content="690220196013-0vrt74a1o5e3r67vfevah2sqo92cp6s7.apps.googleusercontent.com">

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>

	<link rel="stylesheet" href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> 

	<link rel="stylesheet" href="<c:url value='/css/login-util.css'/>">
	<link rel="stylesheet" href="<c:url value='/css/login-main.css'/>">
	
	
	<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
	<script src="<c:url value = "/resources/js/kakao.js"/>"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>	
	
	<style>
	.modal-backdrop{
		z-index: 10000;
	}
	
	.modal-backdrop.show{
		opacity:.6;
	}
	
	.modal-open{
		overflow:auto !important;  /*로그인 모달 open 시, 뒤의 body 스크롤바 없앨건지 보일건지 선택(없앨경우 약간씩 움직임이 생김 ㅠㅠ)*/
	}

	.modal{
		z-index:10001;
	}

	
	body{
		padding-right:0 !important;
	}
	
	.container-login100-form-btn{
		width: 100% !important;
	}
	
	.abcRioButton {
    	border-radius: 4px !important;
    }
	
	</style>


</head>
<body>

<div class="modal fade" id="wcy-login-modal">
		<div class="modal-dialog container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-30 p-b-33">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <form class="login100-form validate-form flex-sb flex-w">    
					<span class="login100-form-title p-b-50">
						로그인
					</span>

					<a href="#" class="btn-face m-b-20" id="kakao-login-btn">
						<img src="<c:url value='/img/login/kakao.png'/>" alt="kakao login" />
						Kakao
					</a>

					<div class="g-signin2 m-b-20 btn-face"  data-onsuccess="onSignIn" style="height:49px; width:165px; border-radius:7px;" >
						</div>
						
					
					<div class="p-t-25 p-b-9">
						<span class="txt1">
							Email
						</span>
                        
                        <a href="<c:url value='/member/find-form?target=email' />" class="txt2 bo1 m-l-5">
							Email Forgot?
						</a>
						
						<span id="emailCheck" class="m-l-10"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "UserEmail is required">
						<input class="input100" type="text" name="userEmail" id="loginUserEmail" aria-required="true">
						<span class="focus-input100"></span>
					</div>
					
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							Password
						</span>

						<a href="<c:url value='/member/find-form?target=pw' />" class="txt2 bo1 m-l-5">
							Password Forgot?
						</a>
						
						<span id="pwCheck" class="m-l-10"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="userPw" id="loginUserPw" aria-required="true" >
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-20">
						<button type="button" class="btn btn-outline-dark modalLogin" id="login-btn" value="로그인">
							로그인
						</button>
					</div>

					<div class="w-full text-center p-t-55">
						<span class="txt2">
							아직 WCY 회원이 아니세요? 
						</span>

						<a href="<c:url value='/member/email-form' />" class="txt3 bo1">
							 회원가입
						</a>
					</div>
				</form>
			</div>
        </div>
	</div>
	
	<script type="text/javascript" src="https://unpkg.com/@popperjs/core@2"></script>
	
<!--===============================================================================================-->
	<script src="<c:url value = "/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
	<script src="<c:url value = "/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
   
    

<script>

(function ($) {
    "use strict";


    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');
    
    $('.login100-form-btn').click(function(){
        var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
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

    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
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
$(function(){
	   
	   const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	   const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	   let chk1 = false, chk2 = false;

	   // 1. 로그인 입력값 검증 =======================================================================
	   // 1) 이메일 입력값 keyup 검증
	   $("#loginUserEmail").on("keyup",function(){
	      // 이메일 공백
	      if($("#loginUserEmail").val() == ""){
	         $('#emailCheck').html('<b style="font-size:14px;color:red;">이메일을 입력해주세요.</b>');
	         chk1 = false;
	      }
	      // 이메일 유효성 검증
	      else if(!getMail.test($("#loginUserEmail").val())){
	         $('#emailCheck').html('<b style="font-size:14px;color:red;">이메일 형식에 맞게 입력해주세요.</b>');
	         chk1 = false;
	      }
	      // 이메일 통과한 경우
	      else{
	         $('#emailCheck').html('');
	         chk1 = true;
	      }
	   }); // end - 이메일 입력값 검증
	   
	   // 2) 패스워드 입력값 keyup 검증
	   $("#loginUserPw").on("keyup",function(){
	      // 패스워드 공백
	      if($("#loginUserPw").val() == ""){
	         $('#pwCheck').html('<b style="font-size:14px;color:red;">비밀번호를 입력해주세요.</b>');
	         chk2 = false;
	      }
	      // 패스워드 통과한 경우
	      else{
	         $('#pwCheck').html('');
	         chk2 = true;
	      }
	   });
	   
	   // 2. 로그인 버튼 click 이벤트 =================================================================
	   $("#login-btn").click(function() {
	      // 위의 검증을 모두 통과한 경우!!!!!!!!!!!!!
	      if(chk1 && chk2) {
	         //ajax통신으로 서버에서 값 받아오기
	         const email = $('#loginUserEmail').val();
	         const pw = $('#loginUserPw').val();
	         
	         console.log("id: " + email);
	         console.log("pw: " + pw);
	         
	         const mvo = {
	               userEmail : email,
	               userPw : pw
	         };
	         
	         $.ajax({
	            type: "POST",
	            url: "<c:url value = "/member/loginCheck"/>",
	            headers: {
	                   "Content-Type": "application/json"
	               },
	            data: JSON.stringify(mvo),
	            dataType : "text",
	            success: function(data) {
	               console.log("통신성공 ! result: " + data);   
	               
	               if(data === "emailFail") {
	                  $('#emailCheck').html('<b style="font-size:14px;color:red;">존재하지 않는 이메일입니다. 회원가입 해주세요.</b>');
	                  $('#loginUserPw').val("");
	                  $('#loginUserEmail').focus();
	                  chk2 = false;
	                } else if(data === "pwFail") {
	                  $('#pwCheck').html('<b style="font-size:14px;color:red;">비밀번호가 틀렸습니다.</b>');
	                  $('#loginUserPw').val("");
	                  $('#loginUserPw').focus();
	                  chk2 = false;
	               } else if(data === "loginSuccess") {
	                  //self.location="/";
	            	   location.reload();
	               }
	            },
	            error: function(){
	               console.log("통신실패!");
	            }
	         });
	         
	      }
	      // 위의 검증 중에 하나라도 통과하지 못한 경우!!!!!!!!!!!!!
	      //else {
	      //   alert("입력정보를 다시 확인하세요!");
	      //}
	   });
	      

		//엔터키 입력 이벤트
		$("#loginUserPw").keydown(function(key) {

			if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
				$("#login-btn").click();
			}
			
		});
	}); //end - jquery
	
/* 	function checkGoogle(){
		
	}
	//Google Login
	function onSignIn(googleUser) {

	  var profile = googleUser.getBasicProfile();
	  console.log('Name: ' + profile.getName());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  
	  var googleInfo = {
		  userEmail : profile.getEmail(),
		  userName : profile.getName(),
	  };
       $.ajax({
          type: "POST",
          url: "<c:url value = '/member/gmail'/>",
          headers: {
                 "Content-Type": "application/json"
             },
          data: JSON.stringify(googleInfo),
          dataType : "text",
          success: function(data) {
             console.log("통신성공 ! result: " + data);   
             
             if(data === "member-approved") {
                 self.location="/";           	 
             } else if(data === "signin-required") {
            		var form1 = document.createElement("form"); //form 생성
            		form1.setAttribute("charset", "UTF-8");
            		form1.setAttribute("method", "Post"); 
            		form1.setAttribute("action", "<c:url value='/member/gmail-signup' />");
            		
            		var emailField1 = document.createElement("input");
            		emailField.setAttribute("type", "hidden");
            		emailField.setAttribute("name", "userEmail");
            		form1.appendChild(emailField1);
      
            		var nickField1 = document.createElement("input");
            		nickField.setAttribute("type", "hidden");
            		nickField.setAttribute("name", "nickName");
            		form1.appendChild(nickField1); 
                emailField.setAttribute("value", profile.getEmail());
                nickField.setAttribute("value", profile.getName());
                document.body.appendChild(form1);

          	   form1.submit();
             }
          },
          error: function(){
             console.log("통신실패!");
          }
       }); 
	}

	function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      console.log('User signed out.');
	    });	
	    auth2.disconnect();
	}
    function renderButton() {
        gapi.signin2.render('my-signin2', {
          'scope': 'profile email',
          'width': 240,
          'height': 50,
          'longtitle': true,
          'theme': 'dark',
          'onsuccess': onSuccess,
          'onfailure': onFailure
        });
      } */
	
</script>



</body>
</html>