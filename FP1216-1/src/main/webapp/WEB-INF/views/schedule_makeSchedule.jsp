<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>[일정만들기]</title>
</head>
<body>
	<form name="frm" action="makeCal" method="get">
		<table border=1>
			<tr>
				<td>시간</td>
				<td>시작날짜<input type="date" id='cal_sdate' /> 시작시간:<input
					type='time' name='cal_stime' />
				</td>
			</tr>
			<tr>
				<td></td>
				<td>종료날짜<input type='date' id='cal_edate' min="2020-01-01" />
					종료시간:<input type='time' name='cal_etime' />
				</td>
			</tr>
			<tr>
				<td>일정이름:</td>
				<td><input type="text" name="cal_title" maxlength="25">최대 25글자</td>
			</tr>
			<tr>
				<td>일정분류:</td>
				<td>
					<select id="joinedGroup"></select> 
					<script id="temp" type="text/x-handlebars-template">
						<option value="0">개인일정</option>
						{{#each .}}
							<option value="{{g_code}}">{{g_name}}</option>
                  		{{/each}}
					</script>
				</td>
			</tr>
			<tr>
				<td>함께할 사람:</td>
				<td id="joinedMember"></td>
				<script id="temp1" type="text/x-handlebars-template">
            		{{#each .}}
              			<input type="checkbox" value="{{id}}">{{name}}
           			{{/each}}
            	</script>
			</tr>
			<tr>
				<td>컨텐츠:</td>
				<td><textarea rows="3" cols="70" id="cal_content">일정내용을 입력해주세요</textarea></td>
			</tr>
			<tr>
				<td>일정위치</td>
				<td><input type="text" name="cal_place"></td>
			</tr>
			<tr>
				<td>일정공유여부:</td>
				<td>
					y:<input type="radio" name="cal_schk" value="y"  checked="checked">> 
					n:<input type="radio" name="cal_schk" value="n">
				</td>
			</tr>
		</table>
		<input type="hidden" name="cal_sdchk" value="0"> 
		<input type="submit" value="완료">
		<input type = "reset" value = "취소">		 
	</form>
	<button onClick="location.href='/'">돌아가기</button>

</body>
<script>
	chkSdchk();

	function chkSdchk(){
		$.ajax({
			type :"get",
			url : "myGroup",
	       	dataType : "json",
	       	success : function(data){
	        	var temp = Handlebars.compile($("#temp").html());
	            $("#joinedGroup").html(temp(data));
	            $("#joinedMember").html("개인일정입니다. ");
			}
		});
	}
	
	
	   //서밋했을때
	   $(frm).submit(function(e) {
	      e.preventDefault();
	      

	      if($(frm.cal_title).val()==""){
	         alert("제목을 입력해주세요")
	         $(frm.cal_title).focus(); 
	      }else{
	         if (!confirm("입력하시겟습니까?")) return;
	         alert($(frm.cal_title).val() + "\n" + $(frm.cal_sdate).val() +"\n"+$(frm.cal_edate).val());
	         frm.submit();
	      }
	   });


	$("#joinedGroup").on("change",function(){
		var selectG_code = $("#joinedGroup").val();
	    if(selectG_code != "0"){
	    	$.ajax({
	        	type :"get",
	          	url : "guget",
	          	dataType : "json",
	          	data : {"g_code" : selectG_code},
	          	success : function(data){
	            	var temp = Handlebars.compile($("#temp1").html());
	               	$("#joinedMember").html(temp(data));
	          	}
	      	});
	   	}else{
	    	var str="개인 일정입니다."
	        $("#joinedMember").html(str);
	   	}
	})
</script>
</html>