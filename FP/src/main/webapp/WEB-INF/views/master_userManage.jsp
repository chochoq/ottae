<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/myPageAD.css" />
<title>관리자 마이페이지</title>
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
						<option id="id" value="id" <c:out value="${pm.cri.searchType=='id'?'selected':''}"/>>ID</option>
						<option value="name" <c:out value="${pm.cri.searchType=='name'?'selected':''}"/>>이름</option>
						<option value="birthday" <c:out value="${pm.cri.searchType=='birthday'?'selected':''}"/>>생년월일</option>
						<option value="email" <c:out value="${pm.cri.searchType=='email'?'selected':''}"/>>Email</option>
						<option value="gender" <c:out value="${pm.cri.searchType=='gender'?'selected':''}"/>>성별</option>
						<option value="u_keyword" <c:out value="${pm.cri.searchType=='u_keyword'?'selected':''}"/>>키워드</option>
					</select> 
					<input type="text" id="stx" class="frm_input required" style="width: 50%;" size="15" maxlength="20" value="${pm.keyword}">
					<input type="button" value="검색하기" class="btn_submit" id="btnsearch" style="width: 70px;">
				</div>
			</div>
			<div>
				<button class="del_all" id="del_all">선택삭제</button>
			</div>
			<!-- 전체유저수:<span id="total"></span> -->
			<table class="clupMain" id="clupMain"> </table>
			<script id="temp" type="text/x-handlebars-template">
				<thead>                                       
	            	<tr style="margin-bottom: 15px;">
	                	<th>
							<input type="checkbox" id="checkAll">
						</th>
	                  	<th>아이디</th>
	                  	<th>이름</th>
	                  	<th>생년월일</th>
	                  	<th>이메일</th>
	                  	<th>성별</th>
	                  	<th>키워드</th>
	                  	<th>삭제</th>
	            	</tr>
	            </thead>
	       
            {{#each mulist}}
				<tr class=row uno ="{{uno}}">
            		<td class="chk"><input id="uno" class="check"  type="checkbox"></td>
                	<td>{{id}}</td>
                	<td>{{name}}</td>
                	<td>{{birthday}}</td>
                	<td>{{email}}</td>
                	<td>{{gender}}</td>
                	<td>{{u_keyword}}</td>
                	<td><button class="del_one" >삭제</button></td>
            	</tr>
            	<hr>
            {{/each}}
            </script>
			<!-- 오른쪽 회원검색 끝  -->
			<div id="pagination"></div>
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
	var id = $("#id").val();
	
	getList();
	
	//페이지네이션
	$("#pagination").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getList();
	});
	
	
	
	//검색
	$("#btnsearch").on("click",function(){
		getList();
	});
	$("#stx").keydown(function(key){
		if(key.keyCode==13){
			getList();	
		}
	});

	function getList() {
		keyword = $("#stx").val();
		searchType = $("#sfl").val();
		
		$.ajax({
			type : "get",
			url : "mulist",
			data : {"page":page,"keyword":keyword,"searchType":searchType},
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#clupMain").html(temp(data));
				$("#total").html(data.pm.totalCount);

				var str = "";
				if (data.pm.prev) {
					str += "<a href='" + (data.pm.startPage - 1) + "'>◀</a>"
				}
				for (var i = data.pm.startPage; i <= data.pm.endPage; i++) {
					if (page == i) {
						str += "[<a href='"+ i +"' class='active'>" + i + "</a>]";
					} else {
						str += "[<a href='"+ i +"'>" + i + "</a>]";
					}
				}
				if (data.pm.next) {
					str += "<a href='" + (data.pm.endPage + 1) + "'>▶</a>"
				}
				$("#pagination").html(str);
				
				//전체체크
				$("#checkAll").on("change", function(){
					$("#clupMain .check").prop('checked', $(this).prop('checked'));
				});
				
				
				
				//삭제버튼삭제(핸들바안에있어서 ajax안에 넣어줌)
				$("#clupMain").on("click",".row button", function(){
					var row =$(this).parent().parent();
					var uno =row.attr("uno");
					if(!confirm(uno+" 삭제????")) return;
					$.ajax({
						type:"post",
						url:"delete",
						data:{"uno":uno},
						success:function(){
							alert("메시지삭제");
							getList();
						}
					});
				});
			}
		});
	}
	
	
	//체크박스선택삭제
 	$("#del_all").on("click", function() {
 		if (!confirm("선택한 사용자를 삭제하시겠습니까?"))
 			return;
 		$("#clupMain .row .check:checked").each(function() {
 			if ($(this).is(":checked")) {
 				var row =$(this).parent().parent();
 				var uno =row.attr("uno");
 				alert(uno+"삭제삭제");
 			}
 			
 		
 			$.ajax({
 				type : "post",
 				url : "user_sel_delete",
 				data : {
 					"uno" : uno
 				},
 				success : function() {
 					alert("삭제완료");
 					getList();
 				}
 			});
 		});
 	});
</script>
</html>