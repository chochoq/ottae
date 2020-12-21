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



.mainPage {
   width: 500px;
   margin: 1em auto;
   padding: 3em 2em 2em 2em;
   background: rgba(255,255,255,0.7);
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
      
canvas {
    padding:0;
    margin:0;
}
div.btnbg {
    position:absolute;
    left: 37%;
    top:0;
}   
</style>
</head>
<body style="margin: 0">
<canvas id="sakura"></canvas>
<div class="btnbg">
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
                      <input type="text" class="pone" name="Fphone" maxlength="3" required class="int2" oninput="checkId()" >
                      <span class="span-font">─</span>
                      <input type="text" class="pone" name="Sphone" maxlength="4" required class="int2" oninput="checkId()" >
                      <span class="span-font">─</span>
                      <input type="text" class="pone" name="Lphone" maxlength="4" required class="int" oninput="checkId()" >
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
                     <textarea rows="3" cols="30" name="u_keyword" required class="int2" oninput="checkId()" style="height:150px; width:350px; resize: none; font-size: 20px; ">
                     </textarea>
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
<script id="sakura_point_vsh" type="x-shader/x_vertex">
uniform mat4 uProjection;
uniform mat4 uModelview;
uniform vec3 uResolution;
uniform vec3 uOffset;
uniform vec3 uDOF;  //x:focus distance, y:focus radius, z:max radius
uniform vec3 uFade; //x:start distance, y:half distance, z:near fade start

attribute vec3 aPosition;
attribute vec3 aEuler;
attribute vec2 aMisc; //x:size, y:fade

varying vec3 pposition;
varying float psize;
varying float palpha;
varying float pdist;

//varying mat3 rotMat;
varying vec3 normX;
varying vec3 normY;
varying vec3 normZ;
varying vec3 normal;

varying float diffuse;
varying float specular;
varying float rstop;
varying float distancefade;

void main(void) {
    // Projection is based on vertical angle
    vec4 pos = uModelview * vec4(aPosition + uOffset, 1.0);
    gl_Position = uProjection * pos;
    gl_PointSize = aMisc.x * uProjection[1][1] / -pos.z * uResolution.y * 0.5;
    
    pposition = pos.xyz;
    psize = aMisc.x;
    pdist = length(pos.xyz);
    palpha = smoothstep(0.0, 1.0, (pdist - 0.1) / uFade.z);
    
    vec3 elrsn = sin(aEuler);
    vec3 elrcs = cos(aEuler);
    mat3 rotx = mat3(
        1.0, 0.0, 0.0,
        0.0, elrcs.x, elrsn.x,
        0.0, -elrsn.x, elrcs.x
    );
    mat3 roty = mat3(
        elrcs.y, 0.0, -elrsn.y,
        0.0, 1.0, 0.0,
        elrsn.y, 0.0, elrcs.y
    );
    mat3 rotz = mat3(
        elrcs.z, elrsn.z, 0.0, 
        -elrsn.z, elrcs.z, 0.0,
        0.0, 0.0, 1.0
    );
    mat3 rotmat = rotx * roty * rotz;
    normal = rotmat[2];
    
    mat3 trrotm = mat3(
        rotmat[0][0], rotmat[1][0], rotmat[2][0],
        rotmat[0][1], rotmat[1][1], rotmat[2][1],
        rotmat[0][2], rotmat[1][2], rotmat[2][2]
    );
    normX = trrotm[0];
    normY = trrotm[1];
    normZ = trrotm[2];
    
    const vec3 lit = vec3(0.6917144638660746, 0.6917144638660746, -0.20751433915982237);
    
    float tmpdfs = dot(lit, normal);
    if(tmpdfs < 0.0) {
        normal = -normal;
        tmpdfs = dot(lit, normal);
    }
    diffuse = 0.4 + tmpdfs;
    
    vec3 eyev = normalize(-pos.xyz);
    if(dot(eyev, normal) > 0.0) {
        vec3 hv = normalize(eyev + lit);
        specular = pow(max(dot(hv, normal), 0.0), 20.0);
    }
    else {
        specular = 0.0;
    }
    
    rstop = clamp((abs(pdist - uDOF.x) - uDOF.y) / uDOF.z, 0.0, 1.0);
    rstop = pow(rstop, 0.5);
    //-0.69315 = ln(0.5)
    distancefade = min(1.0, exp((uFade.x - pdist) * 0.69315 / uFade.y));
}
</script>
<script id="sakura_point_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif

uniform vec3 uDOF;  //x:focus distance, y:focus radius, z:max radius
uniform vec3 uFade; //x:start distance, y:half distance, z:near fade start

const vec3 fadeCol = vec3(0.08, 0.03, 0.06);

varying vec3 pposition;
varying float psize;
varying float palpha;
varying float pdist;

//varying mat3 rotMat;
varying vec3 normX;
varying vec3 normY;
varying vec3 normZ;
varying vec3 normal;

varying float diffuse;
varying float specular;
varying float rstop;
varying float distancefade;

float ellipse(vec2 p, vec2 o, vec2 r) {
    vec2 lp = (p - o) / r;
    return length(lp) - 1.0;
}

void main(void) {
    vec3 p = vec3(gl_PointCoord - vec2(0.5, 0.5), 0.0) * 2.0;
    vec3 d = vec3(0.0, 0.0, -1.0);
    float nd = normZ.z; //dot(-normZ, d);
    if(abs(nd) < 0.0001) discard;
    
    float np = dot(normZ, p);
    vec3 tp = p + d * np / nd;
    vec2 coord = vec2(dot(normX, tp), dot(normY, tp));
    
    //angle = 15 degree
    const float flwrsn = 0.258819045102521;
    const float flwrcs = 0.965925826289068;
    mat2 flwrm = mat2(flwrcs, -flwrsn, flwrsn, flwrcs);
    vec2 flwrp = vec2(abs(coord.x), coord.y) * flwrm;
    
    float r;
    if(flwrp.x < 0.0) {
        r = ellipse(flwrp, vec2(0.065, 0.024) * 0.5, vec2(0.36, 0.96) * 0.5);
    }
    else {
        r = ellipse(flwrp, vec2(0.065, 0.024) * 0.5, vec2(0.58, 0.96) * 0.5);
    }
    
    if(r > rstop) discard;
    
    vec3 col = mix(vec3(1.0, 0.8, 0.75), vec3(1.0, 0.9, 0.87), r);
    float grady = mix(0.0, 1.0, pow(coord.y * 0.5 + 0.5, 0.35));
    col *= vec3(1.0, grady, grady);
    col *= mix(0.8, 1.0, pow(abs(coord.x), 0.3));
    col = col * diffuse + specular;
    
    col = mix(fadeCol, col, distancefade);
    
    float alpha = (rstop > 0.001)? (0.5 - r / (rstop * 2.0)) : 1.0;
    alpha = smoothstep(0.0, 1.0, alpha) * palpha;
    
    gl_FragColor = vec4(col * 0.5, alpha);
}
</script>
<!-- effects -->
<script id="fx_common_vsh" type="x-shader/x_vertex">
uniform vec3 uResolution;
attribute vec2 aPosition;

varying vec2 texCoord;
varying vec2 screenCoord;

void main(void) {
    gl_Position = vec4(aPosition, 0.0, 1.0);
    texCoord = aPosition.xy * 0.5 + vec2(0.5, 0.5);
    screenCoord = aPosition.xy * vec2(uResolution.z, 1.0);
}
</script>
<script id="bg_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif

uniform vec2 uTimes;

varying vec2 texCoord;
varying vec2 screenCoord;

void main(void) {
    vec3 col;
    float c;
    vec2 tmpv = texCoord * vec2(0.8, 1.0) - vec2(0.95, 1.0);
    c = exp(-pow(length(tmpv) * 1.8, 2.0));
    col = mix(vec3(0.02, 0.0, 0.03), vec3(0.96, 0.98, 1.0) * 1.5, c);
    gl_FragColor = vec4(col * 0.5, 1.0);
}
</script>
<script id="fx_brightbuf_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif
uniform sampler2D uSrc;
uniform vec2 uDelta;

varying vec2 texCoord;
varying vec2 screenCoord;

void main(void) {
    vec4 col = texture2D(uSrc, texCoord);
    gl_FragColor = vec4(col.rgb * 2.0 - vec3(0.5), 1.0);
}
</script>
<script id="fx_dirblur_r4_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif
uniform sampler2D uSrc;
uniform vec2 uDelta;
uniform vec4 uBlurDir; //dir(x, y), stride(z, w)

varying vec2 texCoord;
varying vec2 screenCoord;

void main(void) {
    vec4 col = texture2D(uSrc, texCoord);
    col = col + texture2D(uSrc, texCoord + uBlurDir.xy * uDelta);
    col = col + texture2D(uSrc, texCoord - uBlurDir.xy * uDelta);
    col = col + texture2D(uSrc, texCoord + (uBlurDir.xy + uBlurDir.zw) * uDelta);
    col = col + texture2D(uSrc, texCoord - (uBlurDir.xy + uBlurDir.zw) * uDelta);
    gl_FragColor = col / 5.0;
}
</script>
<!-- effect fragment shader template -->
<script id="fx_common_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif
uniform sampler2D uSrc;
uniform vec2 uDelta;

varying vec2 texCoord;
varying vec2 screenCoord;

void main(void) {
    gl_FragColor = texture2D(uSrc, texCoord);
}
</script>
<!-- post processing -->
<script id="pp_final_vsh" type="x-shader/x_vertex">
uniform vec3 uResolution;
attribute vec2 aPosition;
varying vec2 texCoord;
varying vec2 screenCoord;
void main(void) {
    gl_Position = vec4(aPosition, 0.0, 1.0);
    texCoord = aPosition.xy * 0.5 + vec2(0.5, 0.5);
    screenCoord = aPosition.xy * vec2(uResolution.z, 1.0);
}
</script>
<script id="pp_final_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif
uniform sampler2D uSrc;
uniform sampler2D uBloom;
uniform vec2 uDelta;
varying vec2 texCoord;
varying vec2 screenCoord;
void main(void) {
    vec4 srccol = texture2D(uSrc, texCoord) * 2.0;
    vec4 bloomcol = texture2D(uBloom, texCoord);
    vec4 col;
    col = srccol + bloomcol * (vec4(1.0) + srccol);
    col *= smoothstep(1.0, 0.0, pow(length((texCoord - vec2(0.5)) * 2.0), 1.2) * 0.5);
    col = pow(col, vec4(0.45454545454545)); //(1.0 / 2.2)
    
    gl_FragColor = vec4(col.rgb, 1.0);
    gl_FragColor.a = 1.0;
}
</script>
</body>
<script>
//삭제해야할것
$(frm).submit( function(e) {
   var id = $(frm.id).val();
   var pw = $(frm.pw).val();
   var mail = $(frm.Femail).val();
   var gender = $(frm.gender).val();
   var name = $(frm.name).val();
   var birthday = $(frm.birthday).val();
   var tel = $(frm.Fphone).val();
   var addr = $(frm.addr).val();
   var addrDetail = $(frm.addrDetail).val();
   var keyword = $(frm.u_keyword).val();
   var email = $(frm.Femail).val() + $(frm.Lemail).val();
    $(frm.email).val(email);
    var phone = $(frm.Fphone).val() + "-" + $(frm.Sphone).val() + "-"
          + $(frm.Lphone).val();
   alert(id+"\n"+pw+"\n"+email+"\n"+gender
         +"\n"+name+"\n"+birthday+"\n"+phone+"\n"+addr+"\n"+addrDetail+"\n"+keyword);
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
      //email phone
      var email = $(frm.Femail).val() + $(frm.Lemail).val();
      $(frm.email).val(email);
      var phone = $(frm.Fphone).val() + "-" + $(frm.Sphone).val() + "-"
            + $(frm.Lphone).val();
      $(frm.phone).val(phone);

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
   
// Utilities
   var Vector3 = {};
   var Matrix44 = {};
   Vector3.create = function(x, y, z) {
       return {'x':x, 'y':y, 'z':z};
   };
   Vector3.dot = function (v0, v1) {
       return v0.x * v1.x + v0.y * v1.y + v0.z * v1.z;
   };
   Vector3.cross = function (v, v0, v1) {
       v.x = v0.y * v1.z - v0.z * v1.y;
       v.y = v0.z * v1.x - v0.x * v1.z;
       v.z = v0.x * v1.y - v0.y * v1.x;
   };
   Vector3.normalize = function (v) {
       var l = v.x * v.x + v.y * v.y + v.z * v.z;
       if(l > 0.00001) {
           l = 1.0 / Math.sqrt(l);
           v.x *= l;
           v.y *= l;
           v.z *= l;
       }
   };
   Vector3.arrayForm = function(v) {
       if(v.array) {
           v.array[0] = v.x;
           v.array[1] = v.y;
           v.array[2] = v.z;
       }
       else {
           v.array = new Float32Array([v.x, v.y, v.z]);
       }
       return v.array;
   };
   Matrix44.createIdentity = function () {
       return new Float32Array([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0]);
   };
   Matrix44.loadProjection = function (m, aspect, vdeg, near, far) {
       var h = near * Math.tan(vdeg * Math.PI / 180.0 * 0.5) * 2.0;
       var w = h * aspect;
       
       m[0] = 2.0 * near / w;
       m[1] = 0.0;
       m[2] = 0.0;
       m[3] = 0.0;
       
       m[4] = 0.0;
       m[5] = 2.0 * near / h;
       m[6] = 0.0;
       m[7] = 0.0;
       
       m[8] = 0.0;
       m[9] = 0.0;
       m[10] = -(far + near) / (far - near);
       m[11] = -1.0;
       
       m[12] = 0.0;
       m[13] = 0.0;
       m[14] = -2.0 * far * near / (far - near);
       m[15] = 0.0;
   };
   Matrix44.loadLookAt = function (m, vpos, vlook, vup) {
       var frontv = Vector3.create(vpos.x - vlook.x, vpos.y - vlook.y, vpos.z - vlook.z);
       Vector3.normalize(frontv);
       var sidev = Vector3.create(1.0, 0.0, 0.0);
       Vector3.cross(sidev, vup, frontv);
       Vector3.normalize(sidev);
       var topv = Vector3.create(1.0, 0.0, 0.0);
       Vector3.cross(topv, frontv, sidev);
       Vector3.normalize(topv);
       
       m[0] = sidev.x;
       m[1] = topv.x;
       m[2] = frontv.x;
       m[3] = 0.0;
       
       m[4] = sidev.y;
       m[5] = topv.y;
       m[6] = frontv.y;
       m[7] = 0.0;
       
       m[8] = sidev.z;
       m[9] = topv.z;
       m[10] = frontv.z;
       m[11] = 0.0;
       
       m[12] = -(vpos.x * m[0] + vpos.y * m[4] + vpos.z * m[8]);
       m[13] = -(vpos.x * m[1] + vpos.y * m[5] + vpos.z * m[9]);
       m[14] = -(vpos.x * m[2] + vpos.y * m[6] + vpos.z * m[10]);
       m[15] = 1.0;
   };

   //
   var timeInfo = {
       'start':0, 'prev':0, // Date
       'delta':0, 'elapsed':0 // Number(sec)
   };

   //
   var gl;
   var renderSpec = {
       'width':0,
       'height':0,
       'aspect':1,
       'array':new Float32Array(3),
       'halfWidth':0,
       'halfHeight':0,
       'halfArray':new Float32Array(3)
       // and some render targets. see setViewport()
   };
   renderSpec.setSize = function(w, h) {
       renderSpec.width = w;
       renderSpec.height = h;
       renderSpec.aspect = renderSpec.width / renderSpec.height;
       renderSpec.array[0] = renderSpec.width;
       renderSpec.array[1] = renderSpec.height;
       renderSpec.array[2] = renderSpec.aspect;
       
       renderSpec.halfWidth = Math.floor(w / 2);
       renderSpec.halfHeight = Math.floor(h / 2);
       renderSpec.halfArray[0] = renderSpec.halfWidth;
       renderSpec.halfArray[1] = renderSpec.halfHeight;
       renderSpec.halfArray[2] = renderSpec.halfWidth / renderSpec.halfHeight;
   };

   function deleteRenderTarget(rt) {
       gl.deleteFramebuffer(rt.frameBuffer);
       gl.deleteRenderbuffer(rt.renderBuffer);
       gl.deleteTexture(rt.texture);
   }

   function createRenderTarget(w, h) {
       var ret = {
           'width':w,
           'height':h,
           'sizeArray':new Float32Array([w, h, w / h]),
           'dtxArray':new Float32Array([1.0 / w, 1.0 / h])
       };
       ret.frameBuffer = gl.createFramebuffer();
       ret.renderBuffer = gl.createRenderbuffer();
       ret.texture = gl.createTexture();
       
       gl.bindTexture(gl.TEXTURE_2D, ret.texture);
       gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, w, h, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
       gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
       gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
       gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
       gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
       
       gl.bindFramebuffer(gl.FRAMEBUFFER, ret.frameBuffer);
       gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, ret.texture, 0);
       
       gl.bindRenderbuffer(gl.RENDERBUFFER, ret.renderBuffer);
       gl.renderbufferStorage(gl.RENDERBUFFER, gl.DEPTH_COMPONENT16, w, h);
       gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.DEPTH_ATTACHMENT, gl.RENDERBUFFER, ret.renderBuffer);
       
       gl.bindTexture(gl.TEXTURE_2D, null);
       gl.bindRenderbuffer(gl.RENDERBUFFER, null);
       gl.bindFramebuffer(gl.FRAMEBUFFER, null);
       
       return ret;
   }

   function compileShader(shtype, shsrc) {
      var retsh = gl.createShader(shtype);
      
      gl.shaderSource(retsh, shsrc);
      gl.compileShader(retsh);
      
      if(!gl.getShaderParameter(retsh, gl.COMPILE_STATUS)) {
         var errlog = gl.getShaderInfoLog(retsh);
         gl.deleteShader(retsh);
         console.error(errlog);
         return null;
      }
      return retsh;
   }

   function createShader(vtxsrc, frgsrc, uniformlist, attrlist) {
       var vsh = compileShader(gl.VERTEX_SHADER, vtxsrc);
       var fsh = compileShader(gl.FRAGMENT_SHADER, frgsrc);
       
       if(vsh == null || fsh == null) {
           return null;
       }
       
       var prog = gl.createProgram();
       gl.attachShader(prog, vsh);
       gl.attachShader(prog, fsh);
       
       gl.deleteShader(vsh);
       gl.deleteShader(fsh);
       
       gl.linkProgram(prog);
       if (!gl.getProgramParameter(prog, gl.LINK_STATUS)) {
           var errlog = gl.getProgramInfoLog(prog);
           console.error(errlog);
           return null;
       }
       
       if(uniformlist) {
           prog.uniforms = {};
           for(var i = 0; i < uniformlist.length; i++) {
               prog.uniforms[uniformlist[i]] = gl.getUniformLocation(prog, uniformlist[i]);
           }
       }
       
       if(attrlist) {
           prog.attributes = {};
           for(var i = 0; i < attrlist.length; i++) {
               var attr = attrlist[i];
               prog.attributes[attr] = gl.getAttribLocation(prog, attr);
           }
       }
       
       return prog;
   }

   function useShader(prog) {
       gl.useProgram(prog);
       for(var attr in prog.attributes) {
           gl.enableVertexAttribArray(prog.attributes[attr]);;
       }
   }

   function unuseShader(prog) {
       for(var attr in prog.attributes) {
           gl.disableVertexAttribArray(prog.attributes[attr]);;
       }
       gl.useProgram(null);
   }

   /////
   var projection = {
       'angle':60,
       'nearfar':new Float32Array([0.1, 100.0]),
       'matrix':Matrix44.createIdentity()
   };
   var camera = {
       'position':Vector3.create(0, 0, 100),
       'lookat':Vector3.create(0, 0, 0),
       'up':Vector3.create(0, 1, 0),
       'dof':Vector3.create(10.0, 4.0, 8.0),
       'matrix':Matrix44.createIdentity()
   };

   var pointFlower = {};
   var meshFlower = {};
   var sceneStandBy = false;

   var BlossomParticle = function () {
       this.velocity = new Array(3);
       this.rotation = new Array(3);
       this.position = new Array(3);
       this.euler = new Array(3);
       this.size = 1.0;
       this.alpha = 1.0;
       this.zkey = 0.0;
   };

   BlossomParticle.prototype.setVelocity = function (vx, vy, vz) {
       this.velocity[0] = vx;
       this.velocity[1] = vy;
       this.velocity[2] = vz;
   };

   BlossomParticle.prototype.setRotation = function (rx, ry, rz) {
       this.rotation[0] = rx;
       this.rotation[1] = ry;
       this.rotation[2] = rz;
   };

   BlossomParticle.prototype.setPosition = function (nx, ny, nz) {
       this.position[0] = nx;
       this.position[1] = ny;
       this.position[2] = nz;
   };

   BlossomParticle.prototype.setEulerAngles = function (rx, ry, rz) {
       this.euler[0] = rx;
       this.euler[1] = ry;
       this.euler[2] = rz;
   };

   BlossomParticle.prototype.setSize = function (s) {
       this.size = s;
   };

   BlossomParticle.prototype.update = function (dt, et) {
       this.position[0] += this.velocity[0] * dt;
       this.position[1] += this.velocity[1] * dt;
       this.position[2] += this.velocity[2] * dt;
       
       this.euler[0] += this.rotation[0] * dt;
       this.euler[1] += this.rotation[1] * dt;
       this.euler[2] += this.rotation[2] * dt;
   };

   function createPointFlowers() {
       // get point sizes
       var prm = gl.getParameter(gl.ALIASED_POINT_SIZE_RANGE);
       renderSpec.pointSize = {'min':prm[0], 'max':prm[1]};
       
       var vtxsrc = document.getElementById("sakura_point_vsh").textContent;
       var frgsrc = document.getElementById("sakura_point_fsh").textContent;
       
       pointFlower.program = createShader(
           vtxsrc, frgsrc,
           ['uProjection', 'uModelview', 'uResolution', 'uOffset', 'uDOF', 'uFade'],
           ['aPosition', 'aEuler', 'aMisc']
       );
       
       useShader(pointFlower.program);
       pointFlower.offset = new Float32Array([0.0, 0.0, 0.0]);
       pointFlower.fader = Vector3.create(0.0, 10.0, 0.0);
       
       // paramerters: velocity[3], rotate[3]
       pointFlower.numFlowers = 1600;
       pointFlower.particles = new Array(pointFlower.numFlowers);
       // vertex attributes {position[3], euler_xyz[3], size[1]}
       pointFlower.dataArray = new Float32Array(pointFlower.numFlowers * (3 + 3 + 2));
       pointFlower.positionArrayOffset = 0;
       pointFlower.eulerArrayOffset = pointFlower.numFlowers * 3;
       pointFlower.miscArrayOffset = pointFlower.numFlowers * 6;
       
       pointFlower.buffer = gl.createBuffer();
       gl.bindBuffer(gl.ARRAY_BUFFER, pointFlower.buffer);
       gl.bufferData(gl.ARRAY_BUFFER, pointFlower.dataArray, gl.DYNAMIC_DRAW);
       gl.bindBuffer(gl.ARRAY_BUFFER, null);
       
       unuseShader(pointFlower.program);
       
       for(var i = 0; i < pointFlower.numFlowers; i++) {
           pointFlower.particles[i] = new BlossomParticle();
       }
   }

   function initPointFlowers() {
       //area
       pointFlower.area = Vector3.create(20.0, 20.0, 20.0);
       pointFlower.area.x = pointFlower.area.y * renderSpec.aspect;
       
       pointFlower.fader.x = 10.0; //env fade start
       pointFlower.fader.y = pointFlower.area.z; //env fade half
       pointFlower.fader.z = 0.1;  //near fade start
       
       //particles
       var PI2 = Math.PI * 2.0;
       var tmpv3 = Vector3.create(0, 0, 0);
       var tmpv = 0;
       var symmetryrand = function() {return (Math.random() * 2.0 - 1.0);};
       for(var i = 0; i < pointFlower.numFlowers; i++) {
           var tmpprtcl = pointFlower.particles[i];
           
           //velocity
           tmpv3.x = symmetryrand() * 0.3 + 0.8;
           tmpv3.y = symmetryrand() * 0.2 - 1.0;
           tmpv3.z = symmetryrand() * 0.3 + 0.5;
           Vector3.normalize(tmpv3);
           tmpv = 2.0 + Math.random() * 1.0;
           tmpprtcl.setVelocity(tmpv3.x * tmpv, tmpv3.y * tmpv, tmpv3.z * tmpv);
           
           //rotation
           tmpprtcl.setRotation(
               symmetryrand() * PI2 * 0.5,
               symmetryrand() * PI2 * 0.5,
               symmetryrand() * PI2 * 0.5
           );
           
           //position
           tmpprtcl.setPosition(
               symmetryrand() * pointFlower.area.x,
               symmetryrand() * pointFlower.area.y,
               symmetryrand() * pointFlower.area.z
           );
           
           //euler
           tmpprtcl.setEulerAngles(
               Math.random() * Math.PI * 2.0,
               Math.random() * Math.PI * 2.0,
               Math.random() * Math.PI * 2.0
           );
           
           //size
           tmpprtcl.setSize(0.9 + Math.random() * 0.1);
       }
   }

   function renderPointFlowers() {
       //update
       var PI2 = Math.PI * 2.0;
       var limit = [pointFlower.area.x, pointFlower.area.y, pointFlower.area.z];
       var repeatPos = function (prt, cmp, limit) {
           if(Math.abs(prt.position[cmp]) - prt.size * 0.5 > limit) {
               //out of area
               if(prt.position[cmp] > 0) {
                   prt.position[cmp] -= limit * 2.0;
               }
               else {
                   prt.position[cmp] += limit * 2.0;
               }
           }
       };
       var repeatEuler = function (prt, cmp) {
           prt.euler[cmp] = prt.euler[cmp] % PI2;
           if(prt.euler[cmp] < 0.0) {
               prt.euler[cmp] += PI2;
           }
       };
       
       for(var i = 0; i < pointFlower.numFlowers; i++) {
           var prtcl = pointFlower.particles[i];
           prtcl.update(timeInfo.delta, timeInfo.elapsed);
           repeatPos(prtcl, 0, pointFlower.area.x);
           repeatPos(prtcl, 1, pointFlower.area.y);
           repeatPos(prtcl, 2, pointFlower.area.z);
           repeatEuler(prtcl, 0);
           repeatEuler(prtcl, 1);
           repeatEuler(prtcl, 2);
           
           prtcl.alpha = 1.0;//(pointFlower.area.z - prtcl.position[2]) * 0.5;
           
           prtcl.zkey = (camera.matrix[2] * prtcl.position[0]
                       + camera.matrix[6] * prtcl.position[1]
                       + camera.matrix[10] * prtcl.position[2]
                       + camera.matrix[14]);
       }
       
       // sort
       pointFlower.particles.sort(function(p0, p1){return p0.zkey - p1.zkey;});
       
       // update data
       var ipos = pointFlower.positionArrayOffset;
       var ieuler = pointFlower.eulerArrayOffset;
       var imisc = pointFlower.miscArrayOffset;
       for(var i = 0; i < pointFlower.numFlowers; i++) {
           var prtcl = pointFlower.particles[i];
           pointFlower.dataArray[ipos] = prtcl.position[0];
           pointFlower.dataArray[ipos + 1] = prtcl.position[1];
           pointFlower.dataArray[ipos + 2] = prtcl.position[2];
           ipos += 3;
           pointFlower.dataArray[ieuler] = prtcl.euler[0];
           pointFlower.dataArray[ieuler + 1] = prtcl.euler[1];
           pointFlower.dataArray[ieuler + 2] = prtcl.euler[2];
           ieuler += 3;
           pointFlower.dataArray[imisc] = prtcl.size;
           pointFlower.dataArray[imisc + 1] = prtcl.alpha;
           imisc += 2;
       }
       
       //draw
       gl.enable(gl.BLEND);
       //gl.disable(gl.DEPTH_TEST);
       gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
       
       var prog = pointFlower.program;
       useShader(prog);
       
       gl.uniformMatrix4fv(prog.uniforms.uProjection, false, projection.matrix);
       gl.uniformMatrix4fv(prog.uniforms.uModelview, false, camera.matrix);
       gl.uniform3fv(prog.uniforms.uResolution, renderSpec.array);
       gl.uniform3fv(prog.uniforms.uDOF, Vector3.arrayForm(camera.dof));
       gl.uniform3fv(prog.uniforms.uFade, Vector3.arrayForm(pointFlower.fader));
       
       gl.bindBuffer(gl.ARRAY_BUFFER, pointFlower.buffer);
       gl.bufferData(gl.ARRAY_BUFFER, pointFlower.dataArray, gl.DYNAMIC_DRAW);
       
       gl.vertexAttribPointer(prog.attributes.aPosition, 3, gl.FLOAT, false, 0, pointFlower.positionArrayOffset * Float32Array.BYTES_PER_ELEMENT);
       gl.vertexAttribPointer(prog.attributes.aEuler, 3, gl.FLOAT, false, 0, pointFlower.eulerArrayOffset * Float32Array.BYTES_PER_ELEMENT);
       gl.vertexAttribPointer(prog.attributes.aMisc, 2, gl.FLOAT, false, 0, pointFlower.miscArrayOffset * Float32Array.BYTES_PER_ELEMENT);
       
       // doubler
       for(var i = 1; i < 2; i++) {
           var zpos = i * -2.0;
           pointFlower.offset[0] = pointFlower.area.x * -1.0;
           pointFlower.offset[1] = pointFlower.area.y * -1.0;
           pointFlower.offset[2] = pointFlower.area.z * zpos;
           gl.uniform3fv(prog.uniforms.uOffset, pointFlower.offset);
           gl.drawArrays(gl.POINT, 0, pointFlower.numFlowers);
           
           pointFlower.offset[0] = pointFlower.area.x * -1.0;
           pointFlower.offset[1] = pointFlower.area.y *  1.0;
           pointFlower.offset[2] = pointFlower.area.z * zpos;
           gl.uniform3fv(prog.uniforms.uOffset, pointFlower.offset);
           gl.drawArrays(gl.POINT, 0, pointFlower.numFlowers);
           
           pointFlower.offset[0] = pointFlower.area.x *  1.0;
           pointFlower.offset[1] = pointFlower.area.y * -1.0;
           pointFlower.offset[2] = pointFlower.area.z * zpos;
           gl.uniform3fv(prog.uniforms.uOffset, pointFlower.offset);
           gl.drawArrays(gl.POINT, 0, pointFlower.numFlowers);
           
           pointFlower.offset[0] = pointFlower.area.x *  1.0;
           pointFlower.offset[1] = pointFlower.area.y *  1.0;
           pointFlower.offset[2] = pointFlower.area.z * zpos;
           gl.uniform3fv(prog.uniforms.uOffset, pointFlower.offset);
           gl.drawArrays(gl.POINT, 0, pointFlower.numFlowers);
       }
       
       //main
       pointFlower.offset[0] = 0.0;
       pointFlower.offset[1] = 0.0;
       pointFlower.offset[2] = 0.0;
       gl.uniform3fv(prog.uniforms.uOffset, pointFlower.offset);
       gl.drawArrays(gl.POINT, 0, pointFlower.numFlowers);
       
       gl.bindBuffer(gl.ARRAY_BUFFER, null);
       unuseShader(prog);
       
       gl.enable(gl.DEPTH_TEST);
       gl.disable(gl.BLEND);
   }

   // effects
   //common util
   function createEffectProgram(vtxsrc, frgsrc, exunifs, exattrs) {
       var ret = {};
       var unifs = ['uResolution', 'uSrc', 'uDelta'];
       if(exunifs) {
           unifs = unifs.concat(exunifs);
       }
       var attrs = ['aPosition'];
       if(exattrs) {
           attrs = attrs.concat(exattrs);
       }
       
       ret.program = createShader(vtxsrc, frgsrc, unifs, attrs);
       useShader(ret.program);
       
       ret.dataArray = new Float32Array([
           -1.0, -1.0,
            1.0, -1.0,
           -1.0,  1.0,
            1.0,  1.0
       ]);
       ret.buffer = gl.createBuffer();
       gl.bindBuffer(gl.ARRAY_BUFFER, ret.buffer);
       gl.bufferData(gl.ARRAY_BUFFER, ret.dataArray, gl.STATIC_DRAW);
       
       gl.bindBuffer(gl.ARRAY_BUFFER, null);
       unuseShader(ret.program);
       
       return ret;
   }

   // basic usage
   // useEffect(prog, srctex({'texture':texid, 'dtxArray':(f32)[dtx, dty]})); //basic initialize
   // gl.uniform**(...); //additional uniforms
   // drawEffect()
   // unuseEffect(prog)
   // TEXTURE0 makes src
   function useEffect(fxobj, srctex) {
       var prog = fxobj.program;
       useShader(prog);
       gl.uniform3fv(prog.uniforms.uResolution, renderSpec.array);
       
       if(srctex != null) {
           gl.uniform2fv(prog.uniforms.uDelta, srctex.dtxArray);
           gl.uniform1i(prog.uniforms.uSrc, 0);
           
           gl.activeTexture(gl.TEXTURE0);
           gl.bindTexture(gl.TEXTURE_2D, srctex.texture);
       }
   }
   function drawEffect(fxobj) {
       gl.bindBuffer(gl.ARRAY_BUFFER, fxobj.buffer);
       gl.vertexAttribPointer(fxobj.program.attributes.aPosition, 2, gl.FLOAT, false, 0, 0);
       gl.drawArrays(gl.TRIANGLE_STRIP, 0, 4);
   }
   function unuseEffect(fxobj) {
       unuseShader(fxobj.program);
   }

   var effectLib = {};
   function createEffectLib() {
       
       var vtxsrc, frgsrc;
       //common
       var cmnvtxsrc = document.getElementById("fx_common_vsh").textContent;
       
       //background
       frgsrc = document.getElementById("bg_fsh").textContent;
       effectLib.sceneBg = createEffectProgram(cmnvtxsrc, frgsrc, ['uTimes'], null);
       
       // make brightpixels buffer
       frgsrc = document.getElementById("fx_brightbuf_fsh").textContent;
       effectLib.mkBrightBuf = createEffectProgram(cmnvtxsrc, frgsrc, null, null);
       
       // direction blur
       frgsrc = document.getElementById("fx_dirblur_r4_fsh").textContent;
       effectLib.dirBlur = createEffectProgram(cmnvtxsrc, frgsrc, ['uBlurDir'], null);
       
       //final composite
       vtxsrc = document.getElementById("pp_final_vsh").textContent;
       frgsrc = document.getElementById("pp_final_fsh").textContent;
       effectLib.finalComp = createEffectProgram(vtxsrc, frgsrc, ['uBloom'], null);
   }

   // background
   function createBackground() {
       //console.log("create background");
   }
   function initBackground() {
       //console.log("init background");
   }
   function renderBackground() {
       gl.disable(gl.DEPTH_TEST);
       
       useEffect(effectLib.sceneBg, null);
       gl.uniform2f(effectLib.sceneBg.program.uniforms.uTimes, timeInfo.elapsed, timeInfo.delta);
       drawEffect(effectLib.sceneBg);
       unuseEffect(effectLib.sceneBg);
       
       gl.enable(gl.DEPTH_TEST);
   }

   // post process
   var postProcess = {};
   function createPostProcess() {
       //console.log("create post process");
   }
   function initPostProcess() {
       //console.log("init post process");
   }

   function renderPostProcess() {
       gl.enable(gl.TEXTURE_2D);
       gl.disable(gl.DEPTH_TEST);
       var bindRT = function (rt, isclear) {
           gl.bindFramebuffer(gl.FRAMEBUFFER, rt.frameBuffer);
           gl.viewport(0, 0, rt.width, rt.height);
           if(isclear) {
               gl.clearColor(0, 0, 0, 0);
               gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
           }
       };
       
       //make bright buff
       bindRT(renderSpec.wHalfRT0, true);
       useEffect(effectLib.mkBrightBuf, renderSpec.mainRT);
       drawEffect(effectLib.mkBrightBuf);
       unuseEffect(effectLib.mkBrightBuf);
       
       // make bloom
       for(var i = 0; i < 2; i++) {
           var p = 1.5 + 1 * i;
           var s = 2.0 + 1 * i;
           bindRT(renderSpec.wHalfRT1, true);
           useEffect(effectLib.dirBlur, renderSpec.wHalfRT0);
           gl.uniform4f(effectLib.dirBlur.program.uniforms.uBlurDir, p, 0.0, s, 0.0);
           drawEffect(effectLib.dirBlur);
           unuseEffect(effectLib.dirBlur);
           
           bindRT(renderSpec.wHalfRT0, true);
           useEffect(effectLib.dirBlur, renderSpec.wHalfRT1);
           gl.uniform4f(effectLib.dirBlur.program.uniforms.uBlurDir, 0.0, p, 0.0, s);
           drawEffect(effectLib.dirBlur);
           unuseEffect(effectLib.dirBlur);
       }
       
       //display
       gl.bindFramebuffer(gl.FRAMEBUFFER, null);
       gl.viewport(0, 0, renderSpec.width, renderSpec.height);
       gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
       
       useEffect(effectLib.finalComp, renderSpec.mainRT);
       gl.uniform1i(effectLib.finalComp.program.uniforms.uBloom, 1);
       gl.activeTexture(gl.TEXTURE1);
       gl.bindTexture(gl.TEXTURE_2D, renderSpec.wHalfRT0.texture);
       drawEffect(effectLib.finalComp);
       unuseEffect(effectLib.finalComp);
       
       gl.enable(gl.DEPTH_TEST);
   }

   /////
   var SceneEnv = {};
   function createScene() {
       createEffectLib();
       createBackground();
       createPointFlowers();
       createPostProcess();
       sceneStandBy = true;
   }

   function initScene() {
       initBackground();
       initPointFlowers();
       initPostProcess();
       
       //camera.position.z = 17.320508;
       camera.position.z = pointFlower.area.z + projection.nearfar[0];
       projection.angle = Math.atan2(pointFlower.area.y, camera.position.z + pointFlower.area.z) * 180.0 / Math.PI * 2.0;
       Matrix44.loadProjection(projection.matrix, renderSpec.aspect, projection.angle, projection.nearfar[0], projection.nearfar[1]);
   }

   function renderScene() {
       //draw
       Matrix44.loadLookAt(camera.matrix, camera.position, camera.lookat, camera.up);
       
       gl.enable(gl.DEPTH_TEST);
       
       //gl.bindFramebuffer(gl.FRAMEBUFFER, null);
       gl.bindFramebuffer(gl.FRAMEBUFFER, renderSpec.mainRT.frameBuffer);
       gl.viewport(0, 0, renderSpec.mainRT.width, renderSpec.mainRT.height);
       gl.clearColor(0.005, 0, 0.05, 0);
       gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
       
       renderBackground();
       renderPointFlowers();
       renderPostProcess();
   }

   /////
   function onResize(e) {
       makeCanvasFullScreen(document.getElementById("sakura"));
       setViewports();
       if(sceneStandBy) {
           initScene();
       }
   }

   function setViewports() {
       renderSpec.setSize(gl.canvas.width, gl.canvas.height);
       
       gl.clearColor(0.2, 0.2, 0.5, 1.0);
       gl.viewport(0, 0, renderSpec.width, renderSpec.height);
       
       var rtfunc = function (rtname, rtw, rth) {
           var rt = renderSpec[rtname];
           if(rt) deleteRenderTarget(rt);
           renderSpec[rtname] = createRenderTarget(rtw, rth);
       };
       rtfunc('mainRT', renderSpec.width, renderSpec.height);
       rtfunc('wFullRT0', renderSpec.width, renderSpec.height);
       rtfunc('wFullRT1', renderSpec.width, renderSpec.height);
       rtfunc('wHalfRT0', renderSpec.halfWidth, renderSpec.halfHeight);
       rtfunc('wHalfRT1', renderSpec.halfWidth, renderSpec.halfHeight);
   }

   function render() {
       renderScene();
   }

   var animating = true;
   function toggleAnimation(elm) {
       animating ^= true;
       if(animating) animate();
       if(elm) {
           elm.innerHTML = animating? "Stop":"Start";
       }
   }

   function stepAnimation() {
       if(!animating) animate();
   }

   function animate() {
       var curdate = new Date();
       timeInfo.elapsed = (curdate - timeInfo.start) / 1000.0;
       timeInfo.delta = (curdate - timeInfo.prev) / 1000.0;
       timeInfo.prev = curdate;
       
       if(animating) requestAnimationFrame(animate);
       render();
   }

   function makeCanvasFullScreen(canvas) {
       var b = document.body;
      var d = document.documentElement;
      fullw = Math.max(b.clientWidth , b.scrollWidth, d.scrollWidth, d.clientWidth);
      fullh = Math.max(b.clientHeight , b.scrollHeight, d.scrollHeight, d.clientHeight);
      canvas.width = fullw;
      canvas.height = fullh;
   }

   window.addEventListener('load', function(e) {
       var canvas = document.getElementById("sakura");
       try {
           makeCanvasFullScreen(canvas);
           gl = canvas.getContext('experimental-webgl');
       } catch(e) {
           alert("WebGL not supported." + e);
           console.error(e);
           return;
       }
       
       window.addEventListener('resize', onResize);
       
       setViewports();
       createScene();
       initScene();
       
       timeInfo.start = new Date();
       timeInfo.prev = timeInfo.start;
       animate();
   });

   //set window.requestAnimationFrame
   (function (w, r) {
       w['r'+r] = w['r'+r] || w['webkitR'+r] || w['mozR'+r] || w['msR'+r] || w['oR'+r] || function(c){ w.setTimeout(c, 1000 / 60); };
   })(window, 'equestAnimationFrame');
</script>
</html>