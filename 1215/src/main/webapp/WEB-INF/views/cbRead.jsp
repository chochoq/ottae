<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>게시판 읽기</title>
</head>
<body>
   	<h1>[게시판 읽기]</h1>
   	<input type="hidden" name="cb_no" value="${cbvo.cb_no}">
   	<table border=1>
		<tr>
    		<td width=100>Title</td>
        	<td width=500>
        		<input type="text" name="cb_title" value="${cbvo.cb_title}" readonly>
			</td>
        </tr>
        <tr>
        	<td width=100>Writer</td>
            <td width=500><input type="text" name="id" value="${cbvo.id}" readonly></td>
        </tr>
        <tr>
            <td width=100>Content</td>
            <td width=500>
            	<textarea rows="10" cols="50" name="cb_content" readonly>${cbvo.cb_content}</textarea>
       		</td>
        </tr>
	</table>
	<input type="button" value="목록" onClick="location.href='club_board?c_code=${cbvo.c_code}'">
	<jsp:include page="cb_reply.jsp"></jsp:include>
</body>
</html>