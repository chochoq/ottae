<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<title></title>
<style>
* {
	margin: 0px auto;
	text-align: center;
}

body {
	font-family: Helvetica;
	background: #eee;
	-webkit-font-smoothing: antialiased;
	.
}

table {
	width: 550px;
	margin: 1em auto;
	padding: 3em 2em 2em 2em;
	background: #fafafa;
	border: 1px solid #ebebeb;
	box-shadow: rgba(0, 0, 0, 0.14902) 0px 1px 1px 0px,
		rgba(0, 0, 0, 0.09804) 0px 1px 2px 0px;
}

table td {
	padding: 5px;
}

/* Button */
.button {
	position: relative;
	display: inline-block;
	padding: 12px 24px;
	width: 200px;
	vertical-align: middle;
	color: #fff; /* 버튼안의 택스트 글자색 */
	font-size: 16px;
	line-height: 20px;
	-webkit-font-smoothing: antialiased;
	text-align: center;
	letter-spacing: 1px;
	background: transparent;
	border: 0;
	border-bottom: 2px solid #3160B6;
	cursor: pointer;
	transition: all 0.15s ease;
}

.button:focus {
	outline: 0;
}

/* Button modifiers */
.buttonBlue {
	background: #4a89dc; /* 버튼 색상 */
	text-shadow: 1px 1px 0 rgba(39, 110, 204, .5);
}

.buttonBlue:hover {
	background: #357bd8;
} /* 버튼 색상 */
a {
	text-decoration: none
}

footer {
	text-align: center;
}

footer p { /* 하단에 p태그안의 택스트 */
	color: #888;
	font-size: 13px;
	letter-spacing: .4px;
}

footer a {
	color: #4a89dc; /* 하단에 링크의 색상 */
	text-decoration: none;
	transition: all .2s ease;
}

footer a:hover {
	color: #666; /* 하단에 링크가 호버 됐을때 색상 */
	text-decoration: underline;
}

footer img {
	width: 80px;
	transition: all 0.2s ease; /* 하단에 이미지의 색이 변하는 시간 */
}

footer img:hover {
	opacity: 0.7;
} /* 하단에 이미지의 호버됐을 때 불투명도 (max 1) */
footer img:focus, footer a:focus {
	outline: none;
}
</style>
</head>
<body>
	<div style="height: 150px;"></div>
	<form name="frm" action="signup" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td colspan="3"><a target="_blank" style="font-weight: bold; color: #A6BCD5; font-size: 40px;">회원가입</a></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align: center;">프로필사진</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<img src="http://placehold.it/150x120" id="image" name="image" width=100 height=120> 
					<input type="file" name="file">
				</td>
			</tr>
			<tr>
				<td>ID</td>
				<td>
					<input type="text" name="id" size="20" maxlength="20" minlength="4" required class="id" oninput="checkId()" id="checkaa">
				</td>
			</tr>
			
			<tr>
				<td>PW</td>
				<td>
					<input type="password" size="20" name="pw" 
					maxlength="20" minlength="4" required class="pass" 
					oninput="checkPwd()">
				</td>
			</tr>
			<tr>
				<td>중복확인</td>
				<td>
					<input type="password" size="20" name="repw" 
					maxlength="20" required class="pass" id="repwd" 
					oninput="checkPwd()">
				</td>
			</tr>
			<tr>
				<td>Emall</td>
				<td>
					<input type="text" name="Femail" size="5" required class="id" oninput="checkId()"> @ 
					<select name="Lemail">
						<option value="@naver.com">naver.com</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@hanmail.net">hanmail.net</option>
						<option value="@nate.com">nate.com</option>
					</select> 
					<input type="hidden" name="email">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="m" checked="checked"> 남자 
					<input type="radio" name="gender" value="f"> 여자
				</td>
			</tr>
			<tr>
				<td>Name</td>
				<td>
					<input type="text" size="20" name="name" maxlength="5" required class="id" oninput="checkId()">
				</td>

			</tr>
			<tr>
				<td>Birthday</td>
				<td>
					<input type='date' name='birthday' value="1990-06-13" min="1900-01-01" max="2010-12-31" />
				</td>
			</tr>
			<tr>
				<td>Tel</td>
				<td>
					<input type="text" name="Fphone" maxlength="3" size="1" required class="id" oninput="checkId()">-
					<input type="text" name="Sphone" maxlength="4" size="2" required class="id" oninput="checkId()">-
					<input type="text" name="Lphone" maxlength="4" size="2" required class="id" oninput="checkId()">
					<input type="hidden" name="phone">
				</td>
			</tr>
			<tr>
				<td>Address</td>
				<td>
					<input type="text" id="sample6_postcode" placeholder="우편번호" size="5"> 
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					<br>
					<input type="text" id="sample6_address" placeholder="주소" name="addr" required class="id" oninput="checkId()">
					<br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addrDetail">
				</td>
			</tr>
			<tr>
				<td>관심키워드</td>
				<td>
					<textarea rows="3" cols="30" name="u_keyword" required class="id" oninput="checkId()"></textarea>
				</td>
			</tr>
		</table>

		<!-- 로그인 버튼 -->
		<button class="button buttonBlue" id="login"> 돌아가기
			<div class="ripples">
				<span class="ripplesCircle"></span>
			</div>
		</button>
		<!-- 회원 등록 버튼 -->
		<button class="button buttonBlue" id="btnSave" disabled="disabled"> 가입하기
			<div class="ripples">
				<span class="ripplesCircle"></span>
			</div>
		</button>
	</form>

	<!-- 공간 확보를 위한 div -->
	<div style="height: 150px;"></div>

</body>
<script>
	// 다음 지도
	function sample6_execDaumPostcode(){
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				}else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
						// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') { extraAddr = ' (' + extraAddr + ')';
					}
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress") .focus();
			}
		}).open();
	}
	//아이디 비번 중복체크를 위한 변수
	var idCheck = 0;
	var pwdCheck = 0;

	//중복체크후 submit비활성화
	function checkId() {
		//email phone
		var email = $(frm.Femail).val() + $(frm.Lemail).val();
		$(frm.email).val(email);
		var phone = $(frm.Fphone).val() + "-" + $(frm.Sphone).val() + "-"
				+ $(frm.Lphone).val();
		$(frm.phone).val(phone);

		var inputed = $('.id').val();
		$.ajax({
			data : { id : inputed },
			url : "idchk",
			success : function(data) {
				if (inputed == "" && data == '0') {
					$("#btnSave").prop("disabled", true);
					$("#btnSave").css("background-color", "#aaaaaa");
					$("#checkaa").css("background-color", "#FFCECE");
					idCheck = 0;
				} else if (data == '0') {
					$("#checkaa").css("background-color", "#B0F6AC");
					idCheck = 1;
					if (idCheck == 1 && pwdCheck == 1) {
						$("#btnSave").prop("disabled", false);
						$("#btnSave").css("background-color", "#4CAF50");

					}
				} else if (data == '1') {
					$("#btnSave").prop("disabled", true);
					$("#btnSave").css("background-color", "#aaaaaa");
					$("#checkaa").css("background-color", "#FFCECE");
					idCheck = 0;
				}
			}
		});
	}

	//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
	function checkPwd() {
		var inputed = $('.pass').val();
		var reinputed = $('#repwd').val();
		if (reinputed == "" && (inputed != reinputed || inputed == reinputed)) {
			$("#btnSave").prop("disabled", true);
			$("#btnSave").css("background-color", "#aaaaaa");
			$("#repwd").css("background-color", "#FFCECE");
		} else if (inputed == reinputed) {
			$("#repwd").css("background-color", "#B0F6AC");
			pwdCheck = 1;
			if (idCheck == 1 && pwdCheck == 1) {
				$("#btnSave").prop("disabled", false);
				$("#btnSave").css("background-color", "#4CAF50");
			}
		} else if (inputed != reinputed) {
			pwdCheck = 0;
			$("#btnSave").prop("disabled", true);
			$("#btnSave").css("background-color", "#aaaaaa");
			$("#repwd").css("background-color", "#FFCECE");
		}
	}

	//사진
	$(frm.file).hide();
	$("#image").on("click", function() {
		$(frm.file).click();
	});
	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

	//돌아가기버튼
	$("#login").on("click", function(e) {
		e.preventDefault();
		location.href = "login";
	});
</script>
</html>