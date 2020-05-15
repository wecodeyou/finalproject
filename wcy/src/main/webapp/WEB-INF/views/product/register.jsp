<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/css/tag.css'/>">
<title>오프라인 강의 추가</title>
<!-- <script src="${pageContext.request.contextPath}/resources/vendor/js/jquery-3.4.1.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>	
	
	
	<div>

		<table border="2">	
			<tr>
				<td>
				# 상품이름: 
				<input type="text" name="productName" id="name"/>
				</td>
			</tr>
			<tr>
				<td>
				# 상품가격: 
				<input type="text" name="productPrice"id="price"/>
				</td>
			</tr>
			<tr>
			<td>
				# 상품설명: 
				<input type="text" name="productDetail" id="detail"/>
				</td>
			</tr>
			<tr>
			<td>
				<input type="text" id="thumb" name="productThumb" value="https://res.cloudinary.com/dl5spujr5/image/upload/v1588318932/samples/KakaoTalk_20200330_102631863_oxod5r.jpg" readonly/>
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
			<td>
				# 상품종류: 
				<select name="productType" id="type">
				<option value="0">온라인</option>
				<option value="1">오프라인</option>
				<option value="2">상품</option>				
				</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="text" placeholder="#해시태그">
					<ul class="override" id="resultList"></ul>
				</td>
			</tr>
			<tr>
				<td>
				<div id="selectedTagList"></div> 
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" id="product_register_btn" value="등록"/>
				</td>
			</tr>
		</table>		
	</div>
<script type="text/javascript">
$(function(){
	$("#product_register_btn").click(function(){
		
		const type = $("#type").val();
		console.log(type);
		
		const name = $("#name").val();
		console.log(name);

		const price = $("#price").val();
		console.log(price);

		const detail = $("#detail").val();
		console.log(detail);

		const thumb = $("#thumb").val();
		console.log(thumb);

		
		var productInfo = {
				productType : type,
				productName : name,
				productPrice : price,
				productDetail : detail,
				productThumb : thumb,
				sendTagList: sendTagList
			}
			$.ajax({
				type: "POST",
				url : "/product/register",
				headers:{
					"Content-Type": "application/json"
				},
				dataType: "text",
				data:JSON.stringify(productInfo),
				success: function(data){
					console.log("received output : " + data);
					if(data === "product_success"){
							location.href = '/product';
						}
					
				},
				error: function(request, status, error){
					console.log("POST : /product/register 요청에 실패했습니다.")
				}
			}); /* end ajax */
	});
});

</script>

<script src="<c:url value='/js/tag.js'/>"></script>

</body>
</html>