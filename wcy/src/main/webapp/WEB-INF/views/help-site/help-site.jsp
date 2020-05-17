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
							<a href="https://www.webjangi.com/" target="_blank">
								<span class="tp-info"><span>웹쟁이</span></span>
								<img src="<c:url value='/img/site/site08.PNG'/>" />
							</a>
						</li>
						<li data-pile="Design">
							<a href="http://bootstrapk.com/" target="_blank">
								<span class="tp-info"><span>Bootstrap</span></span>
								<img src="<c:url value='/img/site/site02.PNG'/>" />
							</a>
						</li>
						<li data-pile="Design">
							<a href="https://www.pinterest.co.kr/" target="_blank">
								<span class="tp-info"><span>Pinterest</span></span>
								<img src="<c:url value='/img/site/site15.png'/>" />
							</a>
						</li>
						<li data-pile="Design">
							<a href="https://www.blueb.co.kr/" target="_blank">
								<span class="tp-info"><span>blue B</span></span>
								<img src="<c:url value='/img/site/site17.PNG'/>" />
							</a>
						</li>
						<li data-pile="Design">
							<a href="https://www.graphberry.com/" target="_blank">
								<span class="tp-info"><span>GRAPHBERRY</span></span>
								<img src="<c:url value='/img/site/site18.PNG'/>" />
							</a>
						</li>
						<li data-pile="Design">
							<a href="https://codepen.io/" target="_blank">
								<span class="tp-info"><span>CODE PEN</span></span>
								<img src="<c:url value='/img/site/site16.PNG'/>" />
							</a>
						</li>

						<!-- 개발자 커뮤니티 -->
						<li data-pile="Community">
							<a href="https://stackoverflow.com/" target="_blank">
								<span class="tp-info"><span>stackoverflow</span></span>
								<img src="<c:url value='/img/site/site04.png'/>" />
							</a>
						</li>
						<li data-pile="Community">
							<a href="http://www.devpia.com/" target="_blank">
								<span class="tp-info"><span>DEVPIA</span></span>
								<img src="<c:url value='/img/site/site19.PNG'/>" />
							</a>
						</li>
						<li data-pile="Community">
							<a href="https://devsnote.com/" target="_blank">
								<span class="tp-info"><span>뎁스노트</span></span>
								<img src="<c:url value='/img/site/site20.png'/>" />
							</a>
						</li>
						<li data-pile="Community">
							<a href="http://www.ksug.org/" target="_blank">
								<span class="tp-info"><span>KSUG</span></span>
								<img src="<c:url value='/img/site/site21.png'/>" />
							</a>
						</li>
						<li data-pile="Community">
							<a href="https://okky.kr/" target="_blank">
								<span class="tp-info"><span>OKKY</span></span>
								<img src="<c:url value='/img/site/site03.png'/>" />
							</a>
						</li>


						<!-- 무료소스 -->
						<li data-pile="Free resource">
							<a href="https://pixabay.com/ko/" target="_blank">
								<span class="tp-info"><span>pixabay</span></span>
								<img src="<c:url value='/img/site/site06.png'/>" />
							</a>
						</li>
						<li data-pile="Free resource">
							<a href="https://fontawesome.com/" target="_blank">
								<span class="tp-info"><span>Font Awesome</span></span>
								<img src="<c:url value='/img/site/site01.PNG'/>" />
							</a>
						</li>
						<li data-pile="Free resource">
							<a href="https://icomoon.io/" target="_blank">
								<span class="tp-info"><span>IcoMoon</span></span>
								<img src="<c:url value='/img/site/site24.png'/>" />
							</a>
						</li>

						<!-- javascript library -->
						<li data-pile="javascript library">
							<a href="https://api.jquery.com/" target="_blank">
								<span class="tp-info"><span>jQuery</span></span>
								<img src="<c:url value='/img/site/site05.png'/>" />
							</a>
						</li>
						<li data-pile="javascript library">
							<a href="https://dojotoolkit.org/" target="_blank">
								<span class="tp-info"><span>Dojo Toolkit</span></span>
								<img src="<c:url value='/img/site/site14.PNG'/>" />
							</a>
						</li>
						<li data-pile="javascript library">
							<a href="https://zeptojs.com/#download" target="_blank">
								<span class="tp-info"><span>Zepto.JS</span></span>
								<img src="<c:url value='/img/site/site012.png'/>" />
							</a>
						</li>
						<li data-pile="javascript library">
							<a href="https://www.syncfusion.com/javascript-ui-controls" target="_blank">
								<span class="tp-info"><span>싱크퓨전 에센셜 JS 2</span></span>
								<img src="<c:url value='/img/site/site13.PNG'/>" />
							</a>
						</li>
						
						<!-- 기타 -->
						<li data-pile="etc">
							<a href="https://mvnrepository.com/" target="_blank">
								<span class="tp-info"><span>MVN repository</span></span>
								<img src="<c:url value='/img/site/site07.PNG'/>" />
							</a>
						</li>
						<li data-pile="etc">
							<a href="https://github.com/" target="_blank">
								<span class="tp-info"><span>GitHub</span></span>
								<img src="<c:url value='/img/site/site09.png'/>" />
							</a>
						</li>
						<li data-pile="etc">
							<a href="https://www.google.com/" target="_blank">
								<span class="tp-info"><span>Google</span></span>
								<img src="<c:url value='/img/site/site011.png'/>" />
							</a>
						</li>
						<li data-pile="etc">
							<a href="https://opentutorials.org/" target="_blank">
								<span class="tp-info"><span>생활코딩</span></span>
								<img src="<c:url value='/img/site/site010.PNG'/>" />
							</a>
						</li>
						<li data-pile="etc">
							<a href="https://d2.naver.com/helloworld" target="_blank">
								<span class="tp-info"><span>네이버 개발자들의 실전 개발 경험 블로그</span></span>
								<img src="<c:url value='/img/site/site22.png'/>" />
							</a>
						</li>
						<li data-pile="etc">
							<a href="http://www.regexr.com/" target="_blank">
								<span class="tp-info"><span>정규식 실시간 코딩/테스트</span></span>
								<img src="<c:url value='/img/site/site23.png'/>" />
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