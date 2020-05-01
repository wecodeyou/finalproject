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
		<h2 id="message" style="color:red"></h2>
		<table border="2">	
			<tr>
				<td>
				# 상품이름: 
				<input type="text" name="name" id="name"/>
				</td>
			</tr>
			<tr>
				<td>
				# 상품가격: 
				<input type="text" name="price"id="price"/>
				</td>
			</tr>
			<tr>
			<td>
				# 상품설명: 
				<input type="text" name="detail" id="detail"/>
			</td>
			</tr>
			<tr>
				<td>
				# 상품수량
			  <input type="number" id="seats" name="offSeats" min="1" max="300" value="1" readonly >
				</td>
			</tr>
			<tr>
				<td>
				<input type="text" id="thumb" name="thumb" value="https://res.cloudinary.com/dl5spujr5/image/upload/v1574920339/samples/animals/kitten-playing.gif" readonly/>
				</td>
			</tr>
			<tr>
				<td>
				#장소 
				<input type="text" id="place" name="place" />
				</td>
			</tr>
			<tr>
				<td>
				# 상품등록자: 
				<input type="text" name="author" id="author" value="kouri1004@gmail.com" readonly />
				</td>
			</tr>
			<tr>
				<td>
					# 상품종류: 
				<select name="type" id="type">
				<option value="0">온라인</option>
				<option value="1">오프라인</option>
				<option value="2">상품</option>			
				</select>
				</td>
			</tr>
			<tr>
				<td>
				# 강의종류: 
				<select name="off_Type" id="off_type">
				<option value="0">programming</option>
				<option value="1">cloud</option>
				<option value="2">network</option>
				<option value="3">system&server</option>
				<option value="4">hacking</option>
				<option value="5">database</option>
				<option value="6">자격증</option>					
				</select>
				</td>
			</tr>
			<tr>
			<td> #시작일
				<input type="date" name="off_start_at" id="start" />
				</td>
			</tr>
			<tr>
				<td>
					#종료일
				<input type="date" name="off_end_at" id="end"/>
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
				<button id="off_submit" >등록</button>
				</td>
			</tr>
		</table>		

	</div>
<script type="text/javascript">

	$(function(){

		console.log(sendTagList);

		$('#off_submit').click(function(){
			const type = $('#type').val();
			console.log(type);
			
			const name = $('#name').val();
			console.log(name);

			const price = $('#price').val();
			console.log(price);

			const detail = $('#detail').val();
			console.log(detail);

			const thumb = $('#thumb').val();
			console.log(thumb);
			
			const author = $('#author').val();
			console.log(author);
			
			const off_type = $('#off_type').val();
			console.log(off_type);
			
			const start = $('#start').val();
			console.log(start);
			
			const end = $('#end').val();
			console.log(end);
			
			const seats = $('#seats').val();
			console.log(seats);
			
			const place = $('#place').val();
			console.log(place);
			
			var data = {
					productType : type,
					productName : name,
					productPrice : price,
					productDetail : detail,
					productThumb : thumb,
					offAuthor : author,
					offCategory : off_type,
					offPlace : place,
					offSeats : seats,
					offStartAt : start,
					offEndAt : end,
					sendTagList: sendTagList
				}
			$.ajax({
				type: "POST",
				url : "<c:url value='/off/register'/>",
				headers:{
					"Content-Type": "application/json"
				},
				dataType: "text",
				data:JSON.stringify(data),
				success: function(data){
					console.log("received output: " + data);
					if(data === "off_success"){
						location.href = "/product";
					} else{
						$('#message').text("서버에러가 발생하였습니다");
					}
				},
				error: function(request, status, error){
					$('#message').text("통신에 실패하였습니다");
				}
			}); /* end ajax */			
		});
	});

</script>

<script src="<c:url value='/js/tag.js'/>"></script>

</body>
</html>