<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/loanding.css">
</head>
<body>
    <div id="loadingIndicator" class="preloader">
		<div class="loader">
			<ul class="hexagon-container">
				<li class="hexagon hex_1"></li>
				<li class="hexagon hex_2"></li>
				<li class="hexagon hex_3"></li>
				<li class="hexagon hex_4"></li>
				<li class="hexagon hex_5"></li>
				<li class="hexagon hex_6"></li>
				<li class="hexagon hex_7"></li>
			</ul>
		</div>
	</div>
</body>
<script>
window.onload = function() {
	document.getElementById("loadingIndicator").style.opacity = "0";
	setTimeout(function() {
		document.getElementById("loadingIndicator").style.display = "none";
	}, 450);
}
</script>
</html>