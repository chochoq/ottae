<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
</head>
<body>
	<h1>자유게시판</h1>
	<div>
		<button onClick="location.href='createBoard'">자유게시판 글쓰기</button>
   		<table border=1>
      		<tr>
         		<td>
	            	<input type="button" value="동아리 공지사항" onClick="location.href='club_notice?c_code=${c_code}'">
	         	</td>
	      	</tr>
		  	<tr>
		       	<td>
		            <input type="button" value="자유 게시판" onClick="location.href='club_board?c_code=${c_code}'">
		       	</td>
      		</tr>
   		</table>
	</div>
	<div>
		<table border=1>
			<tr>
				<td width=50>NO.</td>
				<td width=300>Title</td>
				<td width=100>Writer</td>
				<td width=100>Date</td>
			</tr>
			<c:forEach items="${cblist}" var="vo">
			<tr>
				<td>${vo.cb_no}</td>
				<td><a href="cbRead?cb_no=${vo.cb_no}">${vo.cb_title}</a></td>
				<td>${vo.id}</td>
				<td><fmt:formatDate  value="${vo.cb_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			</c:forEach>
		</table>
	</div>		
<input type="button" value="동아리 목록 메인페이지" onClick="location.href='club_first?c_code=${c_code}'"> 
</body>
</html>