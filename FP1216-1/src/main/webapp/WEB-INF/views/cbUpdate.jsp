<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판글쓰기수정</title>

</head>
<body>
   	<h1>[동아리자유게시판수정]</h1>
   	<form action="cbUpdatePost" method="post" name="frm">
	   	<input type="hidden" name="cb_no" value="${cbvo.cb_no}">
	   	<table border=1>
			<tr>
	    		<td width=100>Title</td>
	        	<td width=500>
	        		<input type="text" name="cb_title" value="${cbvo.cb_title}">
				</td>
	        </tr>
	        <tr>
	        	<td width=100>Writer</td>
	            <td width=500><input type="text" name="id" value="${cbvo.id}" readonly></td>
	        </tr>
	        <tr>
	            <td width=100>Content</td>
	            <td width=500>
	            <textarea rows="10" cols="50" name="cb_content">${cbvo.cb_content}</textarea>
	        </td>
	        </tr>
		</table>
		<input type="submit" value="수정"> 
		<input type="reset" value="취소"> 
		<input type="button" value="삭제" id="btnDelete">
		<input type="button" value="목록" onClick="location.href='club_board?c_code=${cbvo.c_code}'">
	</form>
	<jsp:include page="cb_reply.jsp"></jsp:include>
</body>



<script>
	//삭제버튼
   	$("#btnDelete").on("click", function() {
   		var cb_no = $(frm.cb_no).val();
      	if (!confirm(cb_no + "를 삭제하시겟습니까?")) return;
      	frm.action = "/cbDelete";
      	frm.submit();
   	});
   
   	//서밋했을때
   	$(frm).submit(function(e) {
      	e.preventDefault();
      	var cb_title=$(frm.cb_title).val();
      	var cb_content=$(frm.cb_content).val();
      
      	if ($(frm.cb_title).val() == "") {
         	alert("제목을 입력해주세요");
         	$(frm.cb_title).focus();
      	}else if ($(frm.cb_content).val() == "") {
         	alert("내용을 입력해주세요");
         	$(frm.cb_content).focus();
      	} else {
         	if (!confirm("수정하시겠습니까?")) return;
         	frm.submit();
      	}
   	});
</script>
</html>