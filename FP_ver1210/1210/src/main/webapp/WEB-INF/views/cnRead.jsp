<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>공지 읽기</title>
</head>
<body>
   	<h1>[공지 읽기]</h1>
   	<input type="hidden" name="cn_no" value="${cnvo.cn_no}">
   	<table border=1>
		<tr>
    		<td width=100>Title</td>
        	<td width=500>
        		<input type="text" name="cn_title" value="${cnvo.cn_title}" readonly> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<c:if test="${cnvo.cn_bold=='1'}">중요공지사항</c:if>&nbsp&nbsp&nbsp&nbsp
				<c:if test="${cnvo.cn_rchk=='1'}">댓글 허용 게시물</c:if>
			</td>
        </tr>
        <tr>
        	<td width=100>Writer</td>
            <td width=500><input type="text" name="id" value="${cnvo.id}" readonly></td>
        </tr>
        <tr>
            <td width=100>Content</td>
            <td width=500>
            	<textarea rows="10" cols="50" name="cn_content" readonly>${cnvo.cn_content}</textarea>
       		</td>
        </tr>
	</table>
	<input type="button" value="목록" onClick="location.href='club_notice?c_code=${cnvo.c_code}'">
	<jsp:include page="cn_reply.jsp"></jsp:include>
</body>
</html>