<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>가입신청 상세</title>
</head>
<body>
	<form action="joinClub" method="post">
		<table>
			<tr>
				<td width=150></td>
				<td width=500>${id}</td>
			</tr>
			<tr>
				<td width=150>개인정보 공유여부</td>
				<td width=500>
					<input type="radio" name="cu_pchk" value="y" checked="checked">예 
					<input type="radio" name="cu_pchk" value="n">아니오
				</td>
			</tr>
			<tr>
				<td width=150>즐겨찾기 여부</td>
				<td width=500>
					<input type="radio" name="cu_fchk" value="y" checked="checked">예 
					<input type="radio" name="cu_fchk" value="n">아니오
				</td>
			</tr>
		</table>
		<button type="submit">신청</button>
		<input type="button" onClick="location.href='clubMain'" value="취소">
	</form>           
</body>
</html>