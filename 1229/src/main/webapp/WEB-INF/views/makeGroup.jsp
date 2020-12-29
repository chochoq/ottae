<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/make.css" />
<title>모임 만들기</title>
</head>
<body>
   <div><jsp:include page="loading.jsp"/></div>
   <div><jsp:include page="menu.jsp" /></div>
   <h1 class="clupMake-hedder">모임 만들기</h1>
   <div class="SectionCreateCafe CreateCafe">
      <form action="makeGroupPost" method="post" name="frm" enctype="multipart/form-data">
         <table class="cafe_input">
            <colgroup>
               <col width="114">
               <col width="545">
            </colgroup>
            <tbody>
               <tr class="cafe_name">
                  <th scope="row">
                     <h2 class="makeClupH2">모임 이름</h2>
                  </th>
                  <td>
                     <div class="input_area">
                        <div class="FormInputText" >
                           <input type="text" class="input_text input_txt" name="g_name">
                        </div>
                        <p class="txt">모임이름 을 정해주세요.</p>   
                     </div>
                  </td>
               </tr>
               <tr class="cafe_keyword">
                  <th scope="row">
                      <h2 class="makeClupH2">모임 비밀번호</h2>
                  </th>
                  <td>
                     <div class="SectionCreateCafeKeyword">                     
                        <div class="cafe_keyword_input_area">
                           <div class="FormInputText">
                              <input type="password" class="input_text input_txt2" name="g_pass">                           
                           </div>                                             
                        </div>
                        <p class="txt">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</p>                     
                     </div>                  
                   </td>
               </tr>                     
               <tr>
                         <th scope="row">
                         <h2 class="makeClupH2">메인사진</h2>
                      </th>
                         <td width=500>
                           <img src="http://placehold.it/150x120" id="image" width=150> 
                           <input type="file" name="file" class="imgSel">
                        </td>
                   </tr>                               
            </tbody>
         </table>
         <div class="buttonMake">      
             <input type="button" value="취소" class="btnDel" id="return">
             <input type="submit" value="개설하기" class="btnSave">     
          </div>
       </form>
   </div>
   <div><jsp:include page="footer.jsp" /></div>
</body>



<script>
   // 뒤로가기  
   $(document).ready(function() {
      $("#return").click(function(){            
         window.history.back()       
      });       
   });

   // 사진
   $(frm.file).on("change", function() {
      var file = $(frm.file)[0].files[0];
       $("#image").attr("src", URL.createObjectURL(file));
   });
   $(frm.file).hide();
   $("#image").on("click", function() {
      $(frm.file).click();
   });
   
   //submit 
   $(frm).submit(function(e) {
      e.preventDefault();
       var g_name = $(frm.g_name).val();
       var g_pass = $(frm.g_pass).val();
         
       var num = g_pass.search(/[0-9]/g);
       var eng = g_pass.search(/[a-z]/ig);
       var spe = g_pass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
       var file = $(frm.file)[0].files[0];
       
       if ($(frm.g_name).val() == "") {
          alert("제목을 입력해주세요");
           $(frm.g_name).focus();
           return false;
      }else if ($(frm.g_pass).val() == "") {
           alert("비밀번호를 입력해주세요");
           $(frm.g_pass).focus();
           return false;
       }else if(g_pass.length < 8 || g_pass.length > 20){
           alert("8자리 ~ 20자리 이내로 입력해주세요.");
           return false;
       }else if(g_pass.search(/\s/) != -1){
           alert("비밀번호는 공백 없이 입력해주세요.");
           return false;
       }else if(num < 0 || eng < 0 || spe < 0 ){
           alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
           return false;
       } else if ($(frm.file).val() == "") {
            alert("모임에 사용할 사진을 입력해주세요");
           $(frm.g_pass).focus();
           return false;
       } else {
           if (!confirm("모임을 만드시겟습니까?")) return;
           frm.submit();
      }
   });
</script>

</html>