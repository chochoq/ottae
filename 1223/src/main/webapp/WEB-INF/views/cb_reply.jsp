<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainClup.css">
</head>
<body>
	<div class="right_page2-re">
		<p class="mainTitle">댓글목록</p>
		<input type="hidden" name="id" id="userID" value="${id}">
		<input type="hidden" id="clubMaster"  value="${clubMaster}">

		<div id="divReply"></div>
		<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
			<ul class="right_page2-re-re">
				<li>{{id}}</li>
				<li class="con" reID="{{id}}">{{cbr_content}}</li>
				<li>{{cbr_regdate}}<span class="spantest" chk="0"><button cbr_no="{{cbr_no}}" rn="{{rn}}" wid={{id}} class="btnreDel">삭제</button></span></li>
			</ul>
		{{/each}}
		</script>
		<div class="page_wrap3">
			<div id="page_nation" class="page_nation"></div>
		</div>
		<div id="insertReply" class="right_page2-re-wh">
			<p class="mainTitle">댓글등록</p>
			<textarea class="list_content3" placeholder="내용을 입력하세요" id="txtReply"></textarea>
			<input type="button" value="등록" class="whbutton" id="btnReply">
		</div>
	</div>
</body>
<script>
	var page=1;
	getList();
	
	$("#divReply").on("click","button",function(){
		var cbr_no=$(this).attr("cbr_no");
	   	var rn=$(this).attr("rn");
	    if(!confirm( rn + "번 댓글을 삭제하실래요?")) return;
	    $.ajax({
	        type:"post",
	        url:"cbrDelete",
	        data:{"cbr_no":cbr_no},
	        success:function(){
	           	getList();
	        }
	   	});
	});
	
	$("#txtReply").keydown(function(key){
	  	if(key.keyCode==13){
	    	$("#btnReply").click();
	  	}
	});
	
	$("#btnReply").on("click",function(){
	  	var reply=$("#txtReply").val();     
	    if(reply==""){
	       	alert("내용을 입력해주세요");
	       	return;
	  	}
	    if(!confirm("등록하시겠습니까?"))return;
	  	$.ajax({
	       	type:"post",
	       	url:"insertCbReply",
	       	data:{"reply":reply},
	       	success:function(){
	          	$("#txtReply").val("");
	           	getList();
	       	}
	  	});
	})
	//페이지네이션
	$("#page_nation").on("click","a",function(e){
  		e.preventDefault();
  		page=$(this).attr("href");
  		getList();
	});

	function getList(){
		$.ajax({
	    	type:"get",
	        url:"getCbReply",
	        data:{"page":page},
	        dataType:"json",
			success:function(data){
	           	var temp=Handlebars.compile($("#temp").html());
	           	$("#divReply").html(temp(data));
	           	
				// 내용을 선택하면 삭제 버튼이 나오도록 한다
				var id = $("#userID").val();
				var clubMaster = $("#clubMaster").val();
				
				$(".spantest").hide();
				$("#divReply").on("click",".con",function(){
					var reID = $(this).attr("reID");
					var up = $(this).parent();
					var span = $(up).find(".spantest");
					
					if(clubMaster == 1){
						$(span).show();
					}else{
						if(reID == id){
							$(span).show();
						}
					}
				})
	           	
	           	
	           	var str="";
	           	if(data.pm.prev){
	                 str += "<a href='"+ (data.pm.startPage-1) +"'>◀</a>"
	           	}       
	           	for(var i=data.pm.startPage; i<=data.pm.endPage; i++){
	                 if(page==i){
	                    str += "[<a href='"+ i +"' class='active'>" + i +"</a>]";
	                 }else{
	                    str += "[<a href='"+ i +"'>" + i +"</a>]";
	                 }
				}
	       		if(data.pm.next){
	            	str += "<a href='"+ (data.pm.endPage+1) +"'>▶</a>"
	            }
	          	$("#page_nation").html(str);
			}
	  	});
	}

</script>
</html>