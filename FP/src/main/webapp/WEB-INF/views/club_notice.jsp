<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<h1>공지사항</h1>
	<div>
		<c:if test="${clubMaster == 1}">
			<a href="createNotice">글쓰기</a>
		</c:if>
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
         	<c:forEach items="${cnlist}" var="cvo">
            <tr>
               	<td>${cvo.cn_no}</td>
               	<td><a href="cnRead?cn_no=${cvo.cn_no}">${cvo.cn_title}</a></td>
              	<td>${cvo.id}</td>
               	<td><fmt:formatDate  value="${cvo.cn_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
      		</c:forEach>
      	</table>
	</div>
	<input type="button" value="동아리 목록 메인페이지" onClick="location.href='club_first?c_code=${c_code}'">  		
</body>
</html>