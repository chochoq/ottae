<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainClup.css">
<title>동아리 자유 게시판</title>
</head>
<body>
    <div><jsp:include page="loading.jsp"/></div>
	<div><jsp:include page="menu.jsp" /></div>
	<div class="all_page2">
		<div>
			<img id="mainImge" class="mainImg" src="display?fileName=${cvo.c_pic}">
		</div>
		<div class="up_left_page">
			<p class="mainTitle">동아리정보</p>
			<table class="c_Information">
				<tr>
					<td class="c_master"><i class="fas fa-crown"
						style="font-size: 25px; color: yellow;"></i></td>
					<td>${cvo.c_pid}</td>
				</tr>
				<tr>
					<td class="c_people"><i class="fas fa-male"
						style="font-size: 35px; margin-left: 8px; margin-right: 13px;"></i></td>
					<td>${maincount}</td>
				</tr>
				<tr>
					<td class="c_Area"><i class="fas fa-map-marker-alt"
						style="font-size: 25px; margin-left: 5px; margin-right: 5px;"></i></td>
					<td>${cvo.c_spot}</td>
				</tr>
			</table>
			<div id="btnJoin"></div>
		</div>
		
<!-- 공지사항 부분 -->
		<div class="right_page">
			<h2 class="right_title">자유게시판</h2>
			<div class="button">
				<c:if test="${clubMaster == 1}">
					<button onClick="location.href='createBoard'" class="btn_notice2">글쓰기</button>
				</c:if>
			</div>
			<br> <br>
			<div class="board_common01 notice">
				<ul style="padding-inline-start: 0px;" id="boardList"> </ul>
				<script id="temp" type="text/x-handlebars-template">
				{{#each vo}}
				<li>
					<div class="type">게시판</div>
					<a class="m_title" href="cbRead?cb_no={{cb_no}}">
						<dl style="margin-block-start: 0em; margin-block-end: 0em;">
							<dt>
								{{cb_title}}                           
							</dt>
						</dl>
					</a>
                    <p class="info_r2">
						<span>{{id}}</span>
					</p>
					<p class="info_r">
						<span>{{cb_regdate}}</span>
					</p>
				</li>
				{{/each}}
				</script> 
			</div>
			<div class="page_wrap">
				<div class="page_nation" id="page_nation"></div>
			</div>
		</div>
<!-- 공지사항 부분 끝 -->
		
		
		<div class="down_left_page">
			<p class="mainTitle">메뉴</p>
			<ul class="Kategorie">
				<li>
					<button onClick="location.href='club_first?c_code=${c_code}'" class="c_notice">동아리 메인</button>
				</li>
				<li>
					<button onClick="location.href='club_notice?c_code=${c_code}'" class="c_notice">공지사항</button>
				</li>
				<li>
					<button onClick="location.href='club_board?c_code=${c_code}'" class="c_free">자유게시판</button>
				</li>
				<c:if test="${clubMaster == 1}">
					<li>
						<button onClick="location.href='club_user'" class="c_notice">회원관리</button>
					</li>
					<li>
						<button onClick="location.href='updateClub'" class="c_free">동아리관리</button>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
	<div><jsp:include page="footer.jsp" /></div>
</body>
<script>
var page=1;
getList();
function getList(){
	$.ajax({
    	type:"get",
        url:"boardPageList",
        data:{"page":page},
        dataType:"json",
		success:function(data){
           	var temp=Handlebars.compile($("#temp").html());
           	$("#boardList").html(temp(data));
           	
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

//페이지네이션
$("#page_nation").on("click","a",function(e){
    e.preventDefault();
    page=$(this).attr("href");
    
    getList();
 });
</script>
</html>