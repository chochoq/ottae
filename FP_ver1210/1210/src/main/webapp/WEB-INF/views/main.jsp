<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
      <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
      <title>final project</title>
      <style>
         @import url(https://fonts.googleapis.com/css?family=Open+Sans);   
         .search {
            width: 100%;
            position: relative;
            display: flex;
         }   
         .searchTerm {
            width: 100%;
            border: 3px solid #00B4CC;
            border-right: none;
            padding: 5px;
            height: 20px;
            border-radius: 5px 0 0 5px;
            outline: none;
         }   
         .searchButton {
            width: 40px;
            height: 36px;
            border: 1px solid #00B4CC;
            background: #00B4CC;
            text-align: center;
            color: #fff;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-size: 20px;
         }
         /*Resize the wrap to see the search bar change!*/
         .wrap {
            width: 30%;
            position: absolute;
            left: 50%;
            transform: translate(-50%, -50%);
         }
         .select2 {
            border: 3px solid #00B4CC;
            padding: 5px;
            height: 35px;
            border-radius: 5px 5px 5px 5px;
            outline: none;
            margin-right:20px;
         }
</style>   
   </head>
   <body>
   <div><jsp:include page="menu.jsp"/></div>
   
   <!-- 조원소개를 넣으면 어떨까? -->
   <main class="content">
      <section class="services container clearfix">
         <div class="service_item">
            <span class="icon"><i class="fas fa-pencil-alt"></i></span>
            <h4>Web &amp; App Design</h4>
            <p>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim.</p>
            <span class="status"></span>
         </div>
         <div class="service_item">
            <span class="icon"><i class="fas fa-leaf"></i></span>
            <h4>Development</h4>
            <p>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim.</p>
            <span class="status"></span>
         </div>
         <div class="service_item">
            <span class="icon"><i class="fas fa-cog"></i></span>
            <h4>Customization</h4>
            <p>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim.</p>
            <span class="status"></span>
         </div>
         <div class="service_item">
            <span class="icon"><i class="fas fa-bullhorn"></i></span>
            <h4>Marketing</h4>
            <p>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim.</p>
            <span class="status"></span>
         </div>                        
      </section><!--//services -->
   </main>
   
   <!-- 검색 -->
   <div class="wrap">
      <div class="search">
      <select class="select2">
          <option>동아리 이름</option>
          <option>동아리 회장</option>
      </select>
         <input type="text" class="searchTerm">
         <button type="submit" class="searchButton"><i class="fa fa-search"></i></button>
      </div>
   </div>
   
   
   
   <!-- 추천 동아리 -->
   	<div  class="detail" style="font-size:40px; margin-top:80px; "><h1>게임</h1></div>    
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<!-- Slides  넣을곳 -->
			<c:forEach items="${gameList}" var="glist">
	         	<div class="swiper-slide">
	            	<div class="picture">                 
	                   	<img class="imgc" src="display?fileName=${glist.c_pic}">
		               	<div class=detail>
		                   	<h3>${glist.c_name}</h3>
		                </div>
		       		</div>
	          	</div>
			</c:forEach>
		</div>
		<div class="swiper-button-prev"></div> 
		<div class="swiper-button-next"></div> 
   	</div>
   	
	<div  class="detail" style="font-size:40px; margin-top:80px; "><h1>운동</h1></div>    
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<!-- Slides  넣을곳 -->
			<c:forEach items="${sportList}" var="splist">
	         	<div class="swiper-slide">
	            	<div class="picture">                 
	                   	<img class="imgc" src="display?fileName=${splist.c_pic}">
		               	<div class=detail>
		                   	<h3>${splist.c_name}</h3>
		                </div>
		       		</div>
	          	</div>
			</c:forEach>
		</div>
		<div class="swiper-button-prev"></div> 
		<div class="swiper-button-next"></div> 
   	</div>
   	
   	<div  class="detail" style="font-size:40px; margin-top:80px; "><h1>공부</h1></div>    
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<!-- Slides  넣을곳 -->
			<c:forEach items="${studyList}" var="stlist">
	         	<div class="swiper-slide">
	            	<div class="picture">                 
	                   	<img class="imgc" src="display?fileName=${stlist.c_pic}">
		               	<div class=detail>
		                   	<h3>${stlist.c_name}</h3>
		                </div>
		       		</div>
	          	</div>
			</c:forEach>
		</div>
		<div class="swiper-button-prev"></div> 
		<div class="swiper-button-next"></div> 
   	</div>
   	
   	<div  class="detail" style="font-size:40px; margin-top:80px; "><h1>취미</h1></div>    
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<!-- Slides  넣을곳 -->
			<c:forEach items="${hobbyList}" var="holist">
	         	<div class="swiper-slide">
	            	<div class="picture">                 
	                   	<img class="imgc" src="display?fileName=${holist.c_pic}">
		               	<div class=detail>
		                   	<h3>${holist.c_name}</h3>
		                </div>
		       		</div>
	          	</div>
			</c:forEach>
		</div>
		<div class="swiper-button-prev"></div> 
		<div class="swiper-button-next"></div> 
   	</div>
   	
   	<div  class="detail" style="font-size:40px; margin-top:80px; "><h1>기타</h1></div>    
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<!-- Slides  넣을곳 -->
			<c:forEach items="${etcList}" var="etclist">
	         	<div class="swiper-slide">
	            	<div class="picture">                 
	                   	<img class="imgc" src="display?fileName=${etclist.c_pic}">
		               	<div class=detail>
		                   	<h3>${etclist.c_name}</h3>
		                </div>
		       		</div>
	          	</div>
			</c:forEach>
		</div>
		<div class="swiper-button-prev"></div> 
		<div class="swiper-button-next"></div> 
   	</div>

   
<div><jsp:include page="footer.jsp"/></div>

</body>
<script>
   $(document).ready(function() {
      var swiper = new Swiper(".swiper-container", {
         effect : "coverflow", // 커버플로우 효과 사용
         grabCursor : true,
         centeredSlides : true,
         loop : true, // 슬라이드 반복
         slidesPerView : "auto",
         coverflowEffect : {
            rotate : 0, // 슬라이더 회전 각 : 클수록 슬라이딩시 회전이 커짐
            stretch : -50, // 슬라이더간 거리(픽셀) : 클수록 슬라이더가 서로 많이 겹침
            depth : 0, // 깊이 효과값 : 클수록 멀리있는 느낌이 강해짐
            modifier : 1, // 효과 배수 : 위 숫자값들에 이 값을 곱하기 처리하여 효과를 강하게 처리함
            slideShadows : false
         // 슬라이더 그림자 : 3D 효과를 강조하기 위한 회전시 흐릿한 효과
         },
         speed : 500,// 슬라이드 속도 2초

         navigation : {
            nextEl : '.swiper-button-next', // 다음 버튼 클래스명
            prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
         },
         pagination : {
            el : ".swiper-pagination"
         }
      });
   });   
</script>
</html>