<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>login</title>
   <style>
      * { box-sizing:border-box; }
      body {
         font-family: Helvetica;
         background: #eee;
        -webkit-font-smoothing: antialiased;
      }   
      hgroup { 
         text-align:center;
         margin-top: 4em;
      }   
      h1, h3 { font-weight: 300; }   
      h1 { color: #636363; }   
      h3 { color: #4a89dc; }   
      form {
         width: 380px; /* 위스를 변경하면 모든줄이 늘이난다. */
         margin: 4em auto;
         padding: 3em 2em 2em 2em;
         background: #fafafa;
         border: 1px solid #ebebeb;
         box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
      }   
      .group { 
         position: relative; 
         margin-bottom: 45px; 
      }
      .input2 {
         font-size: 18px;
         padding: 10px 10px 10px 5px;
         -webkit-appearance: none;
         display: block;
         background: #fafafa;
         color: #636363;
         width: 100%;
         border: none;
         border-radius: 0;
         border-bottom: 1px solid #757575;
      }   
      .input2:focus { outline: none; }
      
      /* Label */
      label {
         color: #999; 
         font-size: 18px;
         font-weight: normal;
         position: absolute;
         pointer-events: none;
         left: 5px;
         top: 10px;
         transition: all 0.2s ease; /* 클릭시 이동하는 속도 */
      }
         
      /* active */
      
      .input2:focus ~ label, .input2.used ~ label {
         top: -20px;
        transform: scale(.75); left: -2px;
         /* font-size: 14px; */
         color: #4a89dc; /* 클릭시 위로 올라갔을때 색상 */
      }
      
      /* Underline */
      .bar {
         position: relative;
         display: block;
         width: 100%; /* 클릭시 생성되는 텍스트상자의 하단 줄 */
      }
      .bar:before, .bar:after {
         content: '';
         height: 2px; 
         width: 0;
         bottom: 1px; 
         position: absolute;
         background: #4a89dc; 
         transition: all 0.2s ease;
      }
      .bar:before { left: 50%; }
      .bar:after { right: 50%; }
      
      /* active */
      .input2:focus ~ .bar:before, .input2:focus ~ .bar:after { width: 50%; }
      
      /* 클릭시 생성되는 가로의 바 */   
      .highlight {
         position: absolute;
         height: 60%; 
         width: 100%; /* 클릭시 생성되는 가로의 바의 길이 */
         top: 25%; 
         left: 0;
         pointer-events: none;
         opacity: 0.5; /* 클릭시 생성되는 가로의 바의 시간 */
      }
      
      /* active */
      .input2:focus ~ .highlight {
         animation: inputHighlighter 0.3s ease;
      }
      
      /* Animations */
      @keyframes inputHighlighter {
         from { background: #4a89dc; } /* 텍스트 창 클릭시 배경색 */
         to    { width: 0; background: transparent; }/* 텍스트 창 클릭시 배경색 (돌아올떄)*/
      }
         
      /* Button */
      .button {
        position: relative;
        display: inline-block;
        padding: 12px 24px;
        margin: .3em 0 1em 0;
        width: 100%;
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
      .button:focus { outline: 0; }      
      
      /* Button modifiers */      
      .buttonBlue {
        background: #4a89dc; /* 버튼 색상 */
        text-shadow: 1px 1px 0 rgba(39, 110, 204, .5);
      }      
      .buttonBlue:hover { background: #357bd8; } /* 버튼 색상 */      
      
      /* Ripples container */      
      .ripples {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background: transparent;
      }
            
      /* 물결의 원형 */
      
      .ripplesCircle {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        opacity: 0;
        width: 0;
        height: 0;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.25);
      }
      .ripples.is-active .ripplesCircle {
        animation: ripples .4s ease-in;
      }
      
      /* 물결애니메이션 */
      @keyframes ripples {
        0% { opacity: 0; }
      
        25% { opacity: 1; }
      
        100% {
          width: 200%; /*물결의 세로 */
          padding-bottom: 200%; /* 물결의 가로 */
          opacity: 0; /* 물결의 느낌이 숫자가 높으면 이상해진다 */
        }
      }      
      footer { text-align: center; }
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
      footer img:hover { opacity: 0.7;} /* 하단에 이미지의 호버됐을 때 불투명도 (max 1) */
      footer img:focus , footer a:focus { outline: none; }
   </style>
</head>
<body>

<hgroup>
  <h1><a href="/">Making a Meeting</a></h1>
</hgroup>

<form name="frm" action="login" method="post">
  <div class="group">
    <input type="text" name="id" class="input2"><span class="highlight"></span><span class="bar"></span>
    <label>ID</label>
  </div>
  <div class="group">
    <input type="password" name="pw"  class="input2"><span class="highlight"></span><span class="bar"></span>
    <label>Password</label>
  </div>
   
  <input style="margin-bottom:25px" class="chk" type="checkbox" name="chkLogin">로그인 상태유지
  
  <!-- 로그인 버튼 --> 
   <button class="button buttonBlue">로그인
    <div class="ripples buttonRipples">
       <span class="ripplesCircle"></span>
    </div>
  </button>
  
  
  <!-- 회원 등록 버튼 -->
    <button id="signupPage" class="button buttonBlue">회원가입
       <div class="ripples buttonRipples">
          <span class="ripplesCircle"></span>
       </div>
     </button>   
</form>

<!-- 하단에 이미지 부분 -->
<footer>
   <a href="https://papago.naver.com/" target="_blank"><img src="https://www.polymer-project.org/images/logos/p-logo.svg"></a>
   <p>You Papago <a href="https://papago.naver.com/" target="_blank">Go</a></p>
</footer>

</body>
<script>
   $("#signupPage").on("click",function(e){
      e.preventDefault();
      location.href="signup";
   })
   
   	$(frm).submit(function(e){
         e.preventDefault();
         var pw=$(frm.pw).val();
         var id=$(frm.id).val();
         var chkLogin=$(frm.chkLogin).is(":checked")? true:false;
         $.ajax({
			type:"post",
			url:"login.json",
           	data:{"id":id , "pw":pw, "chkLogin" :chkLogin},
          	success:function(data){
            	if(data==0){
                	alert("아이디가 없습니다.")
               	}
               	else if(data==2){
                  	alert("비밀번호가 맞지 않습니다.");
               	}else{
                  	alert("로그인 성공");
                  	location.href="/";
               	}
           	}
      	});
   	});
   
   // css 일부
   $(window, document, undefined) .ready( function() {
      $('input').blur(function() {
         var $this = $(this);
         if ($this.val()) $this.addClass('used');
         else $this.removeClass('used');
      });
      var $ripples = $('.ripples');
      $ripples.on('click.Ripples', function(e) {
         var $this = $(this);
         var $offset = $this.parent().offset();
         var $circle = $this.find('.ripplesCircle');
         var x = e.pageX - $offset.left;
         var y = e.pageY - $offset.top;
         $circle.css({
            top : y + 'px',
            left : x + 'px'
         });
         $this.addClass('is-active');
      });
      $ripples.on('animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd', function(e) {
         $(this).removeClass('is-active');
      });
   });
</script>
</html>