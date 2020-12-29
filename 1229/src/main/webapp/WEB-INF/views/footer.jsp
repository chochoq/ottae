<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script defer src="https://use.fontawesome.com/releases/v5.5.0/js/all.js" integrity="sha384-GqVMZRt5Gn7tB9D9q7ONtcp4gtHIUEW/yG7h98J7IpE3kpi+srfFyyB/04OV6pG0" crossorigin="anonymous"></script>
    <title>Insert title here</title>
    <style>
      body {
         margin: 0;
         padding: 0;
      }
      
      .inner-footer {
         margin: 0;
         padding: 0;
         background-color: #000;
      }
      
      .social-links {
         display: flex;
      }
      
      .social-links ul {
          padding: 10px;
         display: flex;
         width: 280px;
         height: 30px;
         margin: auto;
           margin-bottom: 20px;

      }
      
      .socal-items {
         list-style: none;
      }
      
      .social-items a {
         padding: 10px 20px;
         font-size: 35px;
         color: #fff;
         transition: all .25s;
      }
      
      .social-items a:hover{
          color: #6cccc6;
      }
      
      .quick-links {
         display: flex;
         width: 465px;
         height: 70px;
         margin: auto;
         
      }
      
      .quick-links ul {
         display: flex;
         margin-top: 20px;
         
      }
      
      .quick-items {
         list-style: none;
      }
      
      .quick-items a {
         text-decoration: none;
         padding: 0px 15px;
         font-size: 18px;
         color: #fff;
         transition: all .25s;
      }
      
      .quick-items a:hover{
          color: #6cccc6;
      }
      
      .outer-footer {
         padding: 10px;
         text-align: center;
         color: #fff;
         font-size: 18px;
         background-color: #000;
      }
   </style>
</head>
<body>
   <footer class="footer" style="margin-top:150px">
       <div class="inner-footer">
           
         <div class="quick-links">
                  <ul>
               <li class="quick-items"><a href="/">home</a></li>
                      <li class="quick-items"><a href="schedule">일정</a></li>
                      <li class="quick-items"><a href="QnA">Q&A</a></li>
                      <li class="quick-items"><a href="notice">공지사항</a></li>
                      <li class="quick-items"><a href="myPage_userUpdate">회원정보 수정</a></li>
                  </ul>
              </div>
           
              <div class="outer-footer">
                  Copyright &copy; dksehdgus18@naver.com ACAI@
              </div>
          </div>
      </footer>
</body>
</html>