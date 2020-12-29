<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>이벤트 업데이트</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/clup.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/notice.css">
</head>
<body>
<div><jsp:include page="loading.jsp"/></div>
<div><jsp:include page="menu.jsp" /></div>
<p class="clupTitle">이벤트</p>
	<div id="div_contents" class="contents2">
	<form action="event_updatePost" method="post" name="frm">
		<input type="hidden" name="e_no" value="${evo.e_no}">
		<input type="hidden" name="id" value="${evo.id}">
		<div class="board_wrap01">
			<div class="board_ty_list">
				<ul>
					<li><a href="notice">공지사항</a></li>
					<li><a href="event">이벤트</a></li>
					<li><a href="QnA">Q&A</a></li>
				</ul>
			</div>	
			<div class="textbox">
			   <div class="titler" >
			       <textarea name="e_title" class="title_input" style="height: 40px;">${evo.e_title}</textarea>
			       <div name="e_regdate" class="title_time"><fmt:formatDate  value="${evo.e_regdate}" pattern="yyyy-MM-dd"/></div>
			   </div>
			   <div class="cont">
		       		<textarea name="e_content" class="cont_input" style="height: 40px;overflow-y:visible">${evo.e_content}</textarea>
			   </div> 
			   <input type="button" class="btnReturn" value="목록" onClick="location.href='event'">
			   <input type="button" value="삭제" id="btnDelete" class="btnDelete">
			   <button class="btnUpdate">수정</button>		   
			</div>	
		</div>
	</form>
	</div>
<div><jsp:include page="footer.jsp" /></div>
</body>
<script>

	//삭제버튼
	$("#btnDelete").on("click", function() {
		var e_no = $(frm.e_no).val();
  	if (!confirm(e_no + "를 삭제하시겟습니까?")) return;
  	frm.action = "/event_delete";
  	frm.submit();
	});

	//서밋했을때
	$(frm).submit(function(e) {
  	e.preventDefault();
  	var e_title=$(frm.e_title).val();
  	var e_content=$(frm.e_content).val();
  
  	if ($(frm.e_title).val() == "") {
     	alert("제목을 입력해주세요");
     	$(frm.e_title).focus();
  	}else if ($(frm.e_content).val() == "") {
     	alert("내용을 입력해주세요");
     	$(frm.e_content).focus();
  	} else {
     	if (!confirm("수정하시겠습니까?")) return;
     	frm.submit();
  	}
	});
</script>
</html>