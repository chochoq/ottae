<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/clup.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/search.css">
<title>이벤트페이지</title>
</head>
<body>
	<div><jsp:include page="menu.jsp" /></div>
	<p class="clupTitle">이벤트</p>
	<div id="div_contents" class="contents2">	
		<a href="createMasterEvent"><button class="btnwh">글쓰기</button></a>
		<div class="board_wrap01">
			<div class="board_ty_list">
				<ul>
					<li><a href="/">홈으로</a></li>
					<li><a href="notice">공지사항</a></li>
					<li><a href="event">이벤트</a></li>
					<li><a href="QnA">Q&A</a></li>
				</ul>
			</div>
			<div class="board_common01 notice">
				<ul>
				<c:forEach items="${elist}" var="evo">
					<li>
						<div class="type">이벤트</div> 
						<dl>
							<dt>
								<a href="event_read?e_no=${evo.e_no}">${evo.e_title}</a>
							</dt>
							<dd>
								<img src="http://s.nx.com/s2/game/mabinogi/mabiweb/homepage/images/common/icon_gm.png"> 관리자
							</dd>
						</dl>
						<p class="info_r">
							<span class="date"><fmt:formatDate  value="${evo.e_regdate}" pattern="yyyy-MM-dd"/></span>
						</p>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="search">
			<select class="select2">
				<option>adadad</option>
			</select> <input type="text" class="searchTerm">
			<button type="submit" class="searchButton">
				<i class="fa fa-search"></i>
			</button>
		</div>
	</div>
	<div><jsp:include page="footer.jsp" /></div>
</body>
</html>