<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
	integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
	crossorigin="anonymous"></script>

<style type="text/css">

.star_rating {
	font-size: 0;
	letter-spacing: -4px;
	margin-bottom: 8px;
}

.star_rating a {
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 5px;
	color: #ccc;
	text-decoration: none;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #777;
}
</style>
</head>
<body>

		<div class="_content">
			<form action="<c:url value='/review/write' />" method="POST" id="write_form">
			<input type="hidden" name="reviewProductNo" value="${pno}"/>
			<input type="hidden" name="reviewUser" value="${writer}"/>
			<input type="hidden" name="reviewStar" value="" id="starValue"/>
				<div class="-header">
					<div class="_title_large">수강 후기</div>
					<br>
					<div class="_title_small">${proName}</div>
				</div>
				<br>
				<div class="_body">
					<p class="star_rating">
						<a onclick="choice1()">★</a>
						<a onclick="choice2()">★</a>
						<a onclick="choice3()">★</a>
						<a onclick="choice4()">★</a>
						<a onclick="choice5()">★</a>
					</p>
					<textarea name="content" id="content"
						placeholder="수강후기를 자유롭게 입력해주세요." required="required"></textarea>
					<br>
					<br> 
				</div>
				<div class="_footer">
					<input type="button" class="cancel" value="cancel" onclick="window.close()">
					<input type="button" id="submit_btn" value="send" />
				</div>
			</form>
		</div>
		<div class="_layer"></div>

	
<!-- 별점 -->
<script>
		//별점
		$(".star_rating a").click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			return false;
		});
		
function choice1(){
	document.getElementById('starValue').value = 1;
}
function choice2(){
	document.getElementById('starValue').value = 2;
}
function choice3(){
	document.getElementById('starValue').value = 3;
}
function choice4(){
	document.getElementById('starValue').value = 4;
}
function choice5(){
	document.getElementById('starValue').value = 5;
}

$("#submit_btn").click(function(){
	var form = document.getElementById("write_form");
	if(confirm('수강후기는 한번 작성한 후 수정이 불가합니다. 작성하시겠습니까?')){
		form.submit();
		setTimeout(function() {
			opener.location.replace("<c:url value='/mypage/' />");
			window.close();
		}, 10);
	}
});

</script>
</body>
</html>