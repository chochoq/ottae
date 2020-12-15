<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리자유게시판글쓰기</title>

</head>
<body>
   <h1>자유게시판글쓰기</h1>
   <form action="createBoard" method="post" name="frm">
      <table border=1>
         <tr>
            <td width=150>작성자</td>
            <td width=500>${id}</td>
         </tr>
         <tr>
            <td width=150>글제목</td>
            <td width=500><input type="text" name="cb_title" width=100 maxlength="25"> 최대25글자</td>
         </tr>
         <tr>
            <td width=150>내용</td>
            <td width=500 style="text-align: center;"><textarea rows="20"
                  cols="70" name="cb_content">글을 입력해주세요</textarea></td>
         </tr>

      </table>
      <input type="submit" value="저장"> 
      <input type="reset" value="취소"> 
   </form>
	<input type="button" value="목록" onClick="location.href='club_board?c_code=${c_code}'">
</body>
<script>
   //클릭하면 공란 만들기
   var start = true;
   $(frm.cb_content).on("click", function() {
      if (start) {
         $("#cb_content").val("");
         start = false;
      } 
   });

   //서밋했을때
   $(frm).submit(function(e) {
      e.preventDefault();
      var cb_title = $(frm.cb_title).val();
      var cb_content = $(frm.cb_content).val();

      if ($(frm.cb_title).val() == "") {
         alert("글제목을 입력해주세요");
         $(frm.cb_title).focus();
      } else if ($(frm.cb_content).val() == "") {
         alert("내용을 입력해주세요");
         $(frm.cb_content).focus();
      } else {
         if (!confirm("입력하시겟습니까?")) return;
         frm.submit();
      }
   });
</script>
</html>


