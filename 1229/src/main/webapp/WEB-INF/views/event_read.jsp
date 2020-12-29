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
<title>이벤트 read</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/clup.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/notice.css">
</head>
<body>
<div><jsp:include page="loading.jsp"/></div>
<div><jsp:include page="menu.jsp" /></div>
<p class="clupTitle">이벤트</p>
	<div id="div_contents" class="contents2">
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
			       <div class="title_read" style="height: 50px;">${evo.e_title}</div>
			       <div class="title_time"><fmt:formatDate  value="${evo.e_regdate}" pattern="yyyy-MM-dd"/></div>
			   </div>
			   <div class="cont">
			       <div  class="cont_read" style="height: 40px;overflow-y:visible">
						${evo.e_content}
					</div>
			   </div> 
			   <a id="return"><button class="btnReturn">목록</button></a>
			</div>	
		</div>	
	</div>
<div><jsp:include page="footer.jsp" /></div>
</body>
<script>
$(document).ready(function() {
	$("#return").click(function(){				
		window.history.back() 		
	});	    
});
</script>
</html>