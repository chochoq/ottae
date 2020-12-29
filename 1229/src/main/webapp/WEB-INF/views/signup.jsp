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
.mainlog {
    z-index: 9999;
    position: absolute;
    right: 670px;
    top: 150px;
}
* {
   margin: 0px auto;   
}

body {
   font-family: Helvetica;
   background: #eee;
   -webkit-font-smoothing: antialiased;   
}

.mainPage {
   width: 500px;
   margin: 1em auto;
   padding: 3em 2em 2em 2em;
   background: rgba(255,255,255,0.95);
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
.logoTop{
    text-align:center;
    margin: auto;
}

.btnhome{
    margin: auto;
    text-align:center;
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

.join_title{
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
}

.ps_box{
    display: block;
    position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 110px 10px 14px;
    background: #fff;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    vertical-align: top;
}

.int {
    display: block;
    position: relative;
    width: 125%;
    height: 29px;
    padding-right: 25px;
    line-height: 29px;
    border: none;
    background: #fff;
    font-size: 20px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    z-index: 10;
}

.int2 {
    position: relative;
    width: 125%;
    height: 29px;
    line-height: 29px;
    border: none;
    background: #fff;
    font-size: 20px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    z-index: 10;
    padding-right:10px; 
}

.error_next_box{
    display: block;
    margin: 9px 0 -2px;
    font-size: 12px;
    line-height: 14px;
    color: rgba(100,100,100,0.5);
}
    
.ps_box2{
    display: block;
    position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 10px 10px 14px;
    background: #fff;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    vertical-align: top;
}
.pone{
     position: relative;
    width: 12%;
    height: 29px;
    line-height: 29px;
    border: none;
    background: #fff;
    font-size: 20px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    z-index: 10;
    text-align:center;
}

.span-font{
    font-size:15px; 
}

.btnpos{
   width: 100px;
    font-family: 'Roboto', sans-serif;
    color: #000;
    background-color: #fff;
    border-radius: 5px;
    transition: all 0.3s ease 0s;
    cursor: pointer;   
}

.btnpos:hover {
   background-color: #ff5722;
   box-shadow: 0px 15px 20px rgba(119, 29, 0, 0.73);
   color: #fff;
   transform: translateY(-2px);
}
.log{
          width:171px ; 
          height:56px; 
          background:url(resources/images/3.png) no-repeat; 
          display:inline-block;
          margin-top: 25px; 
      }
      
</style>
</head>
<body>
<div><jsp:include page="loading.jsp"/></div>
<div><jsp:include page="img.jsp"/></div>
<div class="mainlog">
  <div style="text-align: center;">
      <a href="/" class="log"></a>
  </div>
   <form name="frm" action="signup" method="post" enctype="multipart/form-data">
      <div class="mainPage">                         
               <div>                                     
               <h3 class="join_title">
                  <label>아이디</label>
               </h3>            
                     <span class="ps_box">
                       <input type="text" id="checkaa" name="id"  maxlength="20" oninput="checkId()" required class="int2">
                    </span>
                    <span class="error_next_box" id="pswd1Msg" aria-live="assertive">4~20자의 영문 소문자만 사용 가능합니다.</span>
                 </div>         
               <div>
               
               <h3 class="join_title">
                  <label>비밀번호</label>
               </h3>
                     <span class="ps_box int_id">
                       <input type="password" id="pw" name="pw"  maxlength="20" oninput="checkPwd()" required class="int">
                    </span>
                    <span class="error_next_box" id="pswd1Msg" style="" aria-live="assertive">8~16자 영문 ,숫자를 사용하세요.</span>
            </div>               
            <div>
                <h3 class="join_title">
                  <label>비밀번호 재확인</label>
               </h3>
                     <span class="ps_box">
                       <input type="password" id="repwd" name="repw" class="int" maxlength="20" oninput="checkPwd()" required class="int">
                    </span>
            </div>   
            <div>
               <h3 class="join_title">
                  <label>이메일</label>
               </h3>
                     <span class="ps_box2">
                        <input type="text" name="Femail" maxlength="20" oninput="checkId()" required class="int2" style="width: 47%; text-align:right;">@
                         <select name="Lemail" class="int2" style="width: 47%;">
                             <option value="@naver.com">naver.com</option>
                             <option value="@gmail.com">gmail.com</option>
                              <option value="@hanmail.net">hanmail.net</option>
                             <option value="@nate.com">nate.com</option>
                          </select>
                    </span>                  
               <input type="hidden" name="email">
            </div>
            <div>
            <h3 class="join_title">
                  <label>성별</label>
               </h3>
                     <span class="ps_box2" style="text-align: center;">
                        <input type="radio" name="gender" value="m" checked="checked"> 남자 
                        <input type="radio" name="gender" value="f" style="margin-left:150px"> 여자
                    </span>                        
            </div>
            <div>
                <h3 class="join_title">
                  <label for="id">이름</label>
               </h3>
                     <span class="ps_box">
                       <input type="text" name="name" maxlength="20" oninput="checkId()" required class="int2">
                    </span>
            </div>
            <div>
                 <h3 class="join_title">
                  <label>생년월일</label>
               </h3>
                     <span class="ps_box">
                       <input type="date" name="birthday" value="1990-06-13" min="1900-01-01" max="2010-12-31">
                    </span>
            </div>
            <div>
                <h3 class="join_title">
                  <label>전화번호</label>
               </h3>
                     <span class="ps_box2">
                      <input type="text" class="pone" name="Fphone" minlength ="3" maxlength="3" required class="int2" oninput="checkId()" >
                      <span class="span-font">─</span>
                      <input type="text" class="pone" name="Sphone" minlength ="4" maxlength="4" required class="int2" oninput="checkId()" >
                      <span class="span-font">─</span>
                      <input type="text" class="pone" name="Lphone" minlength ="4" maxlength="4" required class="int" oninput="checkId()" >
                      <input type="hidden" name="phone">
                    </span>               
            </div>
            <div>
                <h3 class="join_title">
                  <label for="id">주소</label>
               </h3>
                <div>
                  <input type="text" id="sample6_postcode" placeholder="우편번호" size="10" style="margin-bottom:15px;"> 
                  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btnpos">
                  <br>
                  <span class="ps_box">
                        <input type="text" name="addr" oninput="checkId()" required class="int2" id="sample6_address" readonly>
                  </span>            
                  <br>
                  <span class="ps_box">
                        <input type="text" name="addrDetail" oninput="checkId()" class="int2" id="sample6_detailAddress"  placeholder="상세주소를 입력해주세요" >
                  </span>               
               </div>
            </div>
            <div>
                <h3 class="join_title">
                  <label for="id">관심키워드</label>
                  <label style="margin-left:300px;">프로필사진</label>
               </h3>
                 <div>
                     <textarea rows="3" cols="30" name="u_keyword" required class="int2" oninput="checkId()" style="height:150px; width:350px; resize: none; font-size: 20px; "></textarea>
                     <span style="float:right;">                       
                            
                   <img src="http://placehold.it/150x120" id="image" name="image" width=130 height=150> 
                  <input type="file" name="file">
                 </span>
                  </div>
            </div>
      </div>

      <!-- 로그인 버튼 -->
      <div class="btnhome">
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
      </div>
   </form>
   <!-- 공간 확보를 위한 div -->
   <div style="height: 150px;"></div>
</div>
</body>
<script>
//삭제해야할것
$(frm).submit( function(e) {
	e.preventDefault();
	
   var email = $(frm.Femail).val() + $(frm.Lemail).val();
    $(frm.email).val(email);
    var phone = $(frm.Fphone).val() + "-" + $(frm.Sphone).val() + "-"
          + $(frm.Lphone).val();
    $(frm.phone).val(phone);
    
    var pw = $(frm.pw).val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var file = $(frm.file)[0].files[0];
    
   if ($(frm.pw).val() == "") {
        alert("비밀번호를 입력해주세요");
        $(frm.pw).focus();
        return false;
    }else if(pw.length<8||pw.length>20){
       	alert("비밀번호를 8자리 ~ 20자리 이내로 입력해주세요.");
       	$(frm.pw).focus();
        return false;
    }else if(pw.search(/\s/) != -1){
       	alert("비밀번호는 공백 없이 입력해주세요.");
       	$(frm.pw).focus();
        return false;
    }else {
        if (!confirm("회원가입을 하시겟습니까")) return;
        
        frm.submit();
	}   
});



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

      var inputed = $('.int2').val();
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
      var inputed = $('.int').val();
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