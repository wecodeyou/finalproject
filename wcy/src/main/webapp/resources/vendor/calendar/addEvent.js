var eventModal = $('#eventModal');
var modalTitle = $('.modal-title');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');
var offNo = $('#offNo').val();
var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');



// 새로운 일정 생성

var newEvent = function (start, end) {
    eventModal.find('input, textarea').val('');

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    
    editStart.val(start);
    editEnd.val(end);


    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    var eventId = 1 + Math.floor(Math.random() * 1000);
    
    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

        var eventData = {
            /*_id: eventId,*/
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: true
        };
        
        var svo ={
        		
            	scheduleOffNo: offNo,
                scheduleTitle: eventData.title,
                scheduleStartDate: eventData.start,
                scheduleEndDate: eventData.end,
                scheduleDetail: eventData.description,
                scheduleBgColor: eventData.backgroundColor,
        		
        }

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }
    
        eventModal.find('input, textarea').val('');
        eventModal.modal('hide');

        //새로운 일정 저장
        $.ajax({
            type: "post",
            url: "/schedule/add",
			headers:{
				"Content-Type": "application/json"
			},
			dataType: "text",
			data:JSON.stringify(svo),
            success: function (response) {
            	
            	console.log(response);
            	if (response == "success"){
            		
            		console.log("등록 성공");
            		location.reload();
            		
            	}else{
            		
            		console.log("등록 실패")
            	}
            	
            },
            error : function(){
            	console.log("통신 에러다");
            }
        });
    });
};
	