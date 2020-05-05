<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${login.userName}님  <a href="#"><button>MY ></button></a></h1>
<H2>사용 가능 코드머니	${login.userPoint}</H2>

코드 머니 충전&amp;사용 내역<br>
<hr>

조회기간 <button>1개월</button><button>3개월</button><button>6개월</button><button>1년</button>
<input type="text" name="s_date" value="2020-02-04" id="s_date" class="format_date hasDatepicker" size="10">
 ~ <input type="text" name="s_date" value="2020-02-04" id="s_date" class="format_date hasDatepicker" size="10">

<a href="#"><button>조회</button></a><br>




포인트를 바로 충전 가능하게 
라디오 버튼 형식으로 금액 선택 
결제 방법: 무통장, 카카오, 카드 등<br>	
<a href="#"><button>충전</button></a>  <br> 



</body>
</html>