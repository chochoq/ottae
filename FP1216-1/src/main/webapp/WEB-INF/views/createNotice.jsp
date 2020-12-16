<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리공지글쓰기</title>

</head>
<body>
   	<h1>동아리공지글쓰기</h1>
   	<form name="frm" action="createNotice" method="post">
      	<table border=1>
         	<tr>
            	<td width=150>작성자</td>
            	<td width=500>${id}</td>
         	</tr>
         	<tr>
            	<td width=150>글제목</td>
            	<td width=500>
            		<input type="text" name = "cn_title" width=100 maxlength="25">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
               		<input type="checkbox" name = "cn_bold" id="cn_bold" value= "0"> 중요표시 
               		<input type="checkbox" name = "cn_rchk" id="cn_rchk" value="0"> 댓글표시</td>
         	</tr>
         	<tr>
            	<td width=150>내용</td>
            	<td width=500 style="text-align: center;">
            		<textarea rows="20" cols="70" name = "cn_content" id="cn_content">글을 입력해주세요</textarea>
            	</td>
         	</tr>

      	</table>
      	<input type="submit" value="저장"> 
    	<input type="reset"  value="취소">
	</form>
   	<input type="button" value="목록" onClick="location.href='club_notice?c_code=${c_code}'">
</body>
<script>
      $("#cn_bold").change(function() {
         if ($("#cn_bold").is(":checked")) {
            $("#cn_bold").val(1);
         }else {
            $("#cn_bold").val(0);
         }
      });
   
      $("#cn_rchk").change(function() {
         if ($("#cn_rchk").is(":checked")) {
            $("#cn_rchk").val(1);
         }else {
            $("#cn_rchk").val(0);
         }
      });

      var start = true;
      $(frm.cn_content).on("click", function() {
         if (start) {
            $("#cn_content").val("");
         }
         start = false;
      });

  //서밋했을때
    $(frm).submit(function(e) {
       e.preventDefault();
       var cn_title=$(frm.cn_title).val();
       var cn_bold=$(frm.cn_bold).val();
       var cn_rchk=$(frm.cn_rchk).val();
       var cn_content=$(frm.cn_content).val();
       
       
       if ($(frm.cn_title).val() == "") {
          alert("글제목");
          $(frm.cn_title).focus();
       } else if ($(frm.cn_content).val() == "") {
          alert("내용을 입력해주세요");
          $(frm.cn_content).focus();
       } else {
          if (!confirm("입력하시겟습니까"))
             return;
          frm.submit();
       }

    });
</script>


</html>

