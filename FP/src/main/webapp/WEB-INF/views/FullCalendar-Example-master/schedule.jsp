<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 페이지</title>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel=" shortcut icon" href="${path}/resources/image/favicon.ico">

    <link rel="stylesheet" href="${path}/resources/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="${path}/resources/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='${path}/resources/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='${path}/resources/vendor/css/bootstrap-datetimepicker.min.css' />
   	<link rel="stylesheet" href="${path}/resources/vendor/css/fullcalendar.min.css" /> 
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="${path}/resources/css/main.css">

</head>

<body>
                        
<h1>[일정 페이지]</h1>
   <button onClick="location.href='/'">홈으로</button>
   <button onClick="location.href='/schedule_makeSchedule'">일정 추가</button>
    <div class="container">
        
      <select id="myGroupList" name="g_code"></select>
      <!-- 마이클럽 -->
      <script id="tempMyList" type="text/x-handlebars-template">
            {{#each .}}
               <option value="{{g_code}}">{{g_name}}</option>
            {{/each}}
      </script>  
      <!-- 마이클럽끝 -->
        
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="/schedule_makeSchedule">일정 추가</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>
       <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">카테고리1</option>
                                    <option value="카테고리2">카테고리2</option>
                                    <option value="카테고리3">카테고리3</option>
                                    <option value="카테고리4">카테고리4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
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
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                  <div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                       <c:forEach items="${gulist}" var="GuVO">
                           <label class="checkbox-inline"><input class='filter' type="checkbox" value="${GuVO.uname}"
                                checked>${GuVO.uname}</label>
                     </c:forEach>
                  
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->
    <script src="${path}/resources/vendor/js/jquery.min.js"></script>
    <script src="${path}/resources/vendor/js/bootstrap.min.js"></script>
    <script src="${path}/resources/vendor/js/moment.min.js"></script>
    <script src="${path}/resources/vendor/js/fullcalendar.min.js"></script>
    <script src="${path}/resources/vendor/js/ko.js"></script>
    <script src="${path}/resources/vendor/js/select2.min.js"></script>
    <script src="${path}/resources/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${path}/resources/js/main.js"></script>
    <script src="${path}/resources/js/addEvent.js"></script>
    <script src="${path}/resources/js/editEvent.js"></script>
    <script src="${path}/resources/js/etcSetting.js"></script>
</body>
	
	<script>
	myClubList();
	var day=null;
	
	$("#calendar td a").click(function(e){
	   e.preventDefault();
	   day=$(this).attr("data-goto");
	   alert(day);
	});
	
	$("#calendar td").click(function(){
	   
	});
	
	
	var eventModal = $('#eventModal');
	
	var modalTitle = $('.modal-title');
	var editAllDay = $('#edit-allDay');
	var editTitle = $('#cal_title');
	var editStart = $('#cal_sdate');
	var editEnd = $('#cal_edate');
	var editType = $('#edit-type');
	var editColor = $('#edit-color');
	var editDesc = $('#cal_content');
	
	var addBtnContainer = $('.modalBtnContainer-addEvent');
	var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
	
	
	
	
	/* ****************
	 *  새로운 일정 생성
	 * ************** */
	var newEvent = function (start, end, eventType) {
	   
	   
	    $("#contextMenu").hide(); //메뉴 숨김
	
	    modalTitle.html('새로운 일정');
	    editType.val(eventType).prop('selected', true);
	    editTitle.val('');
	    editStart.val(start);
	    editEnd.val(end);
	    editDesc.val('');
	   
	    addBtnContainer.show();
	    modifyBtnContainer.hide();
	    eventModal.modal('show');
	
	
	    //새로운 일정 저장버튼 클릭
	    $('#save-event').unbind();
	    $('#save-event').on('click', function () {
	
	        var eventData = {
	            title: editTitle.val(),
	            start: editStart.val(),
	            end: editEnd.val(),
	            description: editDesc.val(),
	            type: editType.val(),
	            username: '사나',
	            backgroundColor: editColor.val(),
	            textColor: '#ffffff',
	            allDay: false
	        };
	
	        if (eventData.start > eventData.end) {
	            alert('끝나는 날짜가 앞설 수 없습니다.');
	            return false;
	        }
	
	        if (eventData.title === '') {
	            alert('일정명은 필수입니다.');
	            return false;
	        }
	
	        var realEndDay;
	
	        if (editAllDay.is(':checked')) {
	            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
	            //render시 날짜표기수정
	            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
	            //DB에 넣을때(선택)
	            realEndDay = moment(eventData.end).format('YYYY-MM-DD');
	
	            eventData.allDay = true;
	        }
	
	        $("#calendar").fullCalendar('renderEvent', eventData, true);
	        eventModal.find('input, textarea').val('');
	        editAllDay.prop('checked', false);
	        eventModal.modal('hide');
	
	        //새로운 일정 저장
	        $.ajax({
	            type: "get",
	            url: "",
	            data: {
	                //.....
	            },
	            success: function (response) {
	                //DB연동시 중복이벤트 방지를 위한
	                //$('#calendar').fullCalendar('removeEvents');
	                //$('#calendar').fullCalendar('refetchEvents');
	            }
	        });
	    });
	};
	
	function myClubList(){
	   $.ajax({
	      type :"get",
	      url : "myGroup",
	       dataType : "json",
	       success : function(data){
	          var temp = Handlebars.compile($("#tempMyList").html());
	         $("#myGroupList").html(temp(data));
	      }
	   });
	}
	
	</script>

</html>