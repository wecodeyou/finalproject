<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<input type="hidden" name="cInput" id="cInput" value="" />
	<div id="myodal" class="odal">
		<!-- 모달 내용 -->
		<div class="odal_content">
			<form action="<c:url value='/review/write' />" method="POST">
				<div class="odal-header">
					<div class="odal_title_large">수강 후기</div>
					<br>
					<div class="odal_title_small">${proName}</div>
				</div>
				<br>
				<div class="odal_body">
					<p class="star_rating">
						<a href="#">★</a>
						<a href="#">★</a>
						<a href="#">★</a>
						<a href="#">★</a>
						<a href="#">★</a>
					</p>
					<textarea name="content" id="content"
						placeholder="수강후기를 자유롭게 입력해주세요." required="required"></textarea>
					<br>
					<br> <input type="hidden" name="reviewUser"
						value="${login.userEmail}">
				</div>
				<div class="odal_footer">
					<input type="button" class="cancel" value="cancel"
						onclick="odalClose()"> <input type="submit" id="submit"
						value="send"
						onclick="return confirm('수강후기는 한번 작성한 후 수정이 불가합니다. 작성하시겠습니까?')">
				</div>
			</form>
		</div>
		<div class="odal_layer"></div>
	</div>
	
<!-- 별점 -->
<script>
		//별점
		$(".star_rating a").click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			return false;
		});
		
		
	       var arr_1 = window.dialogArguments["arr"];
	        var arr_2 = window.dialogArguments["arr2"];

	        var str = '부모창에서 넘어온 arr값 : ' + arr_1 + '<br />';
	        str += '부모창에서 넘어온 arr2값 : ' + arr_2 + '<br />';
	        document.write(str);   


	</script>
</body>
</html>