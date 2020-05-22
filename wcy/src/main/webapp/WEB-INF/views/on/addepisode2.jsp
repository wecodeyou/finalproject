<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

</head>
<body>
<h1>온라인 에피소드 등록</h1>
<form action = "/on/addepisode" method = "post">
<input type = "hidden" name = "productNo" value = "${product.productNo}">
<table border = "2" width = 70% align = "center">

	<tr>
		<td>상품번호</td><td>${product.productNo}</td></tr>
		<tr>
		<td>상품명</td><td>${product.productName}</td></tr>
		
		<tr><td>강사명</td><td>${login.userEmail}</td></tr>
<!-- 		<tr><td>강의카테고리</td>   
							<td>
								<select name="onType" id="onType">
									<option value="0">programming</option>
									<option value="1">cloud</option>
									<option value="2">network</option>
									<option value="3">system&server</option>
									<option value="4">hacking</option>
									<option value="5">database</option>
									<option value="6">자격증</option>					
								</select>
							</td></tr>
		<tr><td>강의일수</td><td><input type = "text" name = "days" required></td></tr> -->
		<tr><td>회차수</td><td><input type = "number" name = "rowNum" id = "rowNum" required>
			<input name="addButton" type="button" style="cursor:hand" onClick="insertRow()" value="추가"></td></tr>
		<tr><td colspan =2>  
		<table id="addTable" border = 0>
<!-- 			<tr>
              <td>강좌명<input type="text" name="episodeName" style = "width :400px"></td>
              <td>강좌경로<input type="text" name="episodeSource" style = "width :400px"></td>                        
         	</tr>  -->
          </table>
          </td>
		<tr><td colspan = 2 align = "right"><input type = "submit" value = "등록하기"></td>
</table>
</form>

<script type = "text/javascript">

	function insertRow(){
		
		var rowNum = document.getElementById("rowNum").value;

		for (let i = 0; i < rowNum;i++){
			
				insRow();
			}
	}

	
	//Row 추가	
	function insRow() {
		var oTbl = document.getElementById("addTable");
		var oRow = oTbl.insertRow();
		//oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
		var oCell = oRow.insertCell();
		var oCell2 = oRow.insertCell();
		//삽입될 Form Tag
		var frmTag  = "강좌명<input type=text name=episodeName style=width:400px;>";
		var frmTag2 = "강좌경로<input type=text name=episodeSource value=/resources/vendor/videos/ style=width:400px;>"
	/* 	frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>"; */
		oCell.innerHTML = frmTag;
		oCell2.innerHTML = frmTag2;
	}


</script>

</body>
</html>