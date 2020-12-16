<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>Club Main Page</title>
</head>
<body>
	<form name ="frm" action="club_first">
		<select id="myClubList" name="c_code"></select>
		<script id="tempMyList" type="text/x-handlebars-template">
		{{#each .}}
			<option value="{{c_code}}">{{c_code}}</option>
        {{/each}}
		</script>  
		<button>이동하기</button>
	</form>
	
	<form name ="frm" action="club_first">
		<select id="clubList" name="c_code"></select>
		<script id="tempList" type="text/x-handlebars-template">
		{{#each .}}
			<option value="{{c_code}}">{{c_code}}</option>
        {{/each}}
		</script>  
		<button>이동하기</button>
	</form>
</body>
<script>
	myClubList();
	clubList();

	function myClubList(){
		$.ajax({
			type :"get",
			url : "myClub",
		    dataType : "json",
		    success : function(data){
		    	var temp = Handlebars.compile($("#tempMyList").html());
				$("#myClubList").html(temp(data));
			}
		});
	}
	function clubList(){
		$.ajax({
			type :"get",
			url : "clublist",
		    dataType : "json",
		    success : function(data){
		    	var temp = Handlebars.compile($("#tempList").html());
				$("#clubList").html(temp(data));
			}
		});
	}
</script>
</html>