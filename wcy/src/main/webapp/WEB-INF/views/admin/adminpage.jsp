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

<title>WE CODE YOU | 관리자 페이지</title>
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
			<button onclick="a()">test</button>
				<div class="center-header">
					<ul class="center-sub-nav">
						<li><a class="active">관리자 대시보드</a></li>
						<li><a href="<c:url value='/admin/user'/>">회원 관리</a></li>
						<li><a href="<c:url value='/admin/etc'/>">기타 관리</a></li>
					</ul>
				</div>
			</div>
			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- Page Heading -->
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800">한 눈에 보기</h1>
					<a href="#"
						class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
						class="fas fa-download fa-sm text-white-50"></i> 월간 리포트 등록</a>
						
				</div>

				<!-- Content Row -->
				<div class="row">

					<!-- Earnings (Monthly) Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div class="text-s font-weight-bold text-primary text-uppercase mb-1">
											${thisMonthly.purchaseM}월 수입</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">
											<fmt:formatNumber type="currency" value="${thisMonthly.earningMonthly}" />
										</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-calendar fa-2x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Earnings (Monthly) Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-success shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div class="text-s font-weight-bold text-success text-uppercase mb-1">
											${thisAnnual.purchaseY}년 수입</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">
											<fmt:formatNumber type="currency" value="${thisAnnual.earningAnnual}" />
										</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Earnings (Monthly) Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-danger shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div class="text-s font-weight-bold text-danger text-uppercase mb-1">이달의 환불 ${thisMonthly.refundCount/thisMonthly.purchaseCount*100}%</div>
										<div class="row no-gutters align-items-center">
											<div class="col-auto">
												<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">총 ${thisMonthly.refundCount}개
												</div>
											</div>
											<div class="col">
												<div class="progress progress-sm mr-2">
													<div class="progress-bar bg-danger" role="progressbar"
														style="width: ${thisMonthly.refundCount/thisMonthly.purchaseCount*100}%" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Pending Requests Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-warning shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-s font-weight-bold text-warning text-uppercase mb-1">건의사항</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">18건</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-comments fa-2x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Content Row -->

				<div class="row">

					<!-- Area Chart -->
					<div class="col-xl-8 col-lg-7">
						<div class="card shadow mb-4">
							<!-- Card Header - Dropdown -->
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">수익 그래프</h6>
								<div class="dropdown no-arrow">
									<a class="dropdown-toggle" href="#" role="button"
										id="dropdownMenuLink" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> <i
										class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
									</a>
									<div
										class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
										aria-labelledby="dropdownMenuLink">
										<div class="dropdown-header">Dropdown Header:</div>
										<a class="dropdown-item" href="#">Action</a> <a
											class="dropdown-item" href="#">Another action</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">Something else here</a>
									</div>
								</div>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-area">
									<canvas id="myAreaChart"></canvas>
								</div>
							</div>
						</div>
					</div>

					<!-- Pie Chart -->
					<div class="col-xl-4 col-lg-5">
						<div class="card shadow mb-4">
							<!-- Card Header - Dropdown -->
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">Revenue
									Sources</h6>
								<div class="dropdown no-arrow">
									<a class="dropdown-toggle" href="#" role="button"
										id="dropdownMenuLink" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> <i
										class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
									</a>
									<div
										class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
										aria-labelledby="dropdownMenuLink">
										<div class="dropdown-header">Dropdown Header:</div>
										<a class="dropdown-item" href="#">Action</a> <a
											class="dropdown-item" href="#">Another action</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">Something else here</a>
									</div>
								</div>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-pie pt-4 pb-2">
									<canvas id="myPieChart"></canvas>
								</div>
								<div class="mt-4 text-center small">
									<span class="mr-2"> <i
										class="fas fa-circle text-primary"></i> Direct
									</span> <span class="mr-2"> <i
										class="fas fa-circle text-success"></i> Social
									</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
										Referral
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Content Row -->
				<div class="row">

					<!-- Content Column -->
					<div class="col-lg-6 mb-4">

						<!-- Project Card Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
							</div>
							<div class="card-body">
								<h4 class="small font-weight-bold">
									Server Migration <span class="float-right">20%</span>
								</h4>
								<div class="progress mb-4">
									<div class="progress-bar bg-danger" role="progressbar"
										style="width: 20%" aria-valuenow="20" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
								<h4 class="small font-weight-bold">
									Sales Tracking <span class="float-right">40%</span>
								</h4>
								<div class="progress mb-4">
									<div class="progress-bar bg-warning" role="progressbar"
										style="width: 40%" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
								<h4 class="small font-weight-bold">
									Customer Database <span class="float-right">60%</span>
								</h4>
								<div class="progress mb-4">
									<div class="progress-bar" role="progressbar" style="width: 60%"
										aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<h4 class="small font-weight-bold">
									Payout Details <span class="float-right">80%</span>
								</h4>
								<div class="progress mb-4">
									<div class="progress-bar bg-info" role="progressbar"
										style="width: 80%" aria-valuenow="80" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
								<h4 class="small font-weight-bold">
									Account Setup <span class="float-right">Complete!</span>
								</h4>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: 100%" aria-valuenow="100" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>

						<!-- Color System -->
						<div class="row">
							<div class="col-lg-6 mb-4">
								<div class="card bg-primary text-white shadow">
									<div class="card-body">
										Primary
										<div class="text-white-50 small">#4e73df</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 mb-4">
								<div class="card bg-success text-white shadow">
									<div class="card-body">
										Success
										<div class="text-white-50 small">#1cc88a</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 mb-4">
								<div class="card bg-info text-white shadow">
									<div class="card-body">
										Info
										<div class="text-white-50 small">#36b9cc</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 mb-4">
								<div class="card bg-warning text-white shadow">
									<div class="card-body">
										Warning
										<div class="text-white-50 small">#f6c23e</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 mb-4">
								<div class="card bg-danger text-white shadow">
									<div class="card-body">
										Danger
										<div class="text-white-50 small">#e74a3b</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 mb-4">
								<div class="card bg-secondary text-white shadow">
									<div class="card-body">
										Secondary
										<div class="text-white-50 small">#858796</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 mb-4">
								<div class="card bg-light text-black shadow">
									<div class="card-body">
										Light
										<div class="text-black-50 small">#f8f9fc</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 mb-4">
								<div class="card bg-dark text-white shadow">
									<div class="card-body">
										Dark
										<div class="text-white-50 small">#5a5c69</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-6 mb-4">

						<!-- Illustrations -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
							</div>
							<div class="card-body">
								<div class="text-center">
									<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
										style="width: 25rem;" src="img/undraw_posting_photo.svg"
										alt="">
								</div>
								<p>
									Add some quality, svg illustrations to your project courtesy of
									<a target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
									a constantly updated collection of beautiful svg images that
									you can use completely free and without attribution!
								</p>
								<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse
									Illustrations on unDraw &rarr;</a>
							</div>
						</div>

						<!-- Approach -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Development
									Approach</h6>
							</div>
							<div class="card-body">
								<p>SB Admin 2 makes extensive use of Bootstrap 4 utility
									classes in order to reduce CSS bloat and poor page performance.
									Custom CSS classes are used to create custom components and
									custom utility classes.</p>
								<p class="mb-0">Before working with this theme, you should
									become familiar with the Bootstrap framework, especially the
									utility classes.</p>
							</div>
						</div>
						
						<!-- test -->
						<div class="card shadow mb-4">
							<canvas id="myChart" width="800" height="450"></canvas>
							<button id="sendAjax">sendAjax</button>
						</div>
						

					</div>
				</div>

			</div>
			<!-- /.container-fluid -->

		</div>
	</main>



<jsp:include page="../include/footer.jsp" /> 
   
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
<!-- 여기까지 -->  

<script type="text/javascript">
	
	var eL = Array();
	var eL2 = Array();
	for (var i = 0; i < 12; i++) {
		eL[i] = 0;
		eL2[i] = 0;
	}
	

	var dataVar = {
		labels : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug",
				"Sep", "Oct", "Nov", "Dec" ],
		datasets : [ {
			data : [eL[0], eL[1], eL[2], eL[3], eL[4], eL[5], eL[6],
				eL[7], eL[8], eL[9], eL[10], eL[11] ],
			label : "2020",
			lineTension : 0.5,
			backgroundColor : "rgba(78, 115, 223, 0.05)",
			borderColor : "rgba(78, 115, 223, 1)",
			pointRadius : 3,
			pointBackgroundColor : "rgba(78, 115, 223, 1)",
			pointBorderColor : "rgba(78, 115, 223, 1)",
			pointHoverRadius : 3,
			pointHoverBackgroundColor : "rgba(78, 115, 223, 1)",
			pointHoverBorderColor : "rgba(78, 115, 223, 1)",
			pointHitRadius : 10,
			pointBorderWidth : 2,
			fill: false,
		}/* ,{
			label: '2019',
			lineTension : 0.5,
			backgroundColor: 'rgba(255, 99, 132, 1)',
			borderColor: 'rgba(255, 99, 132, 1)',
			pointRadius : 3,
			pointBackgroundColor : "rgba(78, 115, 223, 1)",
			pointBorderColor : "rgba(78, 115, 223, 1)",
			pointHoverRadius : 3,
			pointHoverBackgroundColor : "rgba(78, 115, 223, 1)",
			pointHoverBorderColor : "rgba(78, 115, 223, 1)",
			pointHitRadius : 10,
			pointBorderWidth : 2,
			fill: false,
			data: [
				eL2[0], eL2[1], eL2[2], eL2[3], eL2[4], eL2[5], eL2[6],
				eL2[7], eL2[8], eL2[9], eL2[10], eL2[11]
			],
		} */]
	};
	
	var options = {
		title : {
			display : true,
			text : '수익 그래프'
		}
	};

	
	
	var ctx = document.getElementById("myChart").getContext('2d');                                           
	var myBarChart = new Chart(ctx, {
	    type: 'line',
	    data: dataVar, 
	    options: options
	});
	
	
	
	//결과 값
	var earningList = Array();
	var test = Array();

	//start Ajax 
	$.ajax({
		type : 'POST',
		url : "/admin/getMonthlyEarning",
		headers : {
			"Content-Type" : "application/json"
		},
		dataType : "text",
		error : function(err) {
			console.log("ajax getMonthlyReport 실행중 오류가 발생하였습니다.");
		},
		success : function(data) {
			earningList = data;
			console.log("ajax 실행됨");
			var result = JSON.parse(data);
			var e = result.earningList;
			console.log("result : " + result);
			
			var eL = dataVar.datasets[0].data;
			console.log("eL.length : " + eL.length);
			
			for (var i = 0; i < eL.length; i++) {
	            eL[i] = result[i]; 
				console.log("eL[" + i + "] : " +  eL[i] + " = " + "result[" + i + "] : " + result[i]);
	        }
	        dataVar.datasets[0].data = eL; 
	        myBarChart.update();
		}

	});
	

	
</script>

</body>
</html>