<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리공지 수정</title>

</head>
<body>
	<h1>[동아리공지수정]</h1>
	<form action="cnUpdatePost" method="post" name="frm">
		<input type="hidden" name="cn_no" value="${cnvo.cn_no}">
	   	<table border=1>
			<tr>
	    		<td width=100>Title</td>
	        	<td width=500>
	        		<input type="text" name="cn_title" value="${cnvo.cn_title}"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input type="checkbox" id="cn_bold" name="cn_bold" <c:out value="${cnvo.cn_bold == 1?'checked':'' }"/>> 중요표시  
                  	<input type="checkbox" id="cn_rchk" name="cn_rchk" <c:out value="${cnvo.cn_rchk == 1?'checked':'' }"/>> 댓글표시 
				</td>
	        </tr>
	        <tr>
	        	<td width=100>Writer</td>
	            <td width=500><input type="text" name="id" value="${cnvo.id}" readonly></td>
	        </tr>
	        <tr>
	            <td width=100>Content</td>
	            <td width=500>
	            	<textarea rows="10" cols="50" name="cn_content">${cnvo.cn_content}</textarea>
	       		</td>
	        </tr>
		</table>
		<input type="submit" value="수정"> 
		<input type="reset" value="취소"> 
		<input type="button" value="삭제" id="btnDelete">
		<input type="button" value="목록" onClick="location.href='club_notice?c_code=${cnvo.c_code}'">
	</form>
	<jsp:include page="cn_reply.jsp"></jsp:include>
</body>
<script>


	if($("#cn_bold").is(":checked")) {
		$("#cn_bold").val(1);
	}else {
		$("#cn_bold").val(0);
	}

	//중요표시벨류보내기
	$("#cn_bold").on("change", function() {
		if ($("#cn_bold").is(":checked")) {
			$("#cn_bold").val(1);
		} else {
			$("#cn_bold").val(0);
		}
	});

	if($("#cn_rchk").is(":checked")) {
		$("#cn_rchk").val(1);
	}else {
		$("#cn_rchk").val(0);
	}

	//댓글사용벨류보내기
	$("#cn_rchk").on("change", function() {
		if ($("#cn_rchk").is(":checked")) {
			$("#cn_rchk").val(1);
		} else {
			$("#cn_rchk").val(0);
		}
	});

	//삭제버튼
	$("#btnDelete").on("click", function() {
		var cn_no = $(frm.cn_no).val();
		if (!confirm(cn_no + "를 삭제하시겟습니까?")) return;
		frm.action = "/cnDelete";
		frm.submit();
	});
	//서밋했을때
	$(frm).submit( function(e) {
		e.preventDefault();
		var cn_title = $(frm.cn_title).val();
		var cn_bold = $(frm.cn_bold).val();
		var cn_rchk = $(frm.cn_rchk).val();
		var cn_content = $(frm.cn_content).val();

		alert(cn_title);
		if ($(frm.cn_title).val() == "") {
			alert("글제목");
			$(frm.cn_title).focus();
		} else if ($(frm.cn_content).val() == "") {
			alert("내용을 입력해주세요");
			$(frm.cn_content).focus();
		} else {
			if (!confirm("수정하시겠습니까?")) return;
			frm.submit();
		}
	});
</script>

</html>


