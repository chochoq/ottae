<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainClup.css">
<title>자유게시판글쓰기수정</title>
</head>
<body>
    <div><jsp:include page="loading.jsp"/></div>
	<div><jsp:include page="menu.jsp" /></div>
	<div class="all_page4">
		<div>
			<img id="mainImge" class="mainImg" src="display?fileName=${cvo.c_pic}">		</div>
		<div class="up_left_page">
			<p class="mainTitle">동아리정보</p>
			<table class="c_Information">
				<tr>
					<td class="c_master"><i class="fas fa-crown"
						style="font-size: 25px; color: yellow;"></i></td>
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
		<div class="right_page2">
		<form action="cbUpdatePost" method="post" name="frm">
		   	<input type="hidden" name="cb_no" value="${cbvo.cb_no}">
		   	
		   	<div class="head-title">
				<textarea class="head-title-title" name="cb_title">${cbvo.cb_title}</textarea>
				<h5 class="head-title-username">${cnvo.id}</h5>
				<h5 class="head-title-date"><fmt:formatDate  value="${cbvo.cb_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></h5>
			</div>
			<div class="right_page2-cot">
				<textarea class="right_page2-cot-cot" name="cb_content">${cbvo.cb_content}</textarea>
			</div>
			<div class="btncnUpdate">
			<input type="submit" value="수정" class="cnUpdate"> 
			<input type="reset" value="취소" class="cnUpdate"> 
			<input type="button" value="삭제" id="btnDelete" class="cnUpdate">
			</div>
		</form>
		<jsp:include page="cb_reply.jsp"></jsp:include>
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
			<c:if test="${clubMaster == 1}">
				<li>
					<button onClick="location.href='club_user'" class="c_notice">회원관리</button>
				</li>
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