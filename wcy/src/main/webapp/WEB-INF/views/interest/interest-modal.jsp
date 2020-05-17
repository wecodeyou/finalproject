<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WE CODE YOU | 설문조사</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<script src="<c:url value = "/resources/js/kakao.js"/>"></script>

<style>
body {
    background-color: rgb(0,0,0); /* 투명도가 적용 안 될 때의 fallback color */
    background-color: rgba(0,0,0,0.7); /* 검정 투명도 */
}

.signup-form {
	font-family: "Roboto", sans-serif;
	width: 935px;
	/* width: 650px; */
	margin: 25px auto;
	background: linear-gradient(to right, #ffffff 0%, #fafafa 50%, #ffffff 99%);
	border-radius: 10px;
}

.form-header {
	background-color: #EFF0F1;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.form-header h1 {
	font-size: 30px;
	text-align: center;
	color: #666;
	padding: 20px 0;
	border-bottom: 1px solid #cccccc;
	margin-top:98px;
}

/* Form Body */
.form-body {
	padding: 10px 40px;
	color: #666;
}

.form-group {
	margin-bottom: 20px;
}

.form-body .label-title {
	color: #1BBA93;
	font-size: 17px;
	font-weight: bold;
	margin:7px;
	display:block;
	margin-bottom:10px;
}

.form-body .form-input {
	display:block;
	font-size: 17px;
	box-sizing: border-box;
	width: 100%;
	height: 34px;
	padding-left: 10px;
	padding-right: 10px;
	color: #333333;
	text-align: left;
	background: white;
	outline: none;
	margin-bottom:27px;
	background: linear-gradient(to right, #ffffff 0%, #fafafa 50%, #ffffff 99%);
}

.horizontal-group .left {
	float: left;
	width: 49%;
}

.horizontal-group .right {
	float: right;
	width: 49%;
}

input[type="file"] {
	outline: none;
	cursor: pointer;
	font-size: 17px;
}

#range-label {
	width: 15%;
	padding: 5px;
	background-color: #1BBA93;
	color: white;
	border-radius: 5px;
	font-size: 17px;
	position: relative;
	top: -8px;
}

::-webkit-input-placeholder {
	color: #d9d9d9;
}

/* Form Footer */
.form-footer {
	clear: both;
}

.signup-form .form-footer {
	background-color: #EFF0F1;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	padding: 10px 40px;
	text-align: right;
	border-top: 1px solid #cccccc;
}

.form-footer span {
	float: left;
	margin-top: 10px;
	color: #999;
	font-style: italic;
	font-weight: thin;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #1BBA93;
	font-size: 17px;
	border: none;
	border-radius: 5px;
	color: white;
	cursor: pointer;
}

.btn:hover {
	background-color: #169c7b;
	
}

.skip-btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #d1d1d1;
	font-size: 17px;
	border: none;
	border-radius: 5px;
	color: white;
	cursor: pointer;
}

.skip-btn:hover {
	background-color: #ff1212;
	opacity: 0.8;
	
}

#wcy-interest-modal {
	animation-duration: 3s;
  	animation-name: slidein;
}



</style>
<body>
	<div class="signup-form" id="wcy-interest-modal" >
		<!-- form header -->
		<div class="form-header">
			<h1>WE CODE YOU | 첫 로그인 이벤트</h1>
		</div>
		
		<!-- form body -->
		<div class="form-body">
			<div class="horizontal-group">
					<c:forEach var="type" items="${typeList}" varStatus="status">
						<c:set var="t1" value="${type.interestListType}" />
						<label for="firstname" class="label-title">${type.interestListQuestion}</label>
						 	<div class="form-input">
								<c:forEach var="all" items="${allInterest}">
									<c:set var="a1" value="${all.interestListType}" />
										<c:if test="${a1 eq t1}">
											<input type="checkbox" name="${status.index}"   
												value="${all.interestListId}" class="${status.index}">${all.interestListAnswer}
										</c:if>
								</c:forEach>
							</div>
					</c:forEach>
			</div>
		</div>
		<!-- form footer -->
		<div class="form-footer">
			<span>설문조사를 하시면 소정의 포인트를 드려요!</span>
			<button type="button"  id="insert-btn" class="btn">작성완료</button>
			<button type="button" id="skip-btn" class="skip-btn">건너뛰기</button>
		</div>
	</div>

	<script>
	
		var totalChecked = 0;	
	
		$('input:checkbox[name=0]').click(function(){ //고용형태 최대 3개까지
		  
		  var cntEPT = $('input:checkbox[name=0]:checked').length;
		  totalChecked++;
		  
		  if(cntEPT>3){
		   alert('최대 3개까지 선택 가능합니다.')
		   totalChecked--;
		   $(this).prop('checked', false);
		  }
		  
		  console.log("totalChecked : " + totalChecked);
		 });
		
		$('input:checkbox[name=1]').click(function(){ //고용형태 최대 3개까지
			  
			  var cntEPT = $('input:checkbox[name=1]:checked').length;
			  totalChecked++;
			  
			  if(cntEPT>1){
			   alert('최대 1개까지 선택 가능합니다.')
			   totalChecked--;
			   $(this).prop('checked', false);
			  }
			  
			  console.log("totalChecked : " + totalChecked);
		});
		
		$('input:checkbox[name=2]').click(function(){ //고용형태 최대 3개까지
			  
			  var cntEPT = $('input:checkbox[name=2]:checked').length;
			  totalChecked++;
			  
			  if(cntEPT>1){
			   alert('최대 1개까지 선택 가능합니다.')
			   totalChecked--;
			   $(this).prop('checked', false);
			  }

			  console.log("totalChecked : " + totalChecked);
		});
		
		$('input:checkbox[name=3]').click(function(){ //고용형태 최대 3개까지
			  
			  var cntEPT = $('input:checkbox[name=3]:checked').length;
			  totalChecked++;
			  
			  if(cntEPT>1){
			   alert('최대 1개까지 선택 가능합니다.')
			   totalChecked--;
			   $(this).prop('checked', false);
			  }

			  console.log("totalChecked : " + totalChecked);
		});
		
		

		
		

		/* 전체 타입 목록 개수 */
		const n = 4;

		// insert-btn 클릭 이벤트
		$("#insert-btn").click(
				
				function() {
					
					if(totalChecked < 6){
						alert("빠뜨린 문항이 있어요! 다시 한 번 확인해주세요.");
						return;
					}
					
					let map = new Map();
					var option_cnt = 0;
					for (var i = 0; i < n; i++) {
						var chkbox = $("." + i); //class명 
						for (j = 0; j < chkbox.length; j++) {
							if (chkbox[j].checked == true) {
								map.set(option_cnt, chkbox[j].value);
								console.log("map: " + map
										+ " getting value of map: "
										+ map.get(option_cnt));
								option_cnt++;
							}
						}
					}
					console.log("처리완료");

					//Ajax로 값 넘기기 (InterestVO 객체로)
					const interestIndex0 = map.get(0);
					const interestIndex1 = map.get(1);
					const interestIndex2 = map.get(2);
					const interestIndex3 = map.get(3);
					const interestIndex4 = map.get(4);
					const interestIndex5 = map.get(5);

					const ivo = {
						interestIndex0 : interestIndex0,
						interestIndex1 : interestIndex1,
						interestIndex2 : interestIndex2,
						interestIndex3 : interestIndex3,
						interestIndex4 : interestIndex4,
						interestIndex5 : interestIndex5
					};

					$.ajax({
						type : "POST",
						url : "/interest/insertInterest",
						headers : {
							"Content-Type" : "application/json"
						},
						data : JSON.stringify(ivo),
						dataType : "text",
						success : function(data) {
							console.log("통신성공 ! result: " + data);
							if (data === "success") {
								console.log("입력성공! ");
								alert("감사합니다! 00포인트가 지급됩니다.");
								location.href = "/";
							} else if (data === "already exist") {
								alert("이미 설문조사가 등록되어있어요!");
							}
						},
						error : function() {
							console.log("통신실패! ");
						}
					});
					
				});

		// skip-btn 클릭 이벤트
		$("#skip-btn").click(function() {
			if (confirm("설문조사를 건너뛰면 포인트를 받을 수 없어요... 정말로 건너뛸까요?") == false) {
				return;
			} else {
				$.ajax({
					type : "POST",
					url : "/member/updateInterest",
					headers : {
						"Content-Type" : "application/json"
					},
					dataType : "text",
					success : function(data) {
						console.log("통신성공 ! result: " + data);
						if (data === "success") {
							console.log("설문조사 참여처리");
							location.href = "/";
						}
					},
					error : function() {
						console.log("통신실패! ");
					}
				});
			}
		});
	</script>
</body>
</html>