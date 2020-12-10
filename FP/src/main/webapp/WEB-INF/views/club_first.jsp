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
<title></title>
</head>
<body>
	<h1>동아리 메인 페이지 입니다</h1>
	
	<!-- 동아리 가입 승인 대기자 명단 -->
	<div id="divMaster" clubMaster="${clubMaster}" c_code="${c_code}" >
		
		<div id="divCulist"></div>
       		<script id="temp" type="text/x-handlebars-template">
			<h2>승인 대기 명단</h2>
			승인 대기 인원 : <span id="total"></span>
			<table border=1 id="tblWaitCulist">
				<tr>
           			<td width=50>id</td>
           			<td width=100>이름</td>
           			<td width=200>개인정보 공유 여부</td>
           			<td width=200>관심 키워드</td>
           			<td width=50>승인</td>
       			</tr>
			{{#each wCulist}}
           		<tr>
           			<td>{{id}}</td>
           			<td>{{name}}</td>
          			<td>{{cu_pchk}}</td>
           			<td>{{keyword}}</td>
           			<td><button c_code="{{c_code}}" cu_id="{{id}}">승인</button></td>
          		</tr>
			{{/each}}
			</table>
		</script>    	
    	<div id="pagination"></div>
	</div>
		
	<span>
		<h2><a href="club_notice?c_code=${c_code}">공지사항</a></h2>
	</span>
	<c:if test="${clubMaster == 1}">
		<a href="createNotice">글쓰기</a>
	</c:if>
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
	
	<h2><a href="club_board?c_code=${c_code}">자유게시판</a></h2><a href="createBoard">글쓰기</a>
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
</body>
<hr>
<input type="button" value="메인페이지" onClick="location.href='/'"> 
<script>
$("#divMaster").hide(); // Hide
var page=1;
var c_code=$("#divMaster").attr("c_code");
getCulist();

$("#divCulist").on("click","button",function(){
	var c_code=$(this).attr("c_code");
   	var cu_id=$(this).attr("cu_id");
    if(!confirm( cu_id + "님을 승인하시겠습니까?")) return;
    $.ajax({
        type:"post",
        url:"approveCu",
        data:{"c_code":c_code,"id":cu_id},
        success:function(){
           	getCulist();
        }
   	});
});

$("#btnJoinClub").on("click",function(){
	
});

function getCulist(){
	var clubMaster=$("#divMaster").attr("clubMaster");
	var c_code=$("#divMaster").attr("c_code");
	if(clubMaster == 1){
		$("#divMaster").show(); //Show
		$.ajax({
	    	type:"get",
	        url:"waitCulist",
	        data:{"page":page,"c_code":c_code},
	        dataType:"json",
			success:function(data){
	           	var temp=Handlebars.compile($("#temp").html());
	           	$("#divCulist").html(temp(data));
	           	
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
	}else{
		$("#divMaster").show(); //Show
		$.ajax({
	    	type:"get",
	        url:"chkJoin",
	        dataType:"json",
			success:function(data){
				var chk=data;
				var str="";
				if(chk== 0){
					str = "<input type='button' value='가입신청' id='btnJoinClub'onClick=location.href='club_join'>"
				}else if(chk==1){
					str = "<h2>승인 대기중인 계정입니다.</h2>"
				}else{
					$("#divMaster").hide(); // Hide
					str = ""
				}
				$("#divCulist").html(str);
			}
		});		
		
	}
}


</script>
</html>