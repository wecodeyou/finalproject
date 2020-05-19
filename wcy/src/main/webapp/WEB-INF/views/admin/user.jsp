<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon/wcy-favicon.ico'/>">
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">


<!-- Custom fonts for this template-->
<!-- <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">

<!-- datatable-->
<link href="/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>

<title>WE CODE YOU | 회원 관리</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<style>

    p{line-height: 150% !important;}
    
    .center-header .center-sub-nav {width: 100%; background: #f4f4f4; border-radius: 5px; display: table; table-layout: fixed; margin-top: 20px; margin-bottom: 50px; overflow: hidden;}
    .center-header .center-sub-nav li{display: table-cell;}
    .center-header .center-sub-nav li a{display: block; height: 60px; box-sizing: border-box; font-size: 18px; color: #888; padding: 0 0 0 20px; line-height: 60px; border-bottom: 4px solid #ddd;}
    .center-sub-nav li a.active{color: #25283D; border-color: #25283D;}


</style>
</head>
<body>

<jsp:include page="../include/header-sub.jsp" />

<main class="wcy-main-content">
		<div class="wcy-contents">
			<div class="page-width">
				<div class="center-header">
					<ul class="center-sub-nav">
						<li><a href="<c:url value='/admin'/>">관리자 대시보드</a></li>
						<li><a class="active" >회원 관리</a></li>
						<li><a href="<c:url value='/admin/etc'/>">기타 관리</a></li>
						<li><a href="<c:url value='/product/'/>">상품 관리</a></li>
						
					</ul>
				</div>
			</div>
			<!-- Begin Page Content -->
			<div class="container-fluid">

				<div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>WE CODE YOU | 회원 목록</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>UserType</th>
                                                <th>Email</th>
                                                <th>Name</th>
                                                <th>Tel</th>
                                                <th>Created_at</th>
                                                <th>Login_at</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="m" items="${members}" varStatus = "status">
                                        		<tr>
                                        			<td>
                                        			<div style="text-align:center">
                                        				<c:if test="${m.userType == 0}">
                                        				<a href = "<c:url value='/admin/typechange?userNo=${m.userNo}'/>">일반회원</a>
                                        				</c:if>
                                        				<c:if test="${m.userType == 1}">
                                        				<a href = "<c:url value='/admin/typechange?userNo=${m.userNo}'/>">강사</a>
                                        				</c:if>
                                        				<c:if test="${m.userType == 2}">
                                        					*관리자
                                        				</c:if>
                                        				</div>
                                   
                                        			</td>
                                        			<td>${m.userEmail}</td>
                                        			<td>${m.userName}</td>
                                        			<td>${m.userTel}</td>
                                        			<td>${m.userCreatedAt}</td>
                                        			<td>${m.userLoginAt}</td>
                                        		</tr>
                                        	</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
			</div>
			<!-- /.container-fluid -->



		</div>
	</main>






   
<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
<script src="<c:url value = "/js/main.js"/>"></script>

<!-- 여기서부터 부트스트랩 -->
<!-- Bootstrap core JavaScript-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/js/demo/chart-area-demo.js"></script>
<script src="/js/demo/chart-pie-demo.js"></script>

<!-- 데이터 테이블 -->
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="/js/demo/datatables-demo.js"></script>

<!-- 여기까지 -->  

<script type="text/javascript">
	

</script>

</body>
<jsp:include page="../include/footer.jsp" /> 
</html>