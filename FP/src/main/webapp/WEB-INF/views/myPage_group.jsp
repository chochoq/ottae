<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임관리</title>
</head>
<body>
	<h1>[모임관리]</h1>


	<c:if test="${id == null}">
		<button onClick="location.href='login'">로그인</button>
	</c:if>

	<c:if test="${id != null}">
		<img src="display?fileName=${image}" width=150>
		<button onClick="location.href='logout'">로그아웃</button>
		<span>${id}님 입장</span>
	</c:if>
	<button onClick="location.href='Schedule'">일정</button>
	<button onClick="location.href='Group'">모임</button>
	<button onClick="location.href='Club'">동아리</button>
	<button onClick="location.href='Service'">고객센터</button>
	<button onClick="location.href='MyPage'">마이페이지</button>
	<button onClick="location.href='MasterMyPage'">관리자 마이페이지</button>
</body>
</html>