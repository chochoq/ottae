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
    <link rel=" shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico">

   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/fullcalendar.min.css" />
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/bootstrap.min.css" />
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/select2.min.css" />
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/bootstrap-datetimepicker.min.css" />
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/fullcalendar.min.css" />
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>

<body>

<h1>[일정 페이지]</h1>
   <button onClick="location.href='/'">홈으로</button>
    <div class="container">
                  <select id="joinedGroup"></select> 
               <script id="temp" type="text/x-handlebars-template">
                  <option value="0">개인일정</option>
                  {{#each .}}
                     <option value="{{g_code}}">{{g_name}}</option>
                        {{/each}}
               </script>
         
         
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu" style="display:block;position:static;margin-bottom:5px;">
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
                                <c:if test="${edit-allDay == 1}">
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox" value="1" checked>
                                </c:if>
                                <c:if test="${edit-allDay != 1}">
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox" value="0">
                                </c:if>
                            </div>
                        </div>
						<div class="row">
                           <div class="col-xs-12">
                               <label class="col-xs-4" for="edit-schk">공유여부</label>
                               <input class='allDayNewEvent' id="edit-schk" type="checkbox" value="1">
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
                                <select class="inputModal" type="text" name="edit-type" id="edit-type"></select>
                                <script id="temp" type="text/x-handlebars-template">
                                 <option value="0">개인일정</option>
                              {{#each .}}
                                 <option value="{{g_code}}">{{g_name}}</option>
                                    {{/each}}
                           </script>
                                
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


        
        <!-- /.filter panel -->
    </div>
    <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">
            
                <div class="col-lg-6">
                    <label for="calendar_view" >등록자별</label>
                    <div class="input-group" id="joinedMember"></div>    
                    <script id="temp1" type="text/x-handlebars-template">
                  {{#each .}}
                       <label class="checkbox-inline"><input class='filter' type="checkbox" value="{{id}}"  checked>{{name}}</label>
                    {{/each}}
                  </script>        
                    
                </div>

               
            </div>
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
chkSdchk();
chk();
   
   var eventModal = $('#eventModal');
   
   var modalTitle = $('.modal-title');
   var editAllDay = $('#edit-allDay');
   var editTitle = $('#cal_title');
   var editStart = $('#cal_sdate');
   var editEnd = $('#cal_edate');
   var editType = $('#edit-type');
   var editColor = $('#edit-color');
   var editDesc = $('#cal_content');
   var editschk = $('#edit-schk');
   var addBtnContainer = $('.modalBtnContainer-addEvent');
   var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
   
   
   
   function chk(){
      $.ajax({
         type :"get",
         url : "myGroup",
             dataType : "json",
             success : function(data){
              var temp = Handlebars.compile($("#temp").html());
               $("#edit-type").html(temp(data));
              
         }
      });
   }
   

   function chkSdchk(){
      $.ajax({
         type :"get",
         url : "myGroup",
             dataType : "json",
             success : function(data){
              var temp = Handlebars.compile($("#temp").html());
               $("#joinedGroup").html(temp(data));
               $("#joinedMember").html("개인일정입니다. ");
         }
      });
   }
   

   $("#joinedGroup").on("change",function(){
      var selectG_code = $("#joinedGroup").val();
       if(selectG_code != "0"){
          $.ajax({
              type :"get",
                url : "guget",
                dataType : "json",
                data : {"g_code" : selectG_code},
                success : function(data){
                  var temp = Handlebars.compile($("#temp1").html());
                     $("#joinedMember").html(temp(data));
                }
            });
         }else{
          var str="개인 일정입니다."
           $("#joinedMember").html(str);
         }
   })
   
</script>

</html>