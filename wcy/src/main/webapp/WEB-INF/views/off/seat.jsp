<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.ccheck input[type="checkbox"] {
	display:none;
}

.ccheck label{
	width:100%;
	height:24px;
}
.ccheck input[type="checkbox"] + label .chk_img {
	padding:0 0 0 30px;
	background:url("/img/icons/checkbox_unchecked.png")no-repeat;
	cursor:pointer;
}
.ccheck input[type="checkbox"]:checked + label .chk_img {
	background:url("/img/icons/checkbox_choosed.png")no-repeat;
	cursor:pointer;
}

.seatchoiceBtn {
    border: 1px solid #F44336;
    border-radius: 5px;
    height: 25px;
    color: #F44336;
    font-size: 15px;
    min-width: 75px;
    display: inline-block;
    padding: 2px;
    cursor:pointer;
    background: #fff;
    float: right;
    margin-right: 137px;
}
.seatchoiceBtn:hover{
	color: #fff;
	background: #F44336;
}

.blackboard:after{
	display: block;
    content: '';
    width: 247px;
    height: 30px;
    background: #4CAF50;
    position: absolute;
    top: 3px;
    z-index: -1;
    border-radius: 3px;
}
.blackboard span{
	color: #fff;
    margin-left: 89px;
}

.door span{
	position: absolute;
    right: 95px;
    top: -6px;
    font-size: 12px;
    line-height: 1.1;
}

.door{
   float: right;
   position: absolute;
	top: 43px;
    right: -84px;
   color:#9E9E9E;
}
.door:before{
	display: inline;
    content: '';
    width: 12px;
    height: 25px;
    position: absolute;
    right: 113px;
    background: #9E9E9E;
    border-radius: 1px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
   integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
   crossorigin="anonymous"></script>
</head>
<body>
<!-- 일단 30에서만 작업해야지  -->

<input type="hidden" id="seatOffNo" value="${off_no}" >
	<div class="blackboard"><span> 칠판부분 </span></div><br><br>
	<div class="door"><span>출입문</span></div>
	<form action="<c:url value='/off/chooseSeat' />" method="post" id="submit">
	<input type="hidden" name="off" value="${off_no}"/>
		<c:forEach var="y" begin="1" end="5">
			<div class="ccheck">
			<c:forEach var="x" begin="1" end="6">
			<c:if test="${x==4}">&nbsp;&nbsp;</c:if>
			<input type="checkbox" name="Chk_name" id="Chk_id${x}${y}"
              	 onclick=showpicks(this) value="${x}${y}"/>
				<label for="Chk_id${x}${y}">
					<span class="chk_img" id="span${x}${y}">&nbsp;</span>
				</label>

            </c:forEach>
			</div><br>
		</c:forEach>
		<button type="button" onclick="nullCheck()" class="seatchoiceBtn">선택완료</button>
	</form>
<script type="text/javascript">
$(document).ready(function() {// 페이지가 켜지자마자 
   // ajax로 seat table의 index 정보를 가져와서 
   // 정보가 있는건 checked 와 disable 넣어주기
   $.ajax({
        type: "POST",
        url : "/off/selectChecked",   
        headers:{
            "Content-Type":"application/json"
        },
      data: document.getElementById('seatOffNo').value,
        success: function(result){ 
           console.log(result.list);
           var id;
           for (var i = 0; i < result.list.length; i++) {
            id = "Chk_id"+result.list[i];
            document.getElementById(id).disabled = true;
            span = "span"+result.list[i];
            document.getElementById(span).style.backgroundImage = "url('/img/icons/checkbox_checked.png')";
            document.getElementById(span).style.cursor = "default";
         }
             
      },   
      error: function(){      
         console.log("서버 통신 실패");                   
      } 
    
   });
});

</script>   
   
   
<script type="text/javascript">
$(document).ready(function() {
    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
    $('input[type="checkbox"][name="Chk_name"]').click(function(){
        //클릭 이벤트 발생한 요소가 체크 상태인 경우
        if ($(this).prop('checked')) {
            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
            $('input[type="checkbox"][name="Chk_name"]').prop('checked', false);
            $(this).prop('checked', true);
        }
    });
});
</script>

<script type="text/javascript">
var click_id;
var sub_id;
var id;
function showpicks(obj) {
   click_id = $(obj).attr('id');
   sub_id = click_id.substr(7,1);
   id = click_id.substr(6,2);
   if(document.getElementById(click_id).checked){
      console.log(id);
      console.log(sub_id+"번줄 선택")
   }
}
   
</script>

<script type="text/javascript">			   
function nullCheck(){
	var isChk = false;
	var arr = document.getElementsByName("Chk_name");
	for(var i=0;i<arr.length;i++){
		if(arr[i].checked == true) {
			isChk = true;
			break;
		}
	}
					
	if(!isChk){
		alert("아무 자리도 선택하지 않았습니다.");
		return false;
	}else{
				           
		var parent = window.opener;
		//var answer = document.getElementById(id).value; 
		parent.document.getElementById('get').value = id;
		parent.document.getElementById('seat_no').value = id;
					
		window.close();
		//document.getElementById("submit").submit();
	}
}   			   
</script>
</body>
</html>