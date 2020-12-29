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
<title>동아리 공지 읽기</title>
</head>
<body>
    <div><jsp:include page="loading.jsp"/></div>
	<div><jsp:include page="menu.jsp" /></div>
	<div class="all_page4">
		<div>
			<img id="mainImge" class="mainImg" src="display?fileName=${cvo.c_pic}">
		</div>
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
	   	<input type="hidden" name="cn_no" value="${cnvo.cn_no}">   	
	   	<div class="head-title">
			<textarea class="head-title-title" readonly>${cnvo.cn_title}</textarea>
			<h5 class="head-title-username">${cnvo.id}</h5>
			<h5 class="head-title-date"><fmt:formatDate  value="${cnvo.cn_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></h5>
		<div style="text-align:right; ">	
			<c:if test="${cnvo.cn_bold==1}"><span class="head-title-no">중요공지사항</span></c:if>&nbsp&nbsp&nbsp&nbsp
			<c:if test="${cnvo.cn_rchk==1}"><span class="head-title-no">댓글 허용 게시물</span></c:if>
		</div>	
		</div>
		<div class="right_page2-cot">
			<textarea class="right_page2-cot-cot" readonly>${cnvo.cn_content}</textarea>
		</div>
		<c:if test="${cnvo.cn_rchk == 1}">
			<jsp:include page="cn_reply.jsp"></jsp:include>
		</c:if>
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
</html>