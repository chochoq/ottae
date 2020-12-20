<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/css/make.css"/>
<title>회원정보 수정</title>
</head>
<body>
   <div><jsp:include page="menu.jsp" /></div>
   <h1 class="clupMake-hedder">회원정보 수정</h1>
   <div class="SectionCreateCafe CreateCafe">
      <form action="myinfoUpdate" method="post" enctype="multipart/form-data" name="frm">
         <table class="cafe_input">
            <colgroup>
               <col width="114">
               <col width="250">
            </colgroup>
            <tbody>
                  <tr class="cafe_keyword">
                        <th scope="row">
                            <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">아이디</h2>
                        </th>
                        <td>
                           <div class="SectionCreateCafeKeyword">                     
                             <div class="cafe_keyword_input_area">
                                <div class="FormInputText">
                                   <input type="text"class="input_text input_txt2" value="${id}" readonly="readonly">                                                   
                                </div>   
                              </div>
                           </div>               
                        </td>
                  </tr>
                  <tr class="cafe_keyword">
                        <th scope="row">
                            <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">비밀번호</h2>
                        </th>
                        <td>
                           <div class="SectionCreateCafeKeyword">                     
                              <div class="cafe_keyword_input_area">
                                 <div class="FormInputText">
                                       <input type="text" name="pw"  maxlength="20" minlength="4" class="input_text input_txt2" id="pw" oninput="checkPwd()" value="${vo.pw}">
                                 </div>
                                 <p class="txt">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</p>                                                                           
                              </div>
                           </div>            
                        </td>
                  </tr>
                  <tr class="cafe_keyword">
                        <th scope="row">
                            <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">비밀번호 확인</h2>
                        </th>
                        <td>
                           <div class="SectionCreateCafeKeyword">                     
                              <div class="cafe_keyword_input_area">
                                 <div class="FormInputText">
                                       <input type="password" class="input_text input_txt2" id="repwd" oninput="checkPwd()">
                                 </div>
                              </div>
                           </div>            
                        </td>
                  </tr>
                  <tr class="cafe_keyword">
                        <th scope="row">
                            <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">이름</h2>
                        </th>
                        <td>
                           <div class="SectionCreateCafeKeyword">                     
                              <div class="cafe_keyword_input_area">
                                 <div class="FormInputText">
                                       <input type="text" name="name" class="input_text input_txt2" value="${name}이름받아와야해">
                                 </div>                                                                        
                              </div>
                           </div>               
                      </td>
                  </tr>
                  <tr class="cafe_keyword">
                        <th scope="row">
                            <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">전화번호</h2>
                        </th>
                        <td>
                           <div class="SectionCreateCafeKeyword">                     
                              <div class="cafe_keyword_input_area">
                                 <div class="FormInputText">             
                                 <input type="text" name="Fphone" class="input_text input_txt12" oninput="makePhone()">-
                                 <input type="text" name="Sphone" class="input_text input_txt12" oninput="makePhone()">-
                                 <input type="text" name="Lphone" class="input_text input_txt12" oninput="makePhone()">
                                 <input type="hidden" name="phone">
                                 </div>                                                                        
                              </div>
                           </div>               
                      </td>
                    </tr>
                  <tr class="cafe_keyword">
                        <th scope="row">
                            <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">주소</h2>
                        </th>
                        <td>
                           <div class="SectionCreateCafeKeyword">                     
                              <div class="cafe_keyword_input_area">
                                 <div class="FormInputText">
                                       <input type="text" id="sample6_postcode" placeholder="우편번호" size="5"> 
                              <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="selectPost">
                              <br>
                              <input type="text" id="sample6_address" placeholder="주소" name="addr" required class="id" oninput="checkId()" >
                                 </div>                                                                                                   
                              </div>
                           </div>               
                      </td>
                   </tr>
                  <tr class="cafe_keyword">
                        <th scope="row">
                            <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">상세주소</h2>
                        </th>
                        <td>   
                           <div class="SectionCreateCafeKeyword">                     
                              <div class="cafe_keyword_input_area">
                                 <div class="FormInputText">
                                       <input type="text" name="addrDetail" class="input_text input_txt2" id="sample6_detailAddress">
                                 </div>
                                 <p class="txt">상세주소를 입력해주세요.</p>                                                                        
                               </div>
                           </div>               
                       </td>
                   </tr>
                  <tr class="cafe_keyword">
                        <th scope="row">
                            <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">이메일</h2>
                        </th>
                        <td>
                           <div class="SectionCreateCafeKeyword">                     
                              <div class="cafe_keyword_input_area">
                                 <div class="FormInputText">
                                 <input type="text" name="Femail" size="5" class="input_text input_txt2" oninput="makeEmail()"> @ 
                              <select style="font-size: 18px; height: 30px; width: 205px;" name="Lemail">
                                 <option value="@naver.com">naver.com</option>
                                 <option value="@gmail.com">gmail.com</option>
                                 <option value="@hanmail.net">hanmail.net</option>
                                 <option value="@nate.com">nate.com</option>
                              </select> 
                              <input type="hidden" name="email">
                                 </div>                                                                        
                              </div>
                           </div>               
                      </td>
                  </tr>
                  <tr class="cafe_keyword">
                        <th scope="row">
                            <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">키워드</h2>
                        </th>
                        <td>
                           <div class="SectionCreateCafeKeyword">                     
                              <div class="cafe_keyword_input_area">
                                 <div class="FormInputText">
                                       <input type="text"class="input_text input_txt2" name="u_keyword">
                                 </div>                                                                        
                              </div>
                           </div>               
                        </td>
                  </tr>
                  <tr>
                        <th scope="row">
                            <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">메인사진</h2>
                      </th>
                      <td width=500>
                            <img src="http://placehold.it/150x120" id="image" width=150> 
                            <input type="file" name="file" class="imgSel">
                      </td>
                  </tr>                            
            </tbody>
         </table>
         <div class="buttonUser">
            <input type="button" value="취소" class="btnCancel" id="return">
            <input type="button" value="회원탈퇴" class="btnDel" onclick="location.href='removeUser'">
             <input type="submit" value="수정" class="btnSave" id="btnSave">
          </div>
      </form>
   </div>
   <div>
      <jsp:include page="footer.jsp" />
   </div>                               
</body>
<script>
   // 뒤로가기
   $(document).ready(function() {
      $("#return").click(function(){            
         window.history.back()       
      });       
   });
   //사진
   $(frm.file).hide();
   $("#image").on("click", function() {
         $(frm.file).click();
   });
   $(frm.file).on("change", function() {
      var file = $(frm.file)[0].files[0];
         $("#image").attr("src", URL.createObjectURL(file));
   });
   
      //서밋시
      $(frm).submit( function(e) {
         e.preventDefault();
        var c_name = $(frm.c_name).val();
        var c_tag = $(frm.c_tag).val();
        var c_pchk = $(frm.c_pchk).val();
        var c_category = $(frm.c_category).val();
        var c_welcome = $(frm.c_welcome).val();
        var c_condition = $(frm.c_condition).val();
        var c_pic = $(frm.c_pic).val();
        var c_spot = $(frm.c_spot).val();

        if ($(frm.c_name).val() == "") {
           alert("동아리이름을 입력하세요");
            $(frm.c_name).focus();
        } else if ($(frm.c_tag).val() == "") {
            alert("해쉬태그설정해주세요");
            $(frm.c_tag).focus();
        } else {
            if (!confirm("동아리를 등록하시겠습니까??")) return;
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
      
   //재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
   function checkPwd() {
      var inputed = $('#pw').val();
      var reinputed = $('#repwd').val();
      // 동일한 비밀번호를 입력했을떄
      if (inputed == reinputed) {
         $("#btnSave").prop("disabled", false);
         $("#btnSave").css("background-color", "#fff");
         $("#repwd").css("background-color", "#B0F6AC");
      // 다른 비밀번호를 입력했을떄   
      } else if (inputed != reinputed) {
         $("#repwd").css("background-color", "#FFCECE");
         $("#btnSave").prop("disabled", true);
         $("#btnSave").css("background-color", "#aaaaaa");
      }
   }
   
   function makePhone(){
      var phone = $(frm.Fphone).val() + "-" + $(frm.Sphone).val() + "-" + $(frm.Lphone).val();
      $(frm.phone).val(콜);
   }
   
   function makeEmail(){
      var email = $(frm.Femail).val() + $(frm.Lemail).val();
      $(frm.email).val(email);
   }

</script>
</html>