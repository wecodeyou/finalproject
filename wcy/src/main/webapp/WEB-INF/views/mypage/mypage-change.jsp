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
<link rel="stylesheet" href="<c:url value='/css/mypage.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">

<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	html,body{height:100%;}
</style>

</head>
<body>

   <jsp:include page="../include/header-sub.jsp" />



<main class="wcy-main-content">
	<input type="hidden" id="userNo" value="${login.userNo}" />
	<input type="hidden" id="userEmail" value="${login.userEmail}" />
	<div class="wcy-contents">
		<div class="join_title_box">
			<h3>회원정보변경</h3>
			<h4>안전한 개인정보보호를 위해 주기적으로 비밀번호를 변경해주세요.</h4>
		</div>
		<div id="content">
			<table class="fvboard">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<tr>
						<th>이름</th>
						<td>${login.userName}</td>
					</tr>
					<tr>
						<th>아이디(이메일)</th>
						<td>${login.userEmail}</td>
					</tr>
					<tr>
						<th>프로필 이미지</th>
						<td >
							<span>현재 프로필 이미지</span>						
							<div class="pimg" style="width:200px; height:200px;">
								<img width="150" height="145" src="${login.userProfileImg}">
								<input type="hidden" id="oldImg" value="${login.userProfileImg}" />
							</div>
							<span>변경할 프로필 이미지 선택</span>
							<div class="profileImg_box">
								<img width="100" height="95" src="<c:url value='/img/commons/basic-profileImg-blue.png'/>" alt="" />
								<img width="100" height="95" src="<c:url value='/img/commons/basic-profileImg-apricot.png'/>" alt="" />
								<img width="100" height="95" src="<c:url value='/img/commons/basic-profileImg-gray.png'/>" alt="" />
								<img width="100" height="95" src="<c:url value='/img/commons/basic-profileImg-purple.png'/>" alt="" />
								<div class="profileImg-radio">
									<input type="radio" name="userProfileImg" id="defaltImg" value="http://localhost/img/commons/basic-profileImg-blue.png" style="margin:0 87px 0 44px;">
									<input type="radio" name="userProfileImg" value="http://localhost/img/commons/basic-profileImg-apricot.png" style="margin:0 87px 0 0px;">
									<input type="radio" name="userProfileImg" value="http://localhost/img/commons/basic-profileImg-gray.png" style="margin:0 87px 0 0px;">
									<input type="radio" name="userProfileImg" value="http://localhost/img/commons/basic-profileImg-purple.png">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>기존 비밀번호</th>
						<td><input type="password" name="is_pw" id="is_pw" required="required" maxlength="20" title="비밀번호입력" class="int01" placeholder="특수문자 포함 8자 이상" style="width:260px" />
							<span id="pwChk0" style="color:red; font-size:11px;">&nbsp;</span>
						</td>
					</tr>
					<tr>
						<th>변경할 비밀번호</th>
						<td><input type="password" name="newPw" id="newPw" required="required" maxlength="20" title="비밀번호입력" class="int01" placeholder="특수문자 포함 8자 이상" style="width:260px" />
							<span id="pwChk1" style="color:red; font-size:11px;">&nbsp;</span>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="newPwChk" id="newPwChk" required="required" maxlength="20" title="비밀번호입력" class="int01" placeholder="위의 비밀번호 다시한번 기입" style="width:260px" />
							<span id="pwChk2" style="color:red; font-size:11px;">&nbsp;</span>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<c:if test="${user_birthday != null}">
							<td>${user_birthday}</td>
							<input type="hidden" id="userBirthday" value="${user_birthday}" />
						</c:if>
						<c:if test="${user_birthday == null}">
							<td><input type="date" id="userBirthday" class="form-control mt10" name="userBirthday" /></td>
						</c:if>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td><input type="text" name="userTel" id="userTel" class="int01" style="width:193px;" placeholder="${login.userTel}">
						<input type="hidden" id="oldTel" value="${login.userTel}"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<ul class="address_box">
								<li>
									<input type="text" name="userZipcode" id="userZipCode" class="int01" placeholder="${login.userZipcode}" readonly="readonly" style="width:193px;" />
									<input type="hidden" id="oldZipCode" value="${login.userZipcode}" />
									<a onclick="openDaumPostcode('userZipCode','userFirstAddr','userSecondAddr'); return false;" style="cursor:point;" class="btn_gray">우편번호 검색</a>
								</li>
								<li>
								  	<input type="text" name="userAddress" id="userFirstAddr" readonly="readonly" class="int01" style="width:335px;" placeholder="${login.userAddress}">
								  	<input type="text" name="userDetailAddress" type="text" id="userSecondAddr" class="int01" style="width:260px;" placeholder="${login.userDetailAddress}" required="required">
								  	<input type="hidden" id="oldAddr" value="${login.userAddress}" />
								  	<input type="hidden" id="oldDetail" value="${login.userDetailAddress}" />
									<div id="layer" style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
								    	<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1" onclick="closeDaumPostcode()" alt="닫기 버튼">
									</div>
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="mt40" style="width:100%; text-align:center">
				<input type="button" id="signup-btn" value="회원정보 변경" class="btn btn-primary" onclick="btn_click()"/>
		        <a href="<c:url value='/mypage/' />"><input type="button" value="취소" class="btn btn-warning" /></a>
			</p>
		</div>
	</div>
</main>
         


   <script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
   <script src="<c:url value = "/js/main.js"/>"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>

<c:if test="${login == null}">
   <script>   
   	  Swal.fire('로그인이 필요한 서비스입니다.');
      location.href="<c:url value='/' />";
   </script>
</c:if>    

<!-- 주소 -->
<script>
      var element_layer = document.getElementById('layer');
      //주소 검색 닫아주기
      function closeDaumPostcode() {
         //iframe을 넣은 element를 안보이게 한다.
         element_layer.style.display = 'none';
      }
      //주소 검색 열어주기
      function openDaumPostcode(userZipCode, userFirstAddr, userSecondAddr) {
         new daum.Postcode({
                  oncomplete : function(data) {
                     document.getElementById(userZipCode).value = data.zonecode;
                     document.getElementById(userFirstAddr).value = data.address;
                     document.getElementById(userSecondAddr).focus();
                     element_layer.style.display = 'none';
                  },
                  width : '100%',
                  height : '100%'
               }).embed(element_layer);
         element_layer.style.display = 'block';
         initLayerPosition();
      }
      //팝업창 세부 설정
      function initLayerPosition() {
         var width = 300; //우편번호서비스가 들어갈 element의 width
         var height = 460; //우편번호서비스가 들어갈 element의 height
         var borderWidth = 5; //샘플에서 사용하는 border의 두께
         //위에서 선언한 값들을 실제 element에 넣는다.
         element_layer.style.width = width + 'px';
         element_layer.style.height = height + 'px';
         element_layer.style.border = borderWidth + 'px solid';
         //실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
         element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
               + 'px';
         element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
               + 'px';
      }
</script>

<script type="text/javascript">

const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
let chk1 = true, chk2 = true;

function btn_click(){// 회원정보 변경을 누르면 
	// 우선 현재 비밀번호 검사 
	var userPw = document.getElementById("is_pw");
	
	if(userPw.value != ""){
		var xhr = $.ajax({
	        type:"POST",
	        url:"/mypage/pwCheck",
	        headers:{
	           "Content-Type":"application/json"
	        },
	        dataType:"text",
	        data:userPw.value,
	        success:function(result){
	        	 if(result==="OK"){// 현재 비밀번호 통과
					if(chk1 == true && chk2 == true){// 비밀번호 검증완료 				
						if(userPw.value == $("#newPw").val()){
							Swal.fire({
				    			  title: 'Oops...',
				    			  text: '현재 비밀번호와 같은 비밀번호로 변경할 수 없습니다.',
				    			  type: 'error',
				    			});
							$("#newPw").html('');
							$("#newPwChk").html('');
						}// 현재와 비밀번호가 같으면 에러 
						else{ // 모든 검증 끝		
							 // 유저 번호
							 var userNo = Number($("#userNo").val());
							 var userEmail = $("#userEmail").val();
					         //패스워드 정보
					         var pw = document.getElementById('is_pw').value;
					         if(document.getElementById('newPw').value != ""){
					         	pw = document.getElementById('newPw').value;
					         }
					         //전화번호
					         var tel;
					         if(document.getElementById('userTel').value != ""){
					         	tel = document.getElementById('userTel').value;	
					         }else{
					        	tel = document.getElementById('oldTel').value;
					         }
					         //생일
					         var birthday = document.getElementById('userBirthday').value;
					         var year = birthday.substr(0,4);
					         var month = birthday.substr(6,2);
					         var day = birthday.substr(10,2);
					         birthday = year+"-"+month+"-"+day;
					         
					         //주소
					         var zip = document.getElementById('oldZipCode').value;
					         var addr = document.getElementById('oldAddr').value;
					         var detail = document.getElementById('oldDetail').value;
					         if(document.getElementById('userZipCode').value != ""){
					         	zip = document.getElementById('userZipCode').value;	
					         	addr = document.getElementById('userFirstAddr').value;	
					        	if(document.getElementById('userSecondAddr').value == ""){
					        		Swal.fire({
						    			  title: 'Oops...',
						    			  text: '상세주소를 입력해주세요.',
						    			  type: 'error',
						    		})
						    		xhr.abort();
					        	}else{
					        		detail = document.getElementById('userSecondAddr').value;	
					        	}
					         }
	
							 //이미지
							 var img = $('input[name="userProfileImg"]:checked').val();
							 if($('input[name="userProfileImg"]:checked').val() == null){
								img = document.getElementById('oldImg').value;	
							 }
					         //자바스크립트 형태의 객체 생성 (키:값) => 키는 VO의 필드명과 맞춘다
					     	 
					         const mvo={   
					        	userEmail:userEmail,
					            userNo:userNo,
					            userPw:pw,
					            userTel:tel,
					            userBirthday:birthday,
					            userProfileImg:img,
					            userZipcode:zip,
					            userAddress:addr,
					            userDetailAddress:detail
					         };
					         //console.log(mvo);
					         $.ajax({
					            type: "POST",            //서버에 전송하는 HTTP 요청 방식 (POST, GET, PUT, DELETE)
					            url: "/mypage/changeInfo",            //url이라고 키를 적고 서버에 요청할 uri만 작성해도됨
					            headers: {               //요청 헤더 정보 (데이터 타입 등)
					               "Content-Type":"application/json"
					            },
					            dataType: "text",         //응답받을 데이터의 형태 (text , xml, html, json) ==> 지금 text인 이유는 컨트롤러에서 return 값이 문자열(string)이기 때문에 text로!
					            data: JSON.stringify(mvo),   //서버로 전송할 데이터  ,  JSON.stringify(user) ==> user라는 자바스크립트 객체를 JSON으로 바꿔서 서버로 보내라.
					            success: function(result){   //통신 성공시 처리할 내용들을 함수 내부에 작성 , 함수의 매개변수는 통신 성공시에 서버가 가져다 줄 데이터가 저장될 곳!
					                  
					               console.log("통신 성공!: "+result);
					               if(result === "Success"){
							     	  	Swal.fire({
							     			  title: 'Good job!',
							     			  text: '회원변경 성공! 바뀐 정보로 다시 로그인해주세요.',
							     			  type: 'success',
							     		});
								   		 window.setTimeout(function(){
											 window.location.href="/";
										 },1500);
					               }else{
							    	  	Swal.fire({
							    			  title: 'Oops...',
							    			  text: '변경 실패',
							    			  type: 'server error',
							    		})
					               }        
					            },
					            error: function(){         //통신 실패시 처리할 내용들을 함수 내부에 작성
					               console.log("변경 통신 실패!");
					            }
					         });
						}
					}else{
						Swal.fire({
			    			  title: 'Oops...',
			    			  text: '새 비밀번호를 다시 확인해 주세요.',
			    			  type: 'error',
			    			});
						$("#newPw").html('');
						$("#newPwChk").html('');
					}
	             }else{
	            	 Swal.fire({
		    			  title: 'Oops...',
		    			  text: '기존 비밀번호를 다시 확인해 주세요.',
		    			  type: 'error',
		    			});
	         		$("#is_pw").html('');
	         		$('#is_pw').css("border","1px solid #f44336");
	         		console.log("비밀번호 확인 컨트롤러실패");	      
	             }
	        },
	        error:function(){
	         	console.log("비밀번호 확인 통신 실패");
			 	$("#is_pw").css("border","1px solid #f44336");
			 	$('#is_pw').html('');
			 	$('#pwChk0').html('<b style="font-size:14px;color:red;">현재 비밀번호는 필수입니다.</b>');
			    $('#is_pw').focus();
	        }
	     });
	}else{
		$("#is_pw").css("border-color","red");
	}
	
	
}

$('#newPw').on('keyup', function() { 
            
      // 비밀번호 유효성 검증 (특수문자 포함 8자 이상인지 검사)
      if(!getPwCheck.test($("#newPw").val()) || $("#newPw").val().length < 8){
          $('#newPw').css("border","1px solid #f44336");
         $('#pwChk1').html('<b style="font-size:14px;color:#f44336;">특수문자 포함 8자 이상으로 입력해주세요.</b>');
         chk1 = false;
      } 
      // 비밀번호 제대로 썼을 때
      else {
         $('#newPw').css("background-color", "white");
         $('#pwChk1').html('<b style="font-size:14px;color:#2196F3;">사용 가능한 비밀번호입니다.</b>');
         chk1 = true;
      }      
}); //end - 비밀번호 입력값 keyup 이벤트


$('#newPwChk').on('keyup', function() { 
    // 비밀번호 확인 검증 (비밀번호와 같은지 검사)
    if($("#newPwChk").val() != $("#newPw").val()){
		$('#newPwChk').css("border","1px solid #f44336");
		$('#pwChk2').html('<b style="font-size:14px;color:#f44336;">비밀번호와 동일하게 입력해주세요.</b>');
		chk2 = false;
    } 
    // 비밀번호 확인 제대로 썼을 떄
    else if($("#newPwChk").val() == $("#newPw").val()){
       $('#newPwChk').css("background-color", "white");
       $('#pwChk2').html('');
       chk2 = true;
    }
}); // end - 비밀번호 확인 입력값 keyup 이벤트


</script>
</body>
   <jsp:include page="../include/footer.jsp" />
</html>