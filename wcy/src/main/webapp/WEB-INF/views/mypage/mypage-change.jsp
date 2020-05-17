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


<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
   integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
   crossorigin="anonymous"></script>

<style>
.left-section {
   float: left;
   width: 210px;
}

.left-section>h2 {
   width: 210px;
   height: 112px;
   background: #25283D;
   color: #fff;
   text-align: center;
   display: table-cell;
   vertical-align: middle;
}

.left-section .left-sub-nav {
   width: 210px;
   border: solid #dbdbdb;
   border-width: 0 1px;
   box-sizing: border-box;
}

.left-section .left-sub-nav>li>a {
   padding: 10px 20px;
   font-size: 14px;
   display: block;
   position: relative;
   border-bottom: 1px solid #dbdbdb;
   font-weight: bold;
   color: #333;
}

.right-section {
   width: 840px;
   float: right;
   position: relative;
}

.right-header .right-sub-nav {
   width: 100%;
   background: #f4f4f4;
   border-radius: 5px;
   display: table;
   table-layout: fixed;
   margin-bottom: 50px;
   overflow: hidden;
}

.right-header .right-sub-nav li {
   display: table-cell;
}

.right-header .right-sub-nav li a {
   display: block;
   height: 60px;
   box-sizing: border-box;
   font-size: 18px;
   color: #888;
   padding: 0 0 0 20px;
   line-height: 60px;
   border-bottom: 4px solid #ddd;
}

.right-sub-nav li a.active {
   color: #25283D;
   border-color: #25283D;
}

.contents-title:before {
   display: block;
   content: '';
   width: 50px;
   height: 3px;
   background: #25283D;
   position: absolute;
   left: 0;
   top: 0;
}

.contents-title {
   font-size: 22px;
   margin-bottom: 20px;
   color: #000;
   position: relative;
   padding-top: 5px;
   height: 40px;
   line-height: 40px;
}

p {
   line-height: 150% !important;
}
</style>

</head>
<body>

   <jsp:include page="../include/header-sub.jsp" />



	<main class="wcy-main-content">
		<div class="left-section">
			<h2>MyPage</h2>
			<ul class="left-sub-nav">
				<li><a class="active" href="<c:url value='/mypage/myinfoChange' />">내 정보</a></li>
				<li><a href="<c:url value='/mypage/leclist?type=on' />">수강 목록</a></li>
				<li><a href="<c:url value='/mypage/pointInfo' />">내 포인트</a></li>
				<li><a href="<c:url value='/mypage/recentAct' />">최근 활동</a></li>
				<li><a href="<c:url value='/mypage/mylec' />">내 강의실</a></li>
			</ul>
		</div>
      <div class="right-section">
         <div class="right-header">
            <ul class="right-sub-nav">
               <li><a id="info_link" class="active" onclick="info_active()"> 내 정보 </a></li>
               <li><a id="pw_link" onclick="pw_active()"> 비밀번호 변경 </a></li>
            </ul>
         </div>
         <div class="right-contents">
            <h4 class="contents-title">${login.userName}님의 MYPAGE</h4>
            <p class="mb10">
          
<!-- 일반적인 정보들을 바꾸겠다. -->
<div id="info_change_form">
   <table border="0" class="tbl_model">
                <caption><span class="blind">연락처 수정 입력</span></caption>
                <colgroup>
                    <col style="width:22%"><col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">
                        <div class="thcell">
                            사용자 <span class="word_br">이름</span>
                       </div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p class="contxt_tit">${login.userName}</p>
                            <p class="contxt_desc">이름이 변경되었다면 이메일 인증을 통해 정보를 수정할 수 있습니다.</p>
                            <p class="btn_area_btm">
                                <a href="javascript:changeName();" class="btn_model"><b class="btn2">수정</b></a>
                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell">휴대전화</div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p id="p_txt_phoneNo" class="contxt_tit">${login.userTel}</p>
                            <p class="contxt_desc">필요한 정보를 위코드유로부터 알림을 받을 때 사용할 휴대전화입니다.</p>
                            <div id="d_phoneNo" style="display:none">
                                <p id="p_txt_phoneNo_changeYn" class="contxt_tit2"><label for="phoneNo">변경할 휴대전화</label></p>
                                <p class="contxt_webctrl">
                            <span class="country_code_w">
                                        <span id="input_internationalCode" class="country_code">+82</span>
                              <input type="text" id="phoneNo" name="phoneNo" maxlength="14" onkeydown="check_num_ajax2('phoneNo', '2', 'e_phoneNo','e_authNo');">
                                    </span>
                                    <a href="#" onclick="sendSmsForChangePhoneNo();return false;" class="btn_model"><span class="btn4">인증</span></a>
                                </p>
                                <p id="e_phoneNo" class="contxt_alert"></p>

                                <p class="contxt_tit2"><label for="authNo">인증번호 입력</label></p>
                                <p class="contxt_webctrl">
                                    <input type="text" id="authNo" name="authNo" value=""  maxlength="6" onkeydown="check_num_ajax2('authNo', '2', 'e_authNo','e_phoneNo');" disabled class="focus" style="width:254px">
                                </p>
                                <p id="e_authNo"  class="contxt_alert"></p>

                                <p class="btn_area_btm">
                                    <a href="#" onclick="cancelChange('phoneNo');return false;" class="btn_model"><b id="b_txt_phoneNo_cncl"  class="btn2">수정취소</b></a>
                                    <a href="#" onclick="checkAuthNoForChangePhoneNo();return false;" class="btn_model"><b id="b_txt_phoneNo_reg" class="btn3">수정완료</b></a>
                                </p>
                            </div>
                            <p id="p_phoneNo" class="btn_area_btm">
                                <a href="#" onclick="display('phoneNo');return false;" class="btn_model"><b class="btn2">수정</b></a>
                            </p>
                        </div>
                    </td>
                </tr>
  <tr>
                   <th scope="row">
                        <div class="thcell">
                           <span class="word_br">주소지</span>
                       </div>
                    </th>
                    <td>
                        <span class="zipcode">${login.userZipcode}</span> ${login.userAddress}<br>${login.userDetailAddress}
                    </td>
                    <td class="cell_edit">
                        <a href="#" class="_modify setting_btn type_h">수정</a><!--N=a:adr.listmodi-->
                        <input type="hidden" id="hash" value="2ff228e4bcb6dc68572bff884bff4541db19f05a79e29095b53b315355cc525d"/>
                    </td>
                </tr>
                
                </tbody>
            </table>
            
            
<br>
</div>

<div id="pw_change_form" style="display: none;">
	<div id="pcf_check">
	기존의 비밀번호를 입력해주세요.
	
	현재 비밀번호: <input type="password" name="is_pw" id="is_pw" required="required"/> <button onclick="check()"> 입력 </button>
	</div>
	<div id="pcf_ok" style="display: none;">
	비밀번호 변경<br>
	안전한 비밀번호로 내정보를 보호하세요.<br>
	
	다른 아이디/사이트에서 사용한 적 없는 비밀번호<br>
	
	이전에 사용한 적 없는 비밀번호가 안전합니다.<br>
	
	비밀번호: <input type="password" name="newPw" id="newPw" /><span id="pwChk1"></span><br>
	번호확인: <input type="password" name="newPwChk" id="newPwChk" /><span id="pwChk2"></span><br>
   
    <button onclick="change_pw()">비밀번호 변경</button>
   </div>
<br>
</div>


            </p>
         </div>
      </div>
   </main>


   <script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
   <script src="<c:url value = "/js/main.js"/>"></script>

<c:if test="${login == null}">
   <script>   
      alert("로그인이 필요한 서비스입니다.");
      location.href="<c:url value='/' />";
   </script>
</c:if>   

<script type="text/javascript">
function pw_active(){
	document.getElementById("info_change_form").style.display = "none";
	document.getElementById("pw_change_form").style.display = "block";

	document.getElementById("info_link").className = "";
	document.getElementById("pw_link").className = "active";
} // 비밀번호 변경창 active

function info_active(){
	document.getElementById("info_change_form").style.display = "block";
	document.getElementById("pw_change_form").style.display = "none";

	document.getElementById("info_link").className = "active";
	document.getElementById("pw_link").className = "";

	document.getElementById("pcf_ok").style.display = "none";
	document.getElementById("pcf_check").style.display = "block";
	
	document.getElementById("is_pw").value = "";
	$("#is_pw").css("border-color","none");
} // 기본정보 변경창 active

function check(){
	var userPw = document.getElementById("is_pw");
	
	if(userPw != ""){
		$.ajax({
	        type:"POST",
	        url:"/mypage/pwCheck",
	        headers:{
	           "Content-Type":"application/json"
	        },
	        dataType:"text",
	        data:userPw.value,
	        success:function(result){
	        	 if(result==="OK"){
	        			document.getElementById("pcf_ok").style.display = "block";
	        			document.getElementById("pcf_check").style.display = "none";
	        	 } else{
	        		 $("#is_pw").css("border-color","red");
	              }
	        },
	        error:function(){
	         	console.log("서버와 통신 실패");
			 	$("#is_pw").css("border-color","red");
	        }
	     });
	}else{
		$("#is_pw").css("border-color","red");
	}
} // 현재 비밀번호 확인 (복호화해서 확인해야 하기때문에 ajax) 




// 1. 비밀번호 입력 값 검증 ======================================================================================
const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
let chk1 = false, chk2 = false;

// 2) 비밀번호 입력값 keyup 이벤트
$('#newPw').on('keyup', function() {
      
      // 비밀번호 공백 체크
      if($("#newPw").val() === ""){
          $('#newPw').css("background-color", "pink");
         $('#pwChk1').html('<b style="font-size:14px;color:red;">비밀번호는 필수 정보 입니다.</b>');
         chk1 = false;
      }               
      // 비밀번호 유효성 검증 (특수문자 포함 8자 이상인지 검사)
      else if(!getPwCheck.test($("#newPw").val()) || $("#newPw").val().length < 8){
          $('#newPw').css("background-color", "pink");
         $('#pwChk1').html('<b style="font-size:14px;color:red;">특수문자 포함 8자 이상으로 입력해주세요.</b>');
         chk1 = false;
      } 
      // 비밀번호 제대로 썼을 때
      else {
         $('#newPw').css("background-color", "white");
         $('#pwChk1').html('<b style="font-size:14px;color:green;">사용 가능한 비밀번호입니다.</b>');
         chk1 = true;
      }      
}); //end - 비밀번호 입력값 keyup 이벤트


$('#newPwChk').on('keyup', function() { 
    // 비밀번호 확인란 공백 체크
    if($("#newPwChk").val() === ""){
		$('#newPwChk').css("background-color", "pink");
		$('#pwChk2').html('<b style="font-size:14px;color:red;">비밀번호 확인을 입력해주세요.</b>');
		chk2 = false;
    }               
    // 비밀번호 확인 검증 (비밀번호와 같은지 검사)
    else if($("#newPwChk").val() != $("#newPw").val()){
		$('#newPwChk').css("background-color", "pink");
		$('#pwChk2').html('<b style="font-size:14px;color:red;">비밀번호와 동일하게 입력해주세요.</b>');
		chk2 = false;
    } 
    // 비밀번호 확인 제대로 썼을 떄
    else if($("#newPwChk").val() == $("#newPw").val()){
       $('#newPwChk').css("background-color", "white");
       $('#pwChk2').html('');
       chk2 = true;
    }
}); // end - 비밀번호 확인 입력값 keyup 이벤트

function change_pw(){
	var newPw = document.getElementById("newPw");
	
	if(chk1 == true && chk2 == true){
		$.ajax({
	        type:"POST",
	        url:"/member/changePw",
	        headers:{
	           "Content-Type":"application/json"
	        },
	        dataType:"text",
	        data:newPw.value,
	        success:function(){
	        	location.replace("/");
	        },
	        error:function(){
	         	console.log("서버와 통신 실패");
				alert("알수 없는 오류가 발생했습니다.");
	        }
	     });
	}else{
		$("#pwChk2").css("border-color","red");
	}
} // 현재 비밀번호 확인 (복호화해서 확인해야 하기때문에 ajax) 


</script>
</body>
   <jsp:include page="../include/footer.jsp" />
</html>