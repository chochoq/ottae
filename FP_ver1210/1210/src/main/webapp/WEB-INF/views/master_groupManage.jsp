<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myPageAD.css" />
<title>관리자 마이페이지_모임관리</title>
</head>
<body>
	<div><jsp:include page="menu.jsp" /></div>
	<!-- 전체 페이지 시작  -->
	<div id="div_contents" class="contents" style="padding: 80px 80px 80px 80px;">
		<!-- 공지영역&목록 영역 전체 -->
		<div class="board_wrap01">
			<!-- 왼쪽 메뉴 -->
			<div class="board_ty_list">
				<ul>
					<li><a href="master_userManage">회원 관리</a></li>
					<li><a href="master_clubManage">동아리 관리</a></li>
					<li><a href="master_groupManage">모임 관리</a></li>
				</ul>
			</div>
			<!-- 왼쪽 메뉴 끝 -->
			<!-- 오른쪽 회원검색 역역  -->
			<div class="sub_sps_sch">
				<div class="search_box"> 
					<select name="searchType" id="sfl" class="select-cus">
						<option value="g_name">모임 이름</option>
					</select> 
					<input type="text" id="stx" class="frm_input required" style="width: 50%;" size="15" maxlength="20" value="${pm.keyword}">
					<input type="button" value="검색하기" class="btn_submit" id="btnSearch" style="width: 70px;">
				</div>
			</div>
			<div>
				<button class="del_all2" id="del_all">선택삭제</button>
			</div>
			<!-- 전체유저수:<span id="total"></span> -->
			<table class="clupMain2" id="clupMain"> </table>
			<script id="temp" type="text/x-handlebars-template">
				<thead>                                     
					<tr style="margin-bottom: 15px;">
						<th class="select">
							<input type="checkbox" id="checkAll">
						</th>
						<th class="m_name">모임 이름</th>
						<th class="kategorie">개설 날짜</th>
						<th class="del_button">삭제</th>
					</tr>
	            </thead>	       
            {{#each mglist}}
				<tr class=row g_code="{{g_code}}">
            		<td class="chk"><input class="check"  type="checkbox"></td>
                	<td>{{g_name}}</td>
                	<td>{{g_regDate}}</td>
                	<td><button class="del_one" >삭제</button></td>
            	</tr>
            	<hr>
            {{/each}}
            </script>
			<!-- 오른쪽 회원검색 끝  -->
			<div class="page_wrap">
				<div class="page_nation" id="page_nation"></div>
			</div>
			<!-- 오른쪽 동아리검색 역역  -->
			<!-- 오른쪽 모임검색 끝  -->
		</div>
		<!-- 하단영역 끝 -->
	</div>
	<!-- 전체 페이지 끝  -->
	<div><jsp:include page="footer.jsp" /></div>
</body>
<script>
	var page = 1;
	var keyword = $("#stx").val();
	var searchType = $("#sfl").val();
	
	getList();
	
	//페이지네이션
	$("#page_nation").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getList();
	});
	
	//검색
	$("#btnSearch").on("click",function(){
		getList();
	});
	$("#stx").keydown(function(key){
		if(key.keyCode==13){
			getList();	
		}
	});
	
	//체크박스선택삭제
 	$("#del_all").on("click", function() {
 		if (!confirm("선택한 모임을 삭제하시겠습니까?")) return;
 		$("#clupMain .row .check:checked").each(function() {
 			if ($(this).is(":checked")) {
 				var row =$(this).parent().parent();
 				var g_code =row.attr("g_code");
 				$.ajax({
 	 				type : "post",
 	 				url : "group_sel_delete",
 	 				data : { "g_code" : g_code },
 	 				success : function() { }
 	 			});
			}	
 		});
 		alert("삭제를 완료하였습니다");	
 		getList();
 	});

	
	function getList() {
		keyword = $("#stx").val();
		searchType = $("#sfl").val();
		
		$.ajax({
			type : "get",
			url : "mglist",
			data : {"page":page,"keyword":keyword,"searchType":searchType},
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#clupMain").html(temp(data));
				$("#total").html(data.pm.totalCount);
								
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
				
	       		
				//전체체크
				$("#checkAll").on("change", function(){
					$("#clupMain .check").prop('checked', $(this).prop('checked'));
				});
					
				//삭제버튼삭제(핸들바안에있어서 ajax안에 넣어줌)
				$("#clupMain").on("click",".row button", function(){
					var row =$(this).parent().parent();
					var g_code =row.attr("g_code");
					if(!confirm(g_code+"을(를) 삭제하시겠습니까?")) return;
					$.ajax({
						type:"post",
						url:"group_sel_delete",
						data:{"g_code":g_code},
						success:function(){
							$("#btnSearch").click();
						}
					});
					
				});
			}
		});
	}
</script>
</html>