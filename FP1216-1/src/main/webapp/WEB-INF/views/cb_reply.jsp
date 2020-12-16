<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 목록</title>
</head>
<body>
    <h1>[댓글 목록]</h1>
   <div id="insertReply">
      <input type="text" id="txtReply" size=50> 
      <input type="button" id="btnReply" value="등록">
         전체댓글수:<span id="total"></span>
    </div>
   
    <div id="divReply"></div>
    <script id="temp" type="text/x-handlebars-template">
    {{#each list}}
		<div>
            <span>{{id}} : {{cbr_content}}</span>
            <span>{{cbr_regdate}}</span>
            <button cbr_no="{{cbr_no}}" rn="{{rn}}" wid={{id}}>삭제</button>
        </div>
        <hr>
    {{/each}}
   </script>
   <div id="pagination"></div>
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

	$("#pagination").on("click","a",function(e){
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
           	$("#total").html(data.pm.totalCount);
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
          	$("#pagination").html(str);
		}
  	});
	}

</script>
</html>