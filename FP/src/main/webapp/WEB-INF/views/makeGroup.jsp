<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>

<body>
   <h1>마이페이지 모임만들기</h1>
   <form action="makeGroupPost" method="post" name="frm"
      enctype="multipart/form-data">
      <table border=1>
         <tr>
            <td>모임 이름</td>
            <td><input type="text" name="g_name"></td>
         </tr>

         <tr>
            <td>모임 비밀번호</td>
            <td><input type="password" name="g_pass"></td>
         </tr>

         <tr>
            <td>모임 이미지</td>
            <td><img src="http://placehold.it/150x120" id="image" width=150>
               <input type="file" name="file"></td>
         </tr>
      </table>

      <input type="submit" value="저장">
      <button onClick="location.href='/'">돌아가기</button>
   </form>

</body>

<script>
   $(frm.file).on("change", function() {
      var file = $(frm.file)[0].files[0];
      $("#image").attr("src", URL.createObjectURL(file));
   });

   $(frm.file).hide();

   $("#image").on("click", function() {
      $(frm.file).click();
   });

   //서밋시
   $(frm).submit(function(e) {
      e.preventDefault();
      var g_name = $(frm.g_name).val();
      var g_pass = $(frm.g_pass).val();
      var g_pic = $(frm.file).val();
      

      if ($(frm.g_name).val() == "") {
         alert("제목을 입력해주세요");
         $(frm.g_name).focus();
      } else if ($(frm.g_pass).val() == "") {
         alert("내용을 입력해주세요");
         $(frm.g_pass).focus();
      } else {
         if (!confirm("모임을 만드시겟습니까?"))
            return;
         alert(g_name+"\n"+g_pass+"\n"+g_pic);
         frm.submit();
      }
   });
</script>

</html>