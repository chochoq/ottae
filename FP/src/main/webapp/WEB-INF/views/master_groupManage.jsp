<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/resources/css/myPageAD.css"/>
<title>관리자 마이페이지</title>
</head>
<body>
    <div><jsp:include page="menu.jsp" /></div>
	<!-- 전체 페이지 시작  -->
	<div id="div_contents" class="contents" style = " padding: 80px 80px 80px 80px;">
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
			<div><button class = "del_all">전체삭제</button></div>
		    <table class="clupMain">
				<colgroup>
				    <col class="select">
				    <col class="m_name">
				    <col class="Personnel">
					<col class="Opendate">
					<col class="del_button">
				</colgroup>
				<thead>
					<tr>
					</tr>
					<tr>
						<th><input class="check all" type="checkbox"></th>
						<th>이름</th>
						<th>아이디</th>
						<th>개설 날짜</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
		      			<td><input class="check" type="checkbox"></td>
		     			<td>모임이름</td>
		     			<td>ID</td>
		     			<td>2020-12-02</td>
		     			<td><button class="del_one">삭제</button></td>
		    		</tr>
		    		<tr>
		      			<td><input class="check" type="checkbox"></td>
		     			<td>모임이름</td>
		     			<td>ID</td>
		     			<td>2020-12-02</td>
		     			<td><button class="del_one">삭제</button></td>
		    		</tr>
		    		<tr>
		      			<td><input class="check" type="checkbox"></td>
		     			<td>모임이름</td>
		     			<td>ID</td>
		     			<td>2020-12-02</td>
		     			<td><button class="del_one">삭제</button></td>
		    		</tr>
		    		<tr>
		      			<td><input class="check" type="checkbox"></td>
		     			<td>모임이름</td>
		     			<td>ID</td>
		     			<td>2020-12-02</td>
		     			<td><button class="del_one">삭제</button></td>
		    		</tr>
		    		<tr>
		      			<td><input class="check" type="checkbox"></td>
		     			<td>모임이름</td>
		     			<td>ID</td>
		     			<td>2020-12-02</td>
		     			<td><button class="del_one">삭제</button></td>
		    		</tr>
		    		<tr>
		      			<td><input class="check" type="checkbox"></td>
		     			<td>모임이름</td>
		     			<td>ID</td>
		     			<td>2020-12-02</td>
		     			<td><button class="del_one">삭제</button></td>
		    		</tr>
				</tbody>
				
					<div class="sub_sps_sch">
							
							<div class="search_box">
								<select name="sfl" id="sfl" class="select-cus">
								<option value="">이름</option>
								<option value="">참여인원</option>
								</select>
								<input type="text" name="stx" value="" required="" id="stx" class="frm_input required"  style="width: 50%;" size="15" maxlength="20" placeholder="검색어를 입력하세요">
								<input type="button" value="검색하기" class="btn_submit" style="width: 70px;">
							</div>
					</div>
			</table>
		</div>
		<!-- 하단영역 끝 -->
	</div>
	<!-- 전체 페이지 끝  -->
	<div><jsp:include page="footer.jsp" /></div>
</body>
<script>
	$('.check.all').on('change', function(){
		$('.check').prop('checked', $(this).prop('checked'));
	});
	$(document).on('click', '.page-box .btn.number', function(){
		$('.page-box .btn.number').removeClass('on');
		$(this).addClass('on');
		return false;
	})

</script>
</html>