<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.css" />


<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
	integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
	crossorigin="anonymous"></script>

<style type="text/css">

.content{padding: 10px;}

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
	color: #ff572275 !important;
	text-decoration: none;
	cursor:pointer;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #F44336 !important;
}

.title_large{
	font-size: 25px;
    font-weight: 600;
}

.title_small{
	color: #605e5e;
}
._body{margin-top: -6px;}

.footer{float:right;margin-right: 13px;}

</style>
</head>
<body>

		<div class="content">
			<form action="<c:url value='/review/write' />" method="POST" id="write_form">
			<input type="hidden" name="reviewProductNo" value="${pno}"/>
			<input type="hidden" name="reviewUser" value="${writer}"/>
			<input type="hidden" name="reviewStar" value="" id="starValue"/>
				<div class="-header">
					<div class="title_large">수강 후기 작성</div>
					<br>
					<div class="title_small">강의명 : ${proName}</div>
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
						placeholder="수강후기를 자유롭게 입력해주세요." required="required" cols="90" rows="6" style="resize:none;background: #e5e4e452;padding: 8px;color: #505050;"></textarea>
					<br>
					<br> 
				</div>
				<div class="footer">
					<button type="button" class="cancel btn btn-outline-danger" value="cancel" onclick="window.close()">취소</button>
					<button type="button" id="submit_btn" class="btn btn-outline-info" value="send" >작성</button>
				</div>
			</form>
		</div>
		<div class="_layer"></div>

	
   <script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
   <script src="<c:url value = "/js/main.js"/>"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>
	
<!-- 별점 -->
<script type="text/javascript">


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
	
	Swal.fire({
		  title: '작성하시겠습니까?',
		  text: "수강후기는 한번 작성한 후 수정이 불가합니다.",
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'YES',
		}).then((result) => {
			 if (result.value) {
				Swal.fire(
			      '작성완료!',
			      '수강후기가 등록되었습니다.',
			      'success'
			    )
				form.submit();
				setTimeout(function() {
					opener.location.replace("<c:url value='/mypage/' />");
					window.close();
				}, 2000);
		    }
		})
	
/* 	if(confirm('수강후기는 한번 작성한 후 수정이 불가합니다. 작성하시겠습니까?')){
		form.submit();
		setTimeout(function() {
			opener.location.replace("<c:url value='/mypage/' />");
			window.close();
		}, 10);
	} */
});

</script>
</body>
</html>