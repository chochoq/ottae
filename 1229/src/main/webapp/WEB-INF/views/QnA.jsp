<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/clup.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/search.css">
<title>QnA</title>
</head>
<body>
    <div><jsp:include page="loading.jsp"/></div>
	<div><jsp:include page="menu.jsp" /></div>
	<p class="clupTitle">QnA</p>
	<div id="div_contents" class="contents2">
		<c:if test="${id eq 'master'}">	
			<a href="createMasterQnA"><button class="btnwh">글쓰기</button></a>
		</c:if>
		<div class="board_wrap01">
			<div class="board_ty_list">
				<ul>
					<li><a href="notice">공지사항</a></li>
					<li><a href="event">이벤트</a></li>
					<li><a href="QnA">Q&A</a></li>
				</ul>
			</div>
			<div class="board_common01 notice">
				<ul id="ulQnAList"></ul>
				<div id="result"> </div>
				<script id="temp" type="text/x-handlebars-template">
				{{#each qlist}}
					<li>
						<div class="type">공지</div>
						<a href="QnA_read?q_no={{q_no}}"> 
							<dl>
								<dt>
									{{q_title}}
								</dt>
								<dd>
									<img src="http://s.nx.com/s2/game/mabinogi/mabiweb/homepage/images/common/icon_gm.png"> 관리자
								</dd>
							</dl>
						</a>
						<p class="info_r">
							<span class="date">{{q_regdate}}</span>
						</p>
					</li>
				{{/each}}
				</script>  	
			</div>
		</div>
	</div>
	<div class="page_wrap">
		<div class="page_nation" id="page_nation"></div>	
	</div>
	<div class="wrap">
		<div class="search">
			<select class="select2">
				<option value="q_title">제목</option>
			</select> 
			<input type="text" class="searchTerm" id="query" value="">
			<button class="searchButton" id="btnSearch">
				<i class="fa fa-search"></i>
			</button>
		</div>
	</div>
	<div><jsp:include page="footer.jsp" /></div>
</body>
<script>
	var page =1; 
	getQnAlist();
	function getQnAlist(){
		var query = $("#query").val();
		$.ajax({
	    	type:"get",
	        url:"QnAList",
	        data:{"page":page,"query":query},
	        dataType:"json",
			success:function(data){
		       	var temp=Handlebars.compile($("#temp").html());
	           	$("#ulQnAList").html(temp(data));
	           	 
	           	$("#result").hide();
	           	if(data.pm.totalCount=='0'){
		        	$("#result").html("검색결과가 없습니다");
		        	$("#result").show();
		        }
	
	           	var str="";
	           	var endPage=0;
	           	if(data.pm.prev){
	           		str += "<a  class='arrow pprev' href='1'></a>";
	                str += "<a  class='arrow prev' href='"+ (data.pm.startPage-1) +"'></a>"
		        }       
	           	for(var i=data.pm.startPage; i<=data.pm.endPage; i++){
	                 if(page==i){
	                    str += "<a href='"+ i +"' class='active'>" + i +"</a>";
	                    endpage=i;
	                 }else{
	                    str += "<a href='"+ i +"'>" + i +"</a>";
	                    endpage=i;
	                 }
				}
	       		if(data.pm.next){
	       			str += "<a  class='arrow pprev' href='"+endpage+"'></a>";
	                str += "<a  class='arrow next' href='"+(data.pm.endPage+1)+"'></a>";
	            }
	          	$("#page_nation").html(str);
	          	$("#query").html(data.query);
	
			}
	  	});
	}

	$("#btnSearch").on("click",function(){
		getQnAlist();
	})

	$("#query").keydown(function(key){
    	if(key.keyCode==13){
			getQnAlist();
    	}
	})

    //페이지네이션
     $("#page_nation").on("click","a",function(e){
         e.preventDefault();
         page=$(this).attr("href");
         
         getQnAlist();
      });

</script>
</html>