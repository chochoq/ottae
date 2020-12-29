<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainClup.css">
<title>동아리 페이지</title>
</head>
<body>
      <div><jsp:include page="loading.jsp"/></div>
      <div><jsp:include page="menu.jsp" /></div>
      <input type="hidden" value="${clubMaster}" id="clubMaster">
      <div class="all_page2">
         <div>
            <img id="mainImge" class="mainImg" src="display?fileName=${cvo.c_pic}">
       </div>
      <div class="up_left_page">
         <p class="mainTitle">동아리정보</p>
            <table class="c_Information">
               <tr>
                  <td class="c_master"><i class="fas fa-crown" style="font-size: 25px; color: yellow;"></i></td>
                  <td>${cvo.c_pid}</td>
               </tr>
               <tr>
                  <td class="c_people"><i class="fas fa-male"
                     style="font-size: 35px; margin-left: 8px; margin-right: 13px;"></i></td>
                  <td>${maincount}</td>
               </tr>
               <tr>
                  <td class="c_Area"><i class="fas fa-map-marker-alt"
                     style="font-size: 25px; margin-left: 5px; margin-right: 5px;"></i></td>
                  <td>${cvo.c_spot}</td>
               </tr>
            </table>
            <div id="btnJoin"></div>
         </div>
      <div class = "right_page">
         <h2 class = "right_title">회원관리</h2>         
           <!-- 회원 리스트 -->
           <div class="board_content">      
               <!-- 상단에 버튼 -->
               <div class="btn_all"></div>   
               <!-- /상단에 버튼 -->
               <div>
                     <table class="my_list">
                        <tr class="my_list_title2">
                           <td>ID</td>
                             <td>즐겨찾기</td>
                             <td>개인정보 동의</td>
                        </tr>
                        <!--리스트 5개 12-21 -->
                        <tr>
                            <td class="my_id">${id}</td>
                            <td class="my_Mark">
                              	<div id="cu_pchk" class="switch-field" style="margin-left: 70px; margin-top: 10px; margin-bottom: 10px;">
                                 	<input type="radio" id="radio-one" name="cu_pchk" value="y" checked/>
                                 	<label for="radio-one">Yes</label>
	                               	<input type="radio" id="radio-two" name="cu_pchk" value="n"/>
	                               	<label for="radio-two">No</label>
                            	</div>
                          	</td>
                            <td class="my_Information">
                               	<div class="switch-field" style="margin-left: 70px; margin-top: 10px; margin-bottom: 10px;">
                               		<input type="radio" id="radio-three" name="cu_fchk" value="y" checked/>
                               		<label for="radio-three">Yes</label>
                               		<input type="radio" id="radio-five" name="cu_fchk" value="n" />
                               		<label for="radio-five">No</label>
                          		</div>
                             </td>
                             <td style="width: 60px;"><button class="my_up" id="updateCu">수정</button></td>
                        </tr>
                        <!--/리스트 5개 12-21 -->
                  </table>
                </div>
               <div id="clubMasterOnly1">
                     <table class="listUser" id="listUser"></table>
                     <script id="temp" type="text/x-handlebars-template">
                        <tr class="list_title2">
                           <td><input class="all_check" type="checkbox" id="checkAll"></td>
                           <td>ID</td>
                             <td>이름</td>
                             <td>회원상태</td>
                             <td>개인정보 동의</td>
                             <td ><button class="btn_all_del">선택삭제</button></td>
                        </tr>
                  {{#each allCulist}}
                        <tr class="row" uid="{{id}}">
                           <td><input class="check2" type="checkbox"></td>
                           <td class="id">{{id}}</td>
                             <td class="tel">{{name}}</td>
                             <td class="State">{{cu_schk}}</td>
                             <td class="Information">{{cu_pchk}}</td>
                             <td><button class="del_one" id="del_one">삭제</button></td>
                        </tr>
                  {{/each}}
               </script>                     
                 </div>
               <div class="page_wrap" id="clubMasterOnly2">
                  <div class="page_nation" id="page_nation"></div>
                </div>
           </div>             
           <!-- /회원 리스트  -->
         </div>
         
       <div class="down_left_page">
         <p class="mainTitle">메뉴</p>
         <ul class="Kategorie">
            <li>
               <button onClick="location.href='club_first?c_code=${c_code}'" class="c_notice">동아리 메인</button>
            </li>
            <li>
               <button onClick="location.href='club_notice?c_code=${c_code}'" class="c_notice">공지사항</button>
            </li>
            <li>
               <button onClick="location.href='club_board?c_code=${c_code}'" class="c_free">자유게시판</button>
            </li>
            <li>
               <button onClick="location.href='club_user'" class="c_notice">회원관리</button>
            </li>
            <c:if test="${clubMaster == 1}">
               <li>
                  <button onClick="location.href='updateClub'" class="c_free">동아리관리</button>
               </li>
            </c:if>
         </ul>
      </div>
   </div>                  
   <div><jsp:include page="footer.jsp" /></div>
</body>
<script>
var page = 1;

$("#updateCu").on("click",function(){
	alert("수정되었습니다");
});


//동아리 관리자만 회원명단 확인할 수 있도록 한다.
$("#clubMasterOnly1").hide();
$("#clubMasterOnly2").hide();

if($("#clubMaster").val()==1){
   getList();
   $("#clubMasterOnly1").show();
   $("#clubMasterOnly2").show();
}




// 페이지네이션
$("#page_nation").on("click", "a", function(e) {
   e.preventDefault();
   page = $(this).attr("href");
   getList();
});

// 회원 명단을 가져온다
function getList() {
   $.ajax({
      type : "get",
      url : "getClupUser",
      data : {"page":page},
      dataType : "json",
      success : function(data) {
         var temp = Handlebars.compile($("#temp").html());
         $("#listUser").html(temp(data));
                     
              var str="";
              var endPage=0;
              if(data.pm.prev){
                 str += "<a  class='arrow pprev' href='1'></a>";
                str += "<a  class='arrow prev' href='"+ (data.pm.startPage-1) +"'></a>"
           }       
              for(var i=data.pm.startPage; i<=data.pm.endPage; i++){
                 if(page==i){
                    str += "<a href='"+ i +"' class='active'>" + i +"</a>";
                    endpage=i;
                 }else{
                    str += "<a href='"+ i +"'>" + i +"</a>";
                    endpage=i;
                 }
         }
             if(data.pm.next){
                str += "<a  class='arrow pprev' href='"+endpage+"'></a>";
                str += "<a  class='arrow next' href='"+(data.pm.endPage+1)+"'></a>";
            }
             $("#page_nation").html(str);
         
             
         //전체체크
         $("#checkAll").on("change", function(){
            $("#listUser .check2").prop('checked', $(this).prop('checked'));
         });
            
         //삭제버튼삭제(핸들바안에있어서 ajax안에 넣어줌)
         $("#listUser").on("click",".row button", function(){
            var row =$(this).parent().parent();
            var uid =row.attr("uid");
            if(!confirm(uid+"을(를) 삭제하시겠습니까?")) return;
            $.ajax({
               type:"get",
               url:"deleteCu",
               data:{"id":uid},
               success:function(){
                  alert("삭제가 완료되었습니다.");
                  location.reload();
               }
            });
         });
      }
   });
}
</script>
</html>