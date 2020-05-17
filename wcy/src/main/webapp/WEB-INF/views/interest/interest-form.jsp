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
	.modal {
            display: none; 
            position: fixed; /* 위치 고정 */
            z-index: 1; /* 맨 위로 띄우기 */
            left: 0;
            top: 0;
            max-width: 100%;
            width: 100%;
            height: 100%; 
            overflow: auto; /* 내용이 길어지면 스크롤 */
        }
		
		.modal button {
			display:inline-block;
			width:100px;
			margin-left:calc(100% - 100px - 10px);
		}
		
		.modal .modal_content {
            /*border: 1px solid transparent;*/
            border: 20px solid transparent;
            border-radius: 10px; /* 테두리를 살짝 둥글게 */
            width: 40%; /* Could be more or less, depending on screen size */ 
            height: 450px;
            margin: 5% auto; /* 위와 중앙에서 5% 떨어지게 */
            padding: 20px;  /*모달과 모달 컨텐츠가 20px 떨어지게 */
			background-color: #fefefe; /* 모달 컨텐츠 컬러 */
            animation-name: animatetop;/* 에니메이션 */
            animation-duration: 0.6s
			
		}
        /* Add Animation */
            @keyframes animatetop {
            from {top: -300px; opacity: 0}
            to {top: 0; opacity: 1}
        }
    
        .modal .modal_layer {
			position:fixed;
			top:0;
			left:0;
			width:100%;
			height:100%;
			background-color: rgb(0,0,0); /* 투명도가 적용 안 될 때의 fallback color */
            background-color: rgba(0,0,0,0.7); /* 검정 투명도 */
			z-index:-1; /*가장 앞에 나오도록 제일 낮은 값 부여*/
		}
        
        .modal .modal_title_large {
            display: inline-block;
            font-size: 30px;
            font-weight: bold;
            margin-right: 10px;
            margin-left: 10px;
            max-width: 85%;
            opacity: .8;
            overflow: hidden;
            padding-bottom: 10px;
            text-overflow: ellipsis;
            vertical-align: middle;
        }
        
        .modal .modal_title_small {
            display: inline-block;
            font-size: 16px;
            opacity: .6;
            vertical-align: middle;
        }
        
        /* Modal Header */
        .modal-header {
            color: white;
            background-color: #EFF0F1;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        /* Modal Body */
        /*.modal-body {padding: 2px 16px;}*/

        /* Modal Footer */
        /*.modal-footer {
            padding: 2px 16px;
            background-color: #5cb85c;
            color: white;
        }*/
    
        /* 상단 닫기 버튼 */
        .modal .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .modal .close:hover,
    
        .modal .close:focus {
            color: pink;
            text-decoration: none;
            cursor: pointer;
        }
    
    .write {padding: 3px; border: 2px solid #d2e1e7; background: #f9f9f9}
    .input_txt {display: block; width: 100%; height: 20px; border: 0 none; background: #f9f9f9}
	
	</style>
</head>
<body>

	<br>
	
	<!-- 전체 설문조사 리스트에서 타입의 수 (예: 4개) 만큼 반복해서 체크박스 생성  -->
	<c:forEach var="type" items="${typeList}" varStatus="status" >
		<c:set var="t1" value="${type.interestListType}" />
			${type.interestListQuestion}<br>
			<c:forEach var="all" items="${allInterest}" >
				<c:set var="a1" value="${all.interestListType}" />
					<c:if test="${a1 eq t1}">
    					<input type="checkbox" name="${status.index}" value="${all.interestListId}"  id="form-input" class="${status.index}" 
    						 >${all.interestListAnswer}
					</c:if>
			</c:forEach>
			<br><br>
	</c:forEach>
	<input type="button" id="insert-btn" value="완료">
	<!-- </form>-->
	<br><br><br>
	<!-- 설문조사 건너뛰기 버튼 -->
	<button id="btn-skip" onclick="location.href='메인.jsp'">Skip</button>
	
	
	<script src="<c:url value = "/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
	<script src="<c:url value = "/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
	
<script>  

	/* 전체 타입 목록 개수 */
	const n = 4;
	
	// insert-btn 클릭 이벤트
	$("#insert-btn").click(function() {
	//function formCheck(){
		let map = new Map();
		var option_cnt = 0; 
		for (var i = 0; i < n; i++) {
			var chkbox = $("." + i); //class명 
			for (j = 0; j < chkbox.length; j++) {
				if (chkbox[j].checked == true) {
					map.set(option_cnt, chkbox[j].value);
					console.log("map: " +map + " getting value of map: " + map.get(option_cnt));
					option_cnt++;
				}
			}
		}
		console.log("처리완료");
		
		//Ajax로 값 넘기기 (InterestVO 객체로)
		const interestUserNo = ${login.userNo};
		const interestIndex0 = map.get(0);
		const interestIndex1 = map.get(1);
		const interestIndex2 = map.get(2);
		const interestIndex3 = map.get(3);
		const interestIndex4 = map.get(4);
		const interestIndex5 = map.get(5);
		
		const ivo = {
				interestUserNo : interestUserNo,
				interestIndex0 : interestIndex0,
				interestIndex1 : interestIndex1,
				interestIndex2 : interestIndex2,
				interestIndex3 : interestIndex3,
				interestIndex4 : interestIndex4,
				interestIndex5 : interestIndex5
		};
		
		$.ajax({
			type: "POST",
			url: "/interest/insertInterest",
			headers: {
                "Content-Type": "application/json"
            },
			data: JSON.stringify(ivo),
			dataType : "text",
			success: function(data) {
				console.log("통신성공 ! result: " + data);
				if(data === "success") {
			    	console.log("입력성공! ");
					//self.location="/wecodeyou/WEB-INF/views/interest/interest-result.jsp";
				}else if(data === "already exist") {
					alert("이미 설문조사가 등록되어있어요!");
				}
			},
			error: function(){
				console.log("통신실패! ");
			}
		});
	//}
	});
	
</script>


	
</body>
</html>