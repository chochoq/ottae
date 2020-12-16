<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainClup.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리 자유 게시판</title>
</head>
<body>
	<div><jsp:include page="menu.jsp" /></div>
	<div class="all_page2">
		<div>
			<img id="mainImge" class="mainImg" src="https://mblogthumb-phinf.pstatic.net/MjAxOTAzMDZfMTM3/MDAxNTUxODE0NTI0NDkz.RvXlYv6p5xPwXrOIPfABgFuiknuTn0iFZNuUguVYc_og.ii04J6D96C6FKQSXQzy9DABBNk7vNuU343nmAquhmZgg.JPEG.mong728/초고화질_컴퓨터_배경화면_(7).jpg?type=w800">
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
		
		
		<div class="right_page">
			<h2 class="right_title">자유게시판</h2>

			<div class="button">
				<c:if test="${clubMaster == 1}">
					<a href="createBoard">글쓰기</a>
				</c:if>
			</div>
			<br> <br>
			<div class="board_common01 notice">
				<ul style="padding-inline-start: 0px;">
					<c:forEach items="${cblist}" var="vo">
					<li>
						<div class="type">게시판</div>
						<dl style="margin-block-start: 0em; margin-block-end: 0em;">
							<dt>
								<a class="m_title" href="cbRead?cb_no=${vo.cb_no}">${vo.cb_title}</a> <span class="namecl">${vo.id}</span>
							</dt>
						</dl>
						<p class="info_r">
							<span><fmt:formatDate  value="${vo.cb_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						</p>
					</li>
					</c:forEach>
				</ul>
			</div>
			<div class="page_wrap">
				<div class="page_nation"></div>
			</div>
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
						<button onClick="" class="c_notice">회원관리</button>
					</li>
					<li>
						<button onClick="" class="c_free">동아리관리</button>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
	<div><jsp:include page="footer.jsp" /></div>
</body>
<script>
</script>
</html>