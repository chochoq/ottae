<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myPageAD.css"/>
<title>마이페이지_동아리</title>
</head>
<body>
	<div><jsp:include page="menu.jsp" /></div>
	<!-- 전체 페이지 시작  -->
	<div id="div_contents" class="contents" style = " padding: 80px 80px 80px 80px;">
	<input type="hidden" id="id" value="${id}">
		<!-- 공지영역&목록 영역 전체 -->
		<div class="board_wrap01">
			<!-- 왼쪽 메뉴 -->
			<div class="board_ty_list">
				<ul>
					<li><a href="myPage_club">동아리 관리</a></li>
					<li><a href="myPage_group">모임  관리</a></li>
					<li><a href="user_update">회원정보 수정</a></li>
				</ul>
			</div>
			<!-- 왼쪽 메뉴 끝 -->
			<!-- 오른쪽 회원검색 역역  -->
			<div><button class = "del_all">전체탈퇴</button></div>
			<div><button class = "maker">만들기</button></div>
			<table class="clupMain" id="tbl_clubList">
				<colgroup>
				    <col class="select">
				    <col class="c_name">
				    <col class="c_pid">
				    <col class="c_category">
					<col class="c_regdate">
					<col class="del_button">
				</colgroup>
				<thead>	
					<tr style="margin-bottom: 15px;">
						<th><input class="check all" type="checkbox"></th>
						<th>이름</th>
						<th>화장 아이디</th>
						<th>카테고리</th>
						<th>개설 날짜</th>
						<th>탈퇴</th>
					</tr>	
				</thead>
				<tbody id="myClubList"></tbody>  			
			</table>	
			<script id="tempMyList" type="text/x-handlebars-template">
				{{#each .}}
					<tr>
						<td><input class="check" type="checkbox"></td>
				    	<td>{{c_name}}</td>
				    	<td>{{c_pid}}</td>
				    	<td>{{c_category}}</td>
				    	<td>{{c_regdate}}</td>
				    	<td><button class="del_one" c_code="{{c_code}}" c_pid="{{c_pid}}">탈퇴</button></td>
				    </tr>
				{{/each}}
			</script>	
			<div class="sub_sps_sch">				
				<div class="search_box">
					<select name="sfl" id="sfl" class="select-cus">
						<option value="">ID</option>
						<option value="">이름</option>
						<option value="">전화번호</option>
					</select>
					<input type="text" name="stx" value="" required="" id="stx" class="frm_input required"  style="width: 50%;" size="15" maxlength="20" placeholder="검색어를 입력하세요">
					<input type="button" value="검색하기" class="btn_submit" style="width: 70px;">
				</div>
			</div>
		</div>
		<!-- 하단영역 끝 -->
	</div>
	<!-- 전체 페이지 끝  -->
	<div><jsp:include page="footer.jsp" /></div>
</body>
<script>
	getMyClubList();
	var id = $("#id").val();
	$('.check.all').on('change', function(){
		$('.check').prop('checked', $(this).prop('checked'));
	});
	$(document).on('click', '.page-box .btn.number', function(){
		$('.page-box .btn.number').removeClass('on');
		$(this).addClass('on');
		return false;
	});
	
	$("#tbl_clubList").on("click","button",function(){
		var c_code=$(this).attr("c_code");
		var c_pid = $(this).attr("c_pid");
		if(c_pid==id){
			alert("동아리를 삭제하시려면 동아리 페이지로 이동하십시오");
		}else{
		    if(!confirm("선택하신 동아리를 탈퇴하시겠습니까?")) return;
		    $.ajax({
		        type:"get",
		        url:"outCu",
		        data:{"c_code":c_code},
		        success:function(){
		           	alert("탈퇴가 완료되었습니다.");
		           	getMyClubList();
		        }
		   	});
		}
	});
	
	function getMyClubList(){
		$.ajax({
	        type:"get",
	        url:"myClub",
	        dataType:"json",
	        success:function(data){
	        	var temp = Handlebars.compile($("#tempMyList").html());
				$("#myClubList").html(temp(data));			
	        }
	   	});
	}

</script>
</html>