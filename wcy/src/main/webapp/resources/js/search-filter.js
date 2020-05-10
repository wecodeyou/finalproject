
$(document).ready(function(){
	
	//condition 검사
	var con = $("#reseult-con").val();
	
	if(con === "title"){
		console.log(con);
		$("#condition").val("title").attr("selected","true");
	} else if(con === "titleContent") {
		console.log(con);
		$("#condition").val("titleContent").attr("selected","true");
	} else if(con === "hashtag") {
		console.log(con);
		$("#condition").val("hashtag").attr("selected","true");
	} else {
		return;
	}
	
});


//filter 조건에 따른 이벤트
jQuery('#condition').change(function() {
	var state = jQuery('#condition option:selected').val();
	if ( state == 'hashtag' ) {
		//input 창에 "#" 추가
		document.getElementById("keywordInput").value = "#";
	} else {
		//input 창에 "#" 빼기
		var input = $("#keywordInput").val();
		var keyword = input.replace(/#/gi, "");
		console.log("input: " +keyword);
		document.getElementById("keywordInput").value = keyword;
	}
});

//클릭 시 이벤트
	$(function() {

		//목록 개수가 변동하는 이벤트 처리
		$("#count-per-page .btn-izone").click(function() {
			console.log("목록 버튼이 클릭됨!");
			console.log($(this).val());
			let count = $(this).val();
			//location.href = "/board/list?countPerPage=" + count;
		});

		//검색 버튼 이벤트 처리
		$("#searchBtn").click(
				function() {
					console.log("검색 버튼이 클릭됨!");
					const t = $("#keywordInput").val();
					
					if(t == "" || t == " ") {
						alert("검색어를 입력해주세요!");
						return;
					}
					var keyword = "";
					//특수문자 제거
					var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
					if(regExp.test(t)){
						keyword = t.replace(regExp, "");
					}else {
						keyword = t;
					}
					
					console.log("검색어: " + keyword);

					const condition = $("#condition option:selected").val();
					console.log("검색 조건: " + condition);
					
					//type 검사
					var type = $("#reseult-type").val();
					
					if(type === "0" || type === "1" || type === "2" || type === "3") {
						location.href = "/search?q=" + keyword + "&condition=" + condition + "&productType=" + type;
					}else {
						location.href = "/search?q=" + keyword + "&condition=" + condition;
					}

					

				});

		//엔터키 입력 이벤트
		$("#keywordInput").keydown(function(key) {

			if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
				$("#searchBtn").click();
			}

		});

	});//end jQuery