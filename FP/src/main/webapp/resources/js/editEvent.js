/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {

    $("#deleteEvent").data("id", event.calno); //클릭한 이벤트 ID

    $(".popover.fade.top").remove();
    $(element).popover("hide");

    if (event.allDay == '1') {
    	$("#edit-allDay").prop('checked', true);
    	$("#edit-allDay").val("1");
    } else {
    	$("#edit-allDay").prop('checked', false);
    	$("#edit-allDay").val("0");
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay == '1' && event.end !== event.start) {
    	$("#edit-end").val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
    	$("#edit-end").val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    $("#edit-title").val(event.title);
    $("#edit-start").val(event.start.format('YYYY-MM-DD HH:mm'));
    $("#edit-type").val(event.type);
    $("#edit-desc").val(event.description);
    $("#edit-color").val(event.backgroundColor).css('color', event.backgroundColor);
    $("#edit-allDay").val(event.allDay);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

        if ($("#edit-start").val() > $("#edit-end").val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if ( $("#edit-title").val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

        if ($("#edit-allDay").is(':checked')) {
            statusAllDay = true;
            startDate = moment($("#edit-start").val()).format('YYYY-MM-DD');
            endDate = moment($("#edit-end").val()).format('YYYY-MM-DD');
            displayDate = moment($("#edit-end").val()).add(1, 'days').format('YYYY-MM-DD');
        } else {
            statusAllDay = false;
            startDate = $("#edit-start").val();
            endDate = $("#edit-end").val();
            displayDate = endDate;
        }

        eventModal.modal('hide');

        event.title = $("#edit-title").val();
        event.start = startDate;
        event.end = displayDate;
        event.type = $("#edit-type").val();
        event.backgroundColor = $("#edit-color").val();
        event.description = $("#edit-desc").val();
        event.allDay = $("#edit-allDay").val();

        $("#calendar").fullCalendar('updateEvent', event);

        //일정 업데이트
        $.ajax({
            type: "get",
            url: "",
            data: {
            	"calno":event.calno ,"username":event.username,
            	"description":event.description,"start":event.start,
            	"end":event.end,"type":event.type,
            	"backgroundColor":event.backgroundColor,
            	"textColor":event.textColor,"allDay":event.allDay, "title":event.title},
            success: function (response) {
                alert('수정되었습니다.')
            }
        });

    });
};

// 삭제버튼
$('#deleteEvent').on('click', function () {
    
    $('#deleteEvent').unbind();
    $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
    eventModal.modal('hide');

    //삭제시
    $.ajax({
        type: "get",
        url: "",
        data: {
            //...
        },
        success: function (response) {
            alert('삭제되었습니다.');
        }
    });

});