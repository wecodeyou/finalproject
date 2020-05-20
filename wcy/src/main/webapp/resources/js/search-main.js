//start jQuery
$(function() {

	//검색 버튼 이벤트 처리
	$("#search-btn").click(
			function() {
				console.log("검색 버튼이 클릭됨!");
				const keyword = $("#search-input").val();
				
				console.log("검색어: " + keyword);

				const condition = "titleContent";
				var url = "/search?q=" + keyword;
				location.href = "/search?q=" + keyword + "&condition=" + condition;

			});

	//엔터키 입력 이벤트
	$("#search-input").keydown(function(key) {

		if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
			$("#search-btn").click();
		}

	});

});//end jQuery

