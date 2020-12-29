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
<title>일정</title>
<link rel=" shortcut icon" href="<%=request.getContextPath()%>/resources/image/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/select2.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/schedule.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
<div><jsp:include page="loading.jsp"/></div>
<div><jsp:include page="menu.jsp"/></div>
<div style="overflow:hidden; ">
      <div class="container3">
         <input type="hidden" id="id" value="${id}"> 
         <input type="hidden" id="hidden" value="0">       
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
                       <div class="l1">
                           <div class="l_row">
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
                          <div class="r_row">
                              <div class="col-xs-12">
                                  <label class="col-xs-4" for="edit-schk">공유여부</label>
                                  <input class='allDayNewEvent' id="edit-schk" type="checkbox" value="1">
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
                                <select class="inputModal" type="text" name="edit-type" id="edit-type"></select>
                                       <script id="temp_g_name" type="text/x-handlebars-template">
                                <option value="개인일정">개인일정</option>
                                  {{#each .}}
                                   <option value="{{g_name}}">{{g_name}}</option>
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
               <!--                     수정 추가 -->
                    <div class="modal-footer modalBtnContainer-closeEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                    </div>
                    <!--                     수정 -->
                    
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent" onClick="window.location.reload()">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!-- /.filter panel -->
    </div>
    </div>
    <div style="float:left;  margin-top: 160px;  margin-left: 80px; ">
     <div class="schedule-Top">
            <select id="joinedGroup"></select>
            <script id="temp_g_code" type="text/x-handlebars-template">
           <option value="0">개인일정</option>
             {{#each .}}
                 <option value="{{g_code}}">{{g_name}}</option>
            {{/each}}
             </script>
            <!-- 인원 추가하기  -->
            <div id="searchUser">              
               <div id="popup" class="popup_overlay">
                     <div class="popup">
                        <h2>인원추가</h2>
                        <a class="close" href="#" id="close">&times;</a>
                        <input type="text" id="query" placeholder="아이디를 검색하시오">
                        <span><button id="search" class="btnUserse">검색</button></span>
                        <table id="result" class="resultUser"></table>
                        <div id="resultoo"> </div>
                        <script id="tempResult" type="text/x-handlebars-template">
                         <table class="schedTable">
                         <tr style="margin-bottom: 15px;">
                            <th class="s_ck">체크</th>
                            <th class="s_name">이름</th>
                            <th class="s_pid">아이디</th>
                         </tr>
                      </table> 
                        {{#each .}}                            
                            <tr style="margin-bottom: 15px;">
                            <td><input type="checkbox" value="{{id}}" name="selectedMember"></td>
                            <td class="s_name">{{name}}</td>
                            <td class="s_pid">{{id}}</td>
                         </tr>                               
                        {{/each}}
                        </script>
                        <button class="bubbly-button" id="complete" >완료</button>
                     </div>
               </div>
            </div>
         </div>
        <div style="width: 250px; height:250px;">
          	<div>
                <img src="http://placehold.it/150x120" id="image" style="width: 248px; height:250px;">  
            </div>  
	
        </div>
        <div class="" style="width: 250px; margin-top:25px;">                
                <p for="calendar_view" style="text-align:center; font-size:20px;">등록자별</p>
                <table id="joinedMember" class="resultUser"></table> 
                <script id="temp1" type="text/x-handlebars-template">
                <table class="schedTable">
                      <tr style="margin-bottom: 15px;">
                         <th class="s_ck" style="width: 4%;">체크</th>
                         <th class="s_name">이름</th>
                      </tr>
                </table> 
                {{#each .}}                            
                      <tr style="margin-bottom: 15px;">
                        <td><input class='filter' type="checkbox" value="{{id}}" checked></td>
                        <td class="s_name">{{name}}</td>
                     </tr>                               
                {{/each}}
                </script>                                      
                </div>
                <input type="button" value="인원추가" onClick="location.href='#popup'" class="btnschedule">
        </div>       
        </div>
        <div><jsp:include page="footer.jsp"/></div>      
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
	image();
	
	function image(){
	$.ajax({
		type:"get",
		url:"g_pic",
		data:{"g_code":0},
		success:function(data){
			$("#image").attr("src", "display?fileName=" + data.upic.image);
		}
	});
	}

   chk();
   $(document).ready(function(){
      $("#searchUser").hide(); 
      var $header = $('header');
         var $services = $('.services');
         $(window).scroll(function(){
              var $currentSct = $(this).scrollTop();               
              var $offset = 400;
              if($currentSct > 0){
                   $header.addClass('sticky'); 
              }else{
                   $header.removeClass('sticky');
                }
              //서비스 아이탬 나타나기
              var $serviceThreshold = $services.offset().top - $offset;
              var $serviceExecuted = false;
              if(!$serviceExecuted){
                  if($currentSct > $serviceThreshold){
                       $services.addClass('active');
                       $serviceExecuted = true;  
                  }
              }
         }); 
         $("#close").click(function(){            
            window.history.back()       
         });       
   });
   
   
   
   var g_code = "0";
   
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
              var temp_g_name = Handlebars.compile($("#temp_g_name").html());
               var temp_g_code = Handlebars.compile($("#temp_g_code").html());
               
               $("#edit-type").html(temp_g_name(data));
               $("#joinedGroup").html(temp_g_code(data));

            // 필터링하도록 기본값을 넣어준다.
               var id = $("#id").val();
               var str = "<label class='checkbox-inline'><input class='filter' type='checkbox'";
               str += " value='" + id +"' checked>개인일정</label>" ;
               $("#joinedMember").html(str);
               
               
               // 핸들바를 사용했기 때문에 ajax안에서 필터가 바뀌면 값이 바뀌도록 해준다. 
               $(document).ready(function(){
                    $(".filter").change(function(){
                       $('#calendar').fullCalendar('removeEvents');
                       $('#calendar').fullCalendar('refetchEvents');
                    })
                }); 
             }
         });
   }
   
   
   // 선택된 그룹에 맞게 값들을 변경해준다. 달력까지. 
      $("#joinedGroup").on("change",function(){
         var selectG_code = $("#joinedGroup").val();
         g_code = selectG_code;
          if(selectG_code != "0"){
        	 $.ajax({
             	type : "get",
             	url : "g_pic",
             	data:{"g_code":selectG_code},
             	success:function(data){
             		$("#image").attr("src", "display?fileName=" + data.gpic.g_pic);
             	}
             });
             // 필터링 할 member를 가져온다. 
             $.ajax({
                 type :"get",
                url : "guget",
                dataType : "json",
                data : {"g_code" : selectG_code},
                success : function(data){
                     var temp = Handlebars.compile($("#temp1").html());
                      $("#joinedMember").html(temp(data));
                      $("#hidden").val(selectG_code);
                      $('#calendar').fullCalendar('removeEvents');
                   $('#calendar').fullCalendar('refetchEvents');
                   
                   $(document).ready(function(){
                       $(".filter").change(function(){
                          $('#calendar').fullCalendar('removeEvents');
                          $('#calendar').fullCalendar('refetchEvents');
                       })
                   });  
                   
                   $("#searchUser").show();
                   
                }
             });
        }else{
        	$.ajax({
             	type : "get",
             	url : "g_pic",
             	data:{"g_code":selectG_code},
             	success:function(data){
             		$("#image").attr("src", "display?fileName=" + data.upic.image);
             	}
             });
           var id = $("#id").val();
            var str = "<label class='checkbox-inline'><input class='filter' type='checkbox'";
            str += " value='" + id +"' checked>개인일정</label>" ;
            $("#joinedMember").html(str);
            
            
             $("#hidden").val(selectG_code);
             $('#calendar').fullCalendar('removeEvents');
            $('#calendar').fullCalendar('refetchEvents');
            
            
            $("#searchUser").hide();
            
         }
      })   
      
   $("#search").on("click",function(){
      var query = $("#query").val();
      $.ajax({
         type :"get",
          url : "searchGroupMember",
         dataType : "json",
          data : {"query" : query},
          success : function(data){
             var temp = Handlebars.compile($("#tempResult").html());
               $("#result").html(temp(data));
               $("#resultoo").hide();
               if(data.length==0){
		        	$("#resultoo").html("검색결과가 없습니다");
		        	$("#resultoo").hide();
		               if(data.length==0){
				        	$("#resultoo").html("검색결과가 없습니다");
				        	$("#resultoo").show();
				        }
		        }
          }
      });
   })
   
   $("#complete").on("click",function(){
      var g_code = $("#joinedGroup").val(); // session에서 g_code를 가져온다. → 맴버를 초대할 모임을 선택하도록 했다.
      var gu_pwchk= "N";
      var check_count = document.getElementsByName("selectedMember").length;
      for(var i=0; i<check_count; i++){
         if (document.getElementsByName("selectedMember")[i].checked == true) {
            // 친구 초대하는 ajax 실행하면 됨
            var id=document.getElementsByName("selectedMember")[i].value;
            
            $.ajax({
               type :"get",
                url : "addMembers",
                data : {"g_code" : g_code, "gu_pwchk" :gu_pwchk,"id":id},
                success : function(){
                   alert("완료");
                   $("#query").val("");
                   $("#result").html("검색결과 없음");
                   var selectG_code = $("#joinedGroup").val();
                     g_code = selectG_code;
                     
                   $.ajax({
                         type :"get",
                        url : "guget",
                        dataType : "json",
                        data : {"g_code" : selectG_code},
                        success : function(data){
                           var temp = Handlebars.compile($("#temp1").html());
                              $("#joinedMember").html(temp(data));
                              
                              $(document).ready(function(){
                               $(".filter").change(function(){
                                  $('#calendar').fullCalendar('removeEvents');
                                  $('#calendar').fullCalendar('refetchEvents');
                               })
                           }); 
                        }
                   });
                }
            });
         }
      }
   });
      
      
      
   
</script>

</html>