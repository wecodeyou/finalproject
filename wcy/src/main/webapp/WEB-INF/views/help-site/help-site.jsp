<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 파비콘 적용 -->
<link rel="shortcut icon"
	href="<c:url value='/img/favicon/wcy-favicon.ico'/>">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<link rel="stylesheet" href="<c:url value='/css/site/custom.css'/>">
<link rel="stylesheet" href="<c:url value='/css/site/demo.css'/>">
<link rel="stylesheet" href="<c:url value='/css/site/stapel.css'/>">
<script src="<c:url value = "/js/modernizr.custom.63321.js"/>" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
	integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
	crossorigin="anonymous" type="text/javascript"></script>
<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>


</head>
<body>

	<jsp:include page="../include/header-sub.jsp" />
	
<main class="wcy-main-content">	
	<div class="wcy-contents">
		<div class="container">	
			
			<section class="main">
				
				<div class="wrapper">

					<div class="topbar">
						<span id="close" class="back">&larr;</span>
						<h2>개발자에게 도움이 되는 사이트</h2><h3 id="name"></h3>
					</div>
					
					<ul id="tp-grid" class="tp-grid">

						<!-- 디자인 -->
						<li data-pile="Design">
							<a href="#">
								<span class="tp-info"><span>Flu &amp; You</span></span>
								<img src="<c:url value='/img/site/site01.PNG'/>" />
							</a>
						</li>
						<li data-pile="Design">
							<a href="#">
								<span class="tp-info"><span>Test Your Flu IQ</span></span>
								<img src="<c:url value='/img/site/site011.png'/>" />
							</a>
						</li>
						<li data-pile="Design">
							<a href="#">
								<span class="tp-info"><span>Unexpected Fatherly Faces and Feelings</span></span>
								<img src="<c:url value='/img/site/site02.PNG'/>" />
							</a>
						</li>

						<!-- 개발자 커뮤니티 -->
						<li data-pile="Community">
							<a href="#">
								<span class="tp-info"><span>On to Easter</span></span>
								<img src="<c:url value='/img/site/site03.png'/>" />
							</a>
						</li>
						<li data-pile="Community">
							<a href="#">
								<span class="tp-info"><span>Love Birds</span></span>
								<img src="<c:url value='/img/site/site04.png'/>" />
							</a>
						</li>
						<li data-pile="Community">
							<a href="#">
								<span class="tp-info"><span>Here Fishy fishy</span></span>
								<img src="<c:url value='/img/site/site05.png'/>" />
							</a>
						</li>

						<!-- 무료소스 -->
						<li data-pile="Open Source">
							<a href="#">
								<span class="tp-info"><span>Briefcase</span></span>
								<img src="<c:url value='/img/site/site06.png'/>" />
							</a>
						</li>
						<li data-pile="Open Source">
							<a href="#">
								<span class="tp-info"><span>Clipboard</span></span>
								<img src="<c:url value='/img/site/site07.PNG'/>" />
							</a>
						</li>
						<li data-pile="Open Source">
							<a href="#">
								<span class="tp-info"><span>Sweet pack</span></span>
								<img src="<c:url value='/img/site/site08.PNG'/>" />
							</a>
						</li>

						<!-- 기타 -->
						<li data-pile="etc">
							<a href="#">
								<span class="tp-info"><span>Growth in 2012 (Holiday Card)</span></span>
								<img src="<c:url value='/img/site/site09.png'/>" />
							</a>
						</li>
						<li data-pile="etc">
							<a href="#">
								<span class="tp-info"><span>Grady Wilson</span></span>
								<img src="<c:url value='/img/site/site010.PNG'/>" />
							</a>
						</li>
						<li data-pile="etc">
							<a href="#">
								<span class="tp-info"><span>More Cowbell</span></span>
								<img src="<c:url value='/img/site/site011.png'/>" />
							</a>
						</li>
					</ul>
				</div>
			</section>

		</div><!-- /container -->
	</div>
</main>
	
	
	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>" type="text/javascript"></script>
	<script src="<c:url value = "/js/main.js"/>" type="text/javascript"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
	<script src="<c:url value = "/js/jquery.stapel.js"/>" type="text/javascript"></script>
	<script type="text/javascript">	
			(function($) {

				var $grid = $( '#tp-grid' ),
					$name = $( '#name' ),
					$close = $( '#close' ),
					$loader = $( '<div class="loader"><i></i><i></i><i></i><i></i><i></i><i></i><span>Loading...</span></div>' ).insertBefore( $grid ),
					stapel = $grid.stapel({
						randomAngle : true,
						delay : 50,
						gutter : 70,
						pileAngles : 5,
						onLoad : function() {
							$loader.remove();
						},
						onBeforeOpen : function( pileName ) {
							$name.html( pileName );
						},
						onAfterOpen : function( pileName ) {
							$close.show();
						}
					});

				$close.on( 'click', function() {
					$close.hide();
					$name.empty();
					stapel.closePile();
				} );

			} )(jQuery);
		</script>
</body>
	<jsp:include page="../include/footer.jsp" />
</html>