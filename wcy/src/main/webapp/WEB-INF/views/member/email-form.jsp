<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/icheck-bootstrap@3.0.1/icheck-bootstrap.min.css" />
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">


<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>

<style>

    
    .left-section{float: left; width:210px;}
    .left-section > h2{width: 210px; height: 112px; background: #25283D; color: #fff; text-align: center; display: table-cell; vertical-align: middle;}
    .left-section .left-sub-nav{width:210px; border: solid #dbdbdb; border-width: 0 1px; box-sizing: border-box;}
    .left-section .left-sub-nav>li>a{padding: 10px 20px; font-size: 14px; display: block; position: relative; border-bottom: 1px solid #dbdbdb; font-weight: bold; color: #333;}
    
    
    .right-section{width:840px; float: right; position: relative;}
    
    .right-header .right-sub-nav{width: 100%; background: #f4f4f4; border-radius: 5px; display: table; table-layout: fixed; margin-bottom: 50px; overflow: hidden;}
    .right-header .right-sub-nav li{display: table-cell;}
    .right-header .right-sub-nav li a{display: block; height: 60px; box-sizing: border-box; font-size: 18px; color: #888; padding: 0 0 0 20px; line-height: 60px; border-bottom: 4px solid #ddd;}
    .right-sub-nav li a.active{color: #25283D; border-color: #25283D;}
    
    
    .contents-title:before{display: block; content: ''; width: 50px; height: 3px; background:#25283D; position: absolute; left: 0; top: 0;}
    .contents-title{font-size: 22px; margin-bottom: 20px; color: #000; position: relative; padding-top: 5px; height: 40px; line-height: 40px;}
    
    
    .right-section .contents-box{width:100%; height: 250px; padding: 20px; border: 1px solid #dbdbdb; box-sizing: border-box; overflow-x: hidden; overflow-y: auto; text-align: left;}
    
    .contents-check{display: inline-block; vertical-align: middle;}
    
    .email-auth-info{padding: 15px; background: #f4f4f4;}
    .email-auth-info li{padding: 3px 0; color: #888; font-size: 14px;}
    
    .email-auth-contents{padding:15px; border: 1px solid #f4f4f4;}
    .email-auth-contents li{padding 3px 0;}
    
    p{line-height: 150% !important;}
    


</style>


</head>
<body>
 
<jsp:include page="../include/header-sub.jsp" />


<main class="wcy-main-content">
    <div class="left-section">
        <h2>회원가입</h2>
        <ul class="left-sub-nav">
            <li><a href="#">회원가입</a></li>
            <li><a href="#">아이디(이메일)찾기</a></li>
            <li><a href="#">비밀번호 찾기</a></li>
        </ul>
    </div>

    <div class="right-section">
        <div class="right-header">
            <ul class="right-sub-nav">
                <li><a class="active">01 약관확인 및 본인인증</a></li>
                <li><a>02 회원가입 정보입력</a></li>
                <li><a>03 가입완료</a></li>
            </ul> 
        </div>
        
        <div class="right-contents">
            <h4 class="contents-title">이용약관</h4>
            <div class="contents-box">
                <div class="policy">
                    <p class="policy-title fs14b mb5">[제1조] 목적</p>
                        <p class="fs13">
                            본 약관은 주식회사 WECODEYOU(이하 "회사"라 한다)이 운영하는 웹사이트 WECODEYOU(wecodeyou url주소)에서 제공하는 서비스(이하 합하여 "서비스"라 한다)를 하나의 회원 아이디와 비밀번호로 동시에 각 사이트에 가입하여 이용함에 있어 회사와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.<br><br><br>
                        </p>
                    <p class="policy-title fs14b mb5">[제2조] 정의</p>
                        <p class="fs13">
                            ① 본 약관에서 사용하는 용어의 정의는 다음과 같습니다. <br><br>
                        </p>
                        <p class="fs13">
                            1. “이용자”라 함은 “회사”의 웹사이트에 접속하여 본 약관에 따라 “회사”가 제공하는 “콘텐츠” 및 제반서비스를 이용하는 “회원” 및 “비회원”을 말합니다. <br>
                            2. “회원”이라 함은 회사의 웹사이트에 접속하여 본 약관에 동의 함으로써 회사와 이용계약을 체결하고 아이디(ID) 를 부여 받은 자로서 회사가 제공하는 정보와 서비스를 지속적으로 이용할 수 있는 자를 말합니다. <br>
                            3. “비회원”이라 함은 회사의 웹사이트에 접속하였으나, 본 약관에 동의하지 않음으로써 아이디(ID)를 부여받지 못 한자를 말함. <br>
                            4. “콘텐츠”라 함은 회사 웹사이트에서 제공하는 온라인 강좌 및 기타 관련정보를 의미함으로써, 정보통신망이용 촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호의 규정에 의한 정보통신망에서 사용되는 부호ㆍ문자ㆍ음성 ㆍ음향ㆍ이미지 또는 영상 등으로 표현된 자료 또는 정보를 말합니다.<br>
                            5. “아이디(ID)”라 함은 회원의 식별 및 서비스 이용을 위하여 회원이 정하고 회사가 승인하는 문자 또는 숫자의 조합을 말합니다.<br>
                            6. “비밀번호(Password)”라 함은 서비스 이용 시, 아이디와 일치되는 회원임을 확인하고, 회원 개인정보 보호를 위 하여, 회원 자신이 정한 문자 또는 숫자의 조합을 말합니다.<br>
                            7. “전자우편(Email)”이라 함은 인터넷을 통한 우편 혹은 전기적 매체를 이용한 우편을 말합니다.<br>
                            8. “운영자(관리자)”라 함은 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 사람 또는 회사를 말합니다.<br>
                            9. “회원의 게시물”이라 함은 회사의 서비스가 제공되는 웹사이트에 회원이 올린 글, 이미지, 각종 파일 및 링크, 각종 덧글 등의 정보를 의미합니다.<br><br>
                        </p>
                        <p class="fs13">
                            ② 전항 각호에 해당하는 정의 이외의, 기타 용어의 정의에 대하여는 거래 관행 및 관계 법령에 따릅니다.<br><br><br>
                        </p>
                    <p class="policy-title fs14b mb5">[제3조] 회사 신원정보 등의 제공</p>
                        <p class="fs13">
                            회사는 회사의 상호, 대표자 성명, 주소, 전화번호(소비자의 불만을 처리하는 곳의 연락처 포함), 모사전송번호, 전 자우편주소, 사업자등록번호, 통신판매업 신고번호 및 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 온 라인 서비스 초기화면에 게시합니다.<br><br><br>
                        </p>
                    <p class="policy-title fs14b mb5">[제4조] 약관 등의 명시와 설명 및 개정</p>
                        <p class="fs13">
                            ① "회사”는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 "회사"의 초기 서비스화면(전면)에 게시합니다.<br>

                            ② "회사”는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 전자문서 및 전자거래 기본 법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>

                            ③ "회사”는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 회사의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에 는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "회사“는 개정 전 내용과 개정 후 내용을 명 확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br>

                            ④ "회사”가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정 약관 조항의 적용을 받기를 원할 경우, 제3항에 의한 개정약관의 공지기간 이내에 "회사"에 이용자의 의견을 송 신하여 "회사"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>

                            ⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률 및 관계법령 또는 상관례에 따릅니다.<br><br><br>
                        </p>
                    <p class="policy-title fs14b mb5">[제5조] 회원에 대한 통지</p>
                        <p class="fs13">
                            ① “회사”가 회원에 대한 통지를 하는 경우, 회원이 “회사”와 미리 약정하여 지정한 전자우편 주소로 할 수 있습 니다.<br>

                            ② “회사”는 불특정다수 회원에 대한 통지의 경우 1주일 이상 “회사” 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.<br>
                        </p>
                </div>
            </div>
            <div class="mt20 contents-check checkbox icheck-alizarin">
                <input type="checkbox" value="true" id="agree" name="agree">
                <label for="agree">위 이용약관에 동의합니다.</label>
            </div>
            
            <h4 class="contents-title mt70">개인정보처리방침</h4>
            <div class="contents-box">
                <div class="policy fs14">
                    <p>
                          WECODEYOU에서 제공하는 WECODEYOU(이하 ‘회사’라 함)는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법, 통신비밀보호법, 전기통신사업법, 등 정보통신 서비스제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정을 준수하며, 관련 법령에 의거한 개인정보취급방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다. 본 개인정보취급방침은 회사가 제공하는 WECODEYOU 관련 제반 서비스 이용에 적용되며 다음과 같은 내용을 담고 있습니다. <br><br>
                     </p>
                    <p class="policy-title fs14b mb5">1. 수집하는 개인정보 항목</p>
                        <p class="fs13">
                            회사는 회원가입, 원활한 고객상담, 각종 서비스 제공을 위해 필수정보와 선택정보를 구분하여 아래와 같은 개인정보를 수집하고 있습니다.

                            필수 입력 사항
                            이용자의 식별을 위한 내용 : 이름, 아이디, I-PIN 및 본인확인기관인증정보, 생년월일, 성별, 비밀번호, 휴대폰번호, 이메일, 사이트인지경로
 
                            서비스 이용 시 수집하는 정보
                            - 계약 취소 시 환불을 위한 내용: 신용거래정보(예금주, 은행명, 계좌번호)
                            - 주문 시 상품 배송을 위한 내용 : 주소
                            - 서비스 이용 기록을 위한 내용: 접속 로그, 쿠키, 접속 IP 정보, 결제기록, 관심교육, 부정 이용

                            선택 입력 사항
                            마케팅 수신동의 (회원개인 별 서비스제공을 위한 필요한 정보: SMS/ 이메일 수신동의)
 
                            개인정보 수집방법
                            홈페이지(회원가입) <br><br>
                        </p>
                    <p class="policy-title fs14b mb5">2. 개인정보의 수집 및 이용목적</p>
                        <p class="fs13">
                            회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

                            서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
                            콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송
 
                            회원 관리
                            회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 불만처리 등 민원처리 <br><br>
                        </p>
                    <p class="policy-title fs14b mb5">3. 마케팅 및 광고에 활용</p>
                        <p class="fs13">
                            신규 서비스(제품) 개발 및 특화 , 이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 <br><br>
                        </p>
                    <p class="policy-title fs14b mb5">4. 개인정보의 보유 및 이용기간</p>
                        <p class="fs13">
                            원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
                            
                            기타 개별적으로 동의를 받은 경우에는 동의한 기간 동안 보유합니다.

                            관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보유합니다.
                            - 표시/광고에 관한 기록 : 6개월 (전자상거래등에서의 소비자보호에 관한 법률)
                            - 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)
                            - 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
                            - 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)
                            - 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 (신용정보의 이용 및 보호에 관한 법률)
                            - 통신비밀보호법에 따른 통신사실확인자료 3개월 <br><br>
                        </p>
                    <p class="policy-title fs14b mb5">5. 개인정보의 파기절차 및 방법</p>
                        <p class="fs13">
                            회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.

                            파기절차
                            회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.

                            파기방법
                            종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하고 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
                        </p>
                </div>
            </div>
            <div class="contents-check mt20 checkbox icheck-alizarin">
                <input type="checkbox" value="true" id="agree2" name="agree">
                <label for="agree2">위 개인정보처리방침에 동의합니다.</label>
            </div>
            
            <h4 class="contents-title mt70">이메일 인증</h4>
            <ul class="email-auth-info">
                <li>* WECODEYOU에서는 깨끗하고 안전한 서비스 이용을 위해 본인확인을 받고 있습니다.</li>
                <li>* 입력하신 이메일 정보는 회원님의 동의 없이 제 3자에게 제공되지 않으며, <a href="#"><strong>개인정보처리방침</strong></a>에 따라 보호되고 있습니다.</li>
                <li>* 입력하신 이메일 정보는 본인확인용으로 사용되며, 회원가입 완료시 사용자 확인을 위해 회원정보 고유의 값으로 저장됩니다.</li>
            </ul>
            <div>
                <ul class="email-auth-contents">
                      <li class="mb20"><strong>이메일로 인증번호 발송</strong></li>
                        <li class="mb10">이메일 인증을 받아야 다음 단계로 넘어갈 수 있습니다.</li>
                        <li class="mb10">
                         	 이메일 : <input type="email" name="userEmail" id="userEmail" placeholder="example@google.com" class="form-control form-rounded" style="display:inline-block; height:30px; width:200px;">
                            <button type="button" id="check_btn" class="btn btn-outline-danger" onclick="isOverRap()" style="line-height: 1.1rem; height: 30px; margin-bottom: 7px; vertical-align: middle;">이메일 중복체크</button>
                            <span id="emailChk"></span>
                        </li>
                        <li><button type="submit" name="submit" id="submit_btn" class="btn btn-outline-primary" onclick="sendChkMail()" style="margin-left: 50px; line-height: 0.1rem; height: 30px; margin-bottom: 7px; vertical-align: middle;">인증번호 발송</button></li>
                        <li>
                        <div id="auth_div">
	                 		 <%-- <form action="<c:url value='/member/join_auth' />" method="post">--%>   
	                   		<table border="1">
	                        <tr>
	                        <td>인증번호 입력: <input type="text" id="email_auth" name="email_auth" class="form-control form-rounded" style="display:inline-block; height:30px; width:200px; margin-bottom: 15px;" size="25" placeholder="인증번호를 입력해주세요">
	                        <button type="submit" name="submit" class="btn btn-outline-dark" id="emailsubmit" onclick="chkCode()" style="line-height: 1.1rem; height: 30px; margin-bottom: 7px; vertical-align: middle;">이메일 인증하기</button>
		                   </td>
	                        </tr>
	                        <tr>
	                        <td>
	                           <span id="auth_alert"></span></td>
	                        </tr>
	                        </table>
		                    <input type="hidden" name="dice" id="dice" />
                  		</div>

                        </li>
                   <!--  </form> -->
                </ul>
            </div>
            
            
        </div>
        
        
    </div>
    
</main>
   
   

   
<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
<script src="<c:url value = "/js/main.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>




<script type="text/javascript">

//엔터키 입력 이벤트
$("#email_auth").keydown(function(key) {

   if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
      $("#emailsubmit").click();
   }
   
});

   let chk1 = true
   const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    
   $('#userEmail').on('focusout',function(){  
        if(!getMail.test($("#userEmail").val())){
               $('#userEmail').css("background-color","pink");
               $("#emailChk").html("<b style='font-size:14px; color:red;'> 이메일 형식이 잘못 되었습니다. </b>");
               $("#submit_btn").prop("disabled",true);
            }
   });
   
   
$(document).ready(function() {
    document.getElementById('auth_div').style.display="none";
});
   
   
   
/* 인증번호 이메일을 발송하고 인증번호 입력창을 띄워주는  */   
function sendChkMail(){

	var email = document.getElementById('userEmail');  
	
	 if($(':input:checkbox[id=agree]:checked').val() === 'true' && $(':input:checkbox[id=agree2]:checked').val() === 'true' ){
		 $.ajax({
		         type:"POST",
		         url:"/member/auth",
		         headers:{
		            "Content-Type":"application/json"
		         },
		         dataType:"text",
		         data:$(email).val(),
		         success:function(result){
		        	alert('인증번호가 발송되었습니다. 인증번호를 적어주세요.'); 
		            document.getElementById('submit_btn').style.display="none";
		            document.getElementById('auth_div').style.display="block";
		            
		            document.getElementById('dice').value = result;
		         },
		         error:function(){
		            console.log("서버와 통신 실패1");
		            alert('이메일 입력 후 중복확인을 먼저 해주세요.');
		         }
		      });
  }else{
       alert("이용약관 및 개인정보처리방침에 모두 동의해주세요.");
       $('#next').prop('disabled',true);
  }  
	 
	 
	 
}   
   

// 인증번호 비교 
function chkCode(){

	 var email_auth = document.getElementById('email_auth');

	 $.ajax({
        type:"POST",
        url:"/member/join_auth",
        headers:{
           "Content-Type":"application/json"
        },
        dataType:"text",
        data:$(email_auth).val(),
        success:function(result){
        	 if(result==="YES"){
             	alert("인증성공! 정보입력 페이지로 이동됩니다.");
             	location.replace("/member/send_join");
        	 } else{
                 $("#email_auth").css("border-color","red");
                 $("#auth_alert").html("<b style='font-size:12px; color:red;'> 인증번호를 다시 확인해 주세요. </b>");
              }
        },
        error:function(){
           console.log("서버와 통신 실패3");
        }
     });
}     
   
   
   
// 1) 이메일 중복확인 onclick 이벤트
function isOverRap(){
   
   var email = document.getElementById('userEmail');  
   
    // 이메일 공백 체크
      if($(email).val()===""){
         $('#userEmail').css("background-color","pink");
         $("#emailChk").html("<b style='font-size:14px; color:red;'> 이메일은 필수 정보입니다. </b>");
         $("#submit_btn").prop("disabled",true);
      }
      // 이메일 유효성 검증 (형식에 맞는지 검사)
      else if(!getMail.test($("#userEmail").val())){
         $('#userEmail').css("background-color","pink");
         $("#emailChk").html("<b style='font-size:14px; color:red;'> 이메일 형식이 잘못 되었습니다. </b>");
         $("#submit_btn").prop("disabled",true);
      }
      // 이메일 제대로 썼을 때: 중복확인 비동기 통신
      else{
      
         $.ajax({
            type:"POST",
            url:"/member/checkEmail",
            headers:{
               "Content-Type":"application/json"
            },
            dataType:"text",
            data:$(email).val(),
            success:function(result){
               if(result==="OK"){
                  $("#emailChk").html("<b style='font-size:14px; color:green;'> 사용가능한 이메일입니다. </b>");
               } else{
                  $("#userEmail").css("background-color","pink");
                  $("#emailChk").html("<b style='font-size:14px; color:red;'> 이미 가입된 이메일입니다. </b>");
               }
               $("#submit_btn").prop("disabled",false);
            },
            error:function(){
               console.log("서버와 통신 실패4");
            }
         });
      }   
}
   


</script>
</body>
 <jsp:include page="../include/footer.jsp" /> 
</html>