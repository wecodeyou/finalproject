<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html lang="ko">
<head>
 
<link href="<c:url value='/resources/vendor/calendar/calcss/fullcalendar.min.css' />" rel='stylesheet' />
<link href="<c:url value='/resources/vendor/calendar/calcss/bootstrap.min.css' />" rel='stylesheet' />
<link href="<c:url value='/resources/vendor/calendar/calcss/select2.min.css' />" rel='stylesheet' />
<link href="<c:url value='/resources/vendor/calendar/calcss/calendar.css' />" rel='stylesheet' />


<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />

<meta charset="UTF-8">

<title>스케줄</title>

<style>
.modal-body{height:500px !important;}
.fc-title{color:#fff;}
</style>


</head>

<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
	var Calendar = FullCalendar.Calendar;

var calendar = new Calendar($('#calendar'),{

	  header: {
	    left: 'today, prevYear, nextYear, viewWeekends',
	    center: 'prev, title, next',
	    right: 'month,listWeek'
	  },
	  views: {
	    month: {
	      columnFormat: 'dddd'
	    },
	    agendaWeek: {
	      columnFormat: 'M/D ddd',
	      titleFormat: 'YYYY년 M월 D일',
	      eventLimit: false
	    },
	    agendaDay: {
	      columnFormat: 'dddd',
	      eventLimit: false
	    },
	    listWeek: {
	      columnFormat: ''
	    }
	  },
		
	  events: [ /* db에서 이벤트 받아옴 */
          
		
				{
     	 		   start : '${off.offStartAt}'
   				 , end : '${off.offEndAt}'
   				 , allday : true
 	 			},
 	 			
 	 			<c:forEach var="el" items="${eventList}">
 	 			
				{
			  		   title : '${el.scheduleTitle}'
	     	 		 , start : '${el.scheduleStartDate}'
	   				 , end : '${el.scheduleEndDate}'
	   				 , backgroundColor : '${el.scheduleBgColor}'
	   				 , allday : true
	 	 			},
 	 			
 	 			</c:forEach>
			],


	  eventResize: true,

	  <c:if test="${login.userType != 2}">
	  	select: false,
	  </c:if>	  
	  <c:if test="${login.userType == 2}">
	  select: function (startDate, endDate, jsEvent, view) {



	    var today = moment();

	    if (view.name == "month") {
	      startDate.set({
	        hours: today.hours(),
	        minute: today.minutes()
	      });
	      startDate = moment(startDate).format('YYYY-MM-DD');
	      endDate = moment(endDate).subtract(1, 'days');

	      endDate.set({
	        hours: today.hours(),
	        minute: today.minutes()
	      });
	      endDate = moment(endDate).format('YYYY-MM-DD');
	      
	    } else {
	      startDate = moment(startDate).format('YYYY-MM-DD');
	      endDate = moment(endDate).format('YYYY-MM-DD');
	    }
	    
        newEvent(startDate, endDate);

	    
	    
	  }, 
	  
	  </c:if>
	  <c:if test="${login.userType != 2}">
	   eventClick: false, 
	  </c:if>
	  <c:if test="${login.userType == 2}">
	   eventClick: function (event, jsEvent, view) {
		    editEvent(event);
	  }, 
	  </c:if>
	   eventClick: false, 

	  locale: 'ko',
	  timezone: "local",
	  nextDayThreshold: "09:00:00",
	  allDaySlot: true,
	  displayEventTime: false,
	  displayEventEnd: true,
	  firstDay: 0, //월요일이 먼저 오게 하려면 1
	  weekNumbers: false,
	  selectable: true,
	  weekNumberCalculation: "ISO",
	  eventLimit: true,
	  views: {
	    month: {
	      eventLimit: 12
	    }
	  },
	  eventLimitClick: 'week', //popover
	  navLinks: true,

	  timeFormat: 'HH:mm',
	  
	  defaultTimedEventDuration: '01:00:00',
	  editable: false,
	  minTime: '01:00:00',
	  maxTime: '24:00:00',
	  slotLabelFormat: 'HH:mm',
	  weekends: true,
	  nowIndicator: true,
	  dayPopoverFormat: 'MM/DD dddd',
	  longPressDelay: 0,
	  eventLongPressDelay: 0,
	  selectLongPressDelay: 0
	  

	});
/* 	if($('#modal2').is(':visible')){		
		calendar.render();
	} */
	
	calendar.render();
	calendar.setOption('contentHeight', 450);
});
</script>



<body>
<input type = "hidden" id = "offNo" value = "${off.offNo}">
<div class="modal fade" id="modal2">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
<!-- 			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">FullCalendar</h4>
			</div> -->
			<div class="modal-body" >

			<div id="calendar"></div>
		


		<!-- 일정 추가 MODAL -->
		<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">

						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-title">일정명</label> <input
									class="inputModal" type="text" name="edit-title"
									id="edit-title" required="required" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-start">시작</label> <input
									class="inputModal" type="text" name="edit-start"
									id="edit-start" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-end">끝</label> <input
									class="inputModal" type="text" name="edit-end" id="edit-end" />
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-color">색상</label> <select
									class="inputModal" name="color" id="edit-color">
									<option value="#D25565" style="color: #D25565;">빨간색</option>
									<option value="#9775fa" style="color: #9775fa;">보라색</option>
									<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
									<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
									<option value="#f06595" style="color: #f06595;">핑크색</option>
									<option value="#63e6be" style="color: #63e6be;">연두색</option>
									<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
									<option value="#4d638c" style="color: #4d638c;">남색</option>
									<option value="#495057" style="color: #495057;">검정색</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-desc">설명</label>
								<textarea rows="4" cols="50" class="inputModal" name="edit-desc"
									id="edit-desc"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer modalBtnContainer-addEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="save-event">저장</button>
					</div>
					<div class="modal-footer modalBtnContainer-modifyEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
						<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->


		<!-- /.filter panel -->
	</div>
			</div>
		</div>
	</div>


	<!-- /.container -->

<script src = "<c:url value='/resources/vendor/calendar/caljs/jquery.min.js' />"></script>
<script src = "<c:url value='/resources/vendor/calendar/caljs/bootstrap.min.js' />"></script>
<script src = "<c:url value='/resources/vendor/calendar/caljs/moment.min.js' />"></script>
<script src = "<c:url value='/resources/vendor/calendar/caljs/fullcalendar.min.js' />"></script>
<script src = "<c:url value='/resources/vendor/calendar/caljs/select2.min.js' />"></script>
<script src = "<c:url value='/resources/vendor/calendar/caljs/ko.js' />"></script>
<script src = "<c:url value='/resources/vendor/calendar/addEvent.js' />"></script>


</body>
</html>