<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리등록</title>

</head>
<body>
   <h1>동아리~~~~~~~~개설~~~</h1>
   <form action="makeClubPost" method="post" name="frm">
      <table border=1>
         <tr>
            <td width=150>동아리이름</td>
            <td width=500><input type="text" name="c_name" maxlength="5">5자이내</td>
         </tr>
         <tr>
            <td width=150>연락처공개여부</td>
            <td width=500>
            	예 <input type="radio" name="c_pchk" value="YInfo" checked="checked"> 
            	아니오<input type="radio" name="c_pchk" value="NInfo">
            </td>
         </tr>
         <tr>
            <td width=150>카테고리</td>
            <td width=500>
               <select name="c_category">
                     <option value="게임">게임</option>
                     <option value="운동">운동</option>
                     <option value="공부">공부</option>
                     <option value="취미">취미</option>
                     <option value="기타">기타</option>
               </select>
            </td>
         </tr>

         <tr>
            <td width=150>태그</td>
            <td width=500><textarea rows="3" cols="50" name="c_tag" id="c_tag">#태그
#여기</textarea></td>
         </tr>
         <tr>
            <td width=150>인삿말</td>
            <td width=500><input type="text" name="c_welcome"
               placeholder="환영의인사를해주세요"></td>
         </tr>
         <tr>
            <td width=150>가입조건</td>
            <td width=500><textarea rows="10" cols="50" name="c_condition"></textarea></td>
         </tr>
         <tr>
            <td width=150>대표사진</td>
            <td width=500><img src="http://placehold.it/150x120" id="image"
               width=150> <input type="file" name="c_pic"></td>
         </tr>
         <tr>
            <td width=150>활동장소</td>
            <td width=500><input type="text" name="c_spot"
               placeholder="어디서활동하세요?"></td>
         </tr>
      </table>
      <input type="submit" value="저장"> <input type="reset"
         value="취소">
   </form>
   	<button onClick="location.href='/'">돌아가기</button>

</body>

<script>
   var start = true;
   $(frm.c_tag).on("click", function() {
      if (start) {
         $("#c_tag").val("");
      }
      start = false;
   });

   //사진
   $(frm.c_pic).hide();

   $("#image").on("click", function() {
      $(frm.c_pic).click();
   });

   $(frm.c_pic).on("change", function() {
      var c_pic = $(frm.c_pic)[0].files[0];
      $("#image").attr("src", URL.createObjectURL(c_pic));
   });
   
   

   //서밋시
   $(frm).submit(
         function(e) {
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
               alert("동아리이름");
               $(frm.c_name).focus();
            } else if ($(frm.c_tag).val() == "") {
               alert("해쉬태그설정해주세요");
               $(frm.c_tag).focus();
            } else {
               if (!confirm("글등록?"))
                  return;
               alert(c_name + "\n" + c_tag + "\n" + c_pchk + "\n"
                     + c_category + "\n" + c_welcome + "\n"
                     + c_condition + "\n" + c_pic + "\n" + c_spot);
               frm.submit();
            }
         });
   
</script>

</html>


