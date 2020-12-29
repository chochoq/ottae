<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>QnA 글쓰기</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/clup.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/notice.css">
</head>
<body>
<div><jsp:include page="loading.jsp"/></div>
<div><jsp:include page="menu.jsp" /></div>
<p class="clupTitle">QnA 글쓰기</p>
	<div id="div_contents" class="contents2">
	<form action="createMasterQnA" method="post" name="frm">
		<div class="board_wrap01">
			<div class="board_ty_list">
				<ul>
					<li><a href="/">홈으로</a></li>
					<li><a href="notice">공지사항</a></li>
					<li><a href="event">이벤트</a></li>
					<li><a href="QnA">Q&A</a></li>
				</ul>
			</div>	
			<div class="textbox">
			   <div class="titler" >
			       <textarea name="q_title" placeholder="제목을 입력해 주세요." class="title_input" style="height: 40px;"></textarea>
			   </div>
			   <div class="cont">
		       		<textarea name="q_content" placeholder="내용을 입력해 주세요" class="cont_input" style="height: 40px;overflow-y:visible"></textarea>
			   </div> 
			   <input type="button" class="btnReturn" value="목록" onClick="location.href='QnA'">
			   <input type="submit" class="btnSub" value="저장">
			</div>	
		</div>
	</form>
	</div>
<div><jsp:include page="footer.jsp" /></div>
</body>
<script>
	var start = true;
	$(frm.q_content).on("click", function() {
	   if (start) {
	      $("#q_content").val("");
	   }
	   start = false;
	});

	//서밋했을때
	$(frm).submit(function(e) {
  	e.preventDefault();
  	var q_title=$(frm.q_title).val();
  	var q_content=$(frm.q_content).val();
  
  	if ($(frm.q_title).val() == "") {
     	alert("제목을 입력해주세요");
     	$(frm.q_title).focus();
  	}else if ($(frm.q_content).val() == "") {
     	alert("내용을 입력해주세요");
     	$(frm.q_content).focus();
  	} else {
     	if (!confirm("저장하시겠습니까?")) return;
     	frm.submit();
  	}
	});

</script>
</html>