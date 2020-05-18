<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="<c:url value='/resources/vendor/calendar/calcss/fullcalendar.min.css' />" rel="stylesheet">
<link href="<c:url value='/resources/vendor/calendar/calcss/bootstrap.min.css' />" rel='stylesheet' />

<body>



<button type="button" id="btn2">달력 소환</button>

<div class="modal fade" id="modal2">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">FullCalendar</h4>
			</div>
			<div class="modal-body">
				<div id="fullcalendar_div2"></div>
			</div>
		</div>
	</div>
</div>

<script src = "<c:url value='/resources/vendor/calendar/caljs/jquery.min.js' />"></script>
<script src = "<c:url value='/resources/vendor/calendar/caljs/bootstrap.min.js' />"></script> 

<script src = "<c:url value='/resources/vendor/calendar/caljs/moment.min.js' />"></script>
<script src = "<c:url value='/resources/vendor/calendar/caljs/fullcalendar.min.js' />"></script>
<script src = "<c:url value='/resources/vendor/calendar/caljs/ko.js' />"></script>


<script type="text/javascript">
var fc2 = null
var mm2 = null
var m_chk1 = 0

var start2 = moment().format('YYYY-MM-DD HH:')+'00'
var end2 = moment().add(2, 'hour').format('YYYY-MM-DD HH:')+'00'

var events2 =[
	{
		start: '${off.offStartAt}',
		backgroundColor:'#ccc',
		end: '${off.offEndAt}'
	},
]

	fc2 = $('#fullcalendar_div2').fullCalendar({
		defaultView: 'month',
		header: {
			left: 'today',
			center: 'title',
			right: 'month',
		},
		events:events2,
		displayEventEnd: true,
		slotDuration: '01:00:00'
	})

$(function(){
	$('#btn2').click(function(){
		mm2 = $('#modal2').modal();
		mm2.on('shown.bs.modal', function () {
			//shown.bs.modal이벤트가 다중으로 발생하는 걸 방지하기 위한 부분
			m_chk1++
			if( m_chk1 == 1){
				if(fc2){
					fc2.fullCalendar('rerenderEvents')
					$('#fullcalendar_div2').fullCalendar( 'addEventSource', events2 )
				}
				else {
					open_fc2(events2)
				}
			}
		})
	})
})



</script>




</body>
</html>