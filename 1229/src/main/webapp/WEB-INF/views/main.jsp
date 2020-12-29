<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/popup.css">
   <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/clup.css">
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
        .wrap2 {
            width: 30%;
            margin: auto;
            margin-top: 150px;
        }
        .select2 {
            border: 3px solid #00B4CC;
            padding: 5px;
            height: 35px;
            border-radius: 5px 5px 5px 5px;
            outline: none;
            margin-right:20px;
        }
        .icon2{
        width: 150px;
        height: 170px;
        }
   </style>   
</head>
	<body>
	<div><jsp:include page="loading.jsp"/></div>
	<div><jsp:include page="menu.jsp"/></div>
	<!-- 조원소개를 넣으면 어떨까? 12-18-->
	<main class="content">
		<section class="services my_container clearfix">
			<div class="service_item">
				<span class="icon"><img class="icon2" src="display?fileName=김선관.jpg"></span>
               	<h4>김선관</h4>
               	<p>
					회의 진행, 일정 조율 <br>
				  	JSP, Controller<br>
				  	CSS, JSP 결합
               	</p>
               	<span class="status"></span>
         	</div>
    		<div class="service_item">
               	<span class="icon"><img class="icon2" src="display?fileName=조새벽.jpg"></span>
               	<h4>조새벽</h4>
               	<p>
			 		회의 정리 및 일정 공유 <br>
				 	JSP, fullCalender<br>
				  	유효성 검토
               	</p>
               	<span class="status"></span>
          	</div>
            <div class="service_item">
           		<span class="icon"><img class="icon2" src="display?fileName=전영진.jpg"></span>
               	<h4>전영진</h4>
               	<p>
					스토리 보드 작성 <br>
				  	CSS , JSP<br>
				  	정적 CSS 전담
               	</p>
               	<span class="status"></span>
         	</div>
            <div class="service_item">
               	<span class="icon"><img class="icon2" src="display?fileName=최대식.jpg"></span>
               	<h4>최대식</h4>
               	<p>
					DB 설계 및 기입 <br>
				  	Controller, DB<br>
				 	Service, Model
               	</p>
               	<span class="status"></span>
          	</div>
            <div class="service_item">
               	<span class="icon"><img class="icon2" src="display?fileName=이장희.jpg"></span>
               	<h4>이장희</h4>
               	<p>
					스토리 보드 작성 <br>
				 	JSP , fullCalender <br>
					유효성 검토
               	</p>
               	<span class="status"></span>
          	</div>
            <div class="service_item">
               	<span class="icon"><img class="icon2" src="display?fileName=안동현.jpg"></span>
               	<h4>안동현</h4>
               	<p>
					스토리 보드 작성 <br>
				 	CSS 전체 구상 및 구현<br>
					동적 CSS 전담
               	</p>
               	<span class="status"></span>
          	</div>
    	</section><!--//services -->
	</main>  
    <div style="">  
      	<!-- 내가 가입한  동아리 -->
       	<c:if test="${not empty myList}"> 
         	<div  class="detail" style="font-size:40px; margin-top:80px; margin-bottom:50px;"><h1>가입한동아리</h1></div>    
            <div class="swiper-container2" >
            	<div class="swiper-wrapper">
                  	<!-- Slides  넣을곳 -->
                    <c:forEach items="${myList}" var="mylist">
                       	<div class="swiper-slide">
                          	<div class="picture">  
                               	<a class="button2" href="club_first?c_code=${mylist.c_code}">              
                                   	<img class="imgc" src="display?fileName=${mylist.c_pic}" c_code="${mylist.c_code}">
                                </a> 
                                <div class=detail>
                                    <h3>${mylist.c_name}</h3>
                                </div>
                           	</div>
                      	</div>
                  	</c:forEach>
                </div>
            	<div class="swiper-button-prev"></div> 
             	<div class="swiper-button-next"></div> 
          	</div>
     	</c:if>
       	<!-- 검색 -->
        <div class="wrap2">   
        	<div class="search">
               	<select class="select2">
                   	<option value="c_name">동아리 이름</option>
               	</select>
            <input type="text" class="searchTerm" id="keyword">
			<button type="button" class="searchButton" id="btnSearch"><i class="fa fa-search"></i></button>
			</div>
		</div>
      	<!-- 검색 결과 나오기 -->
		<table id="searchResult" class="searchList2"></table>
       	<div id="divSearchResult" style="text-align: center; margin-top: 20px;"></div>
		<script id="temp" type="text/x-handlebars-template">
       		<table>
            	<tr style="margin-bottom: 15px;">
                	<th class="m_name">동아리 이름</th>
                    <th class="m_pid">개설자</th>
                    <th class="m_spot">활동장소</th>
                    <th class="m_category">카테고리</th> 
                    <th class="m_category">이동</th>
               	</tr>
          	</table> 
         	{{#each searchList}}      
            	<tr style="margin-bottom: 15px;">
                	<td class="m_name">{{c_name}}</td>
                    <td class="m_pid">{{c_pid}}</td>
                    <td class="m_spot">{{c_spot}}</td>
                    <td class="m_category">{{c_category}}</td>
                    <td class="m_btn"><input type="button" value="이동하기" class="btn_m" onClick="location.href='club_first?c_code={{c_code}}'"></td>
               	</tr>
         	{{/each}}
		</script>
		<div class="page_wrap">
            <div class="page_nation" id="page_nation"></div>
       	</div>   
    </div>
        
   	<!-- 추천 동아리 -->
   	<div  class="detail" style="font-size:40px; margin-top:80px;" id="game_list"><h1>게임</h1></div>    
      	<div class="swiper-container">
         	<div class="swiper-wrapper">
            <!-- Slides  넣을곳 -->
            <c:forEach items="${gameList}" var="glist">
            	<div class="swiper-slide">
                	<div class="picture">  
                    	<a class="button2" href="#popup">              
                        	<img class="imgc" src="display?fileName=${glist.c_pic}" c_code="${glist.c_code}">
                        </a> 
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
                  		<a class="button2" href="#popup">                 
                           <img class="imgc" src="display?fileName=${splist.c_pic}"  c_code="${splist.c_code}">
                        </a>                   
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
                       <a class="button2" href="#popup">                 
                           <img class="imgc" src="display?fileName=${stlist.c_pic}"  c_code="${stlist.c_code}">
                        </a>               
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
                        <a class="button2" href="#popup">                 
                            <img class="imgc" src="display?fileName=${holist.c_pic}"  c_code="${holist.c_code}">
                        </a>               
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
                        <a class="button2" href="#popup">                 
                           <img class="imgc" src="display?fileName=${etclist.c_pic}"  c_code="${etclist.c_code}">
                        </a>                 
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
   
   <!-- 팝업창  -->
   <div class="popup" id="popup">
      <div class="popup-inner">
            <div class="popupimg" id="c_pic" style="height:100%; width:100%;"><!-- 사진 자리  --></div>
           <div class="memo">
              <h1 class="memoname" id="c_name"></h1>
               <div class="left">
               <h2 class="h42">동아리정보</h2>
               <div class="memo3">
                  <ul class="ul2">
                      <li class="li2"><i class="fas fa-crown" style="font-size: 25px; color:yellow;"></i><span class="span2" id="c_pid"></span></li>
                        <li class="li2"><i class="fas fa-male" style="font-size: 35px; margin-left: 8px; margin-right: 13px;"></i><span class="span2" id="count"></span></li>
                        <li class="li2"><i class="fas fa-map-marker-alt" style="font-size: 25px; margin-left: 5px; margin-right: 5px;"></i><span class="span2" id="c_spot"></span></li>
                        <li class="li2"><i class="far fa-calendar-check" style="font-size: 21px; margin-left: 5px; margin-right: 5px;"></i><span class="span2" id="c_regdate"></span></li>
                     </ul>
               </div>
         </div>
           <div class="rigth">
               <h2 class="h42">가입조건</h2>         
               <div class="memo2">
                     <ul class="ul2">
                        <li class="li2">
                           <span class="span2" id="c_condition"></span>
                        </li>
                     </ul>
               </div>
            </div>
           <div class="footer">
                 <h2 class="h43">소개하기</h2>
                 <div class="memo4">
                     <p class="p2" id="c_welcome"></p>
                </div>
           </div>
      </div>         
           <a class="popup__close" id="close">X</a>
           <input class="btncl" type="button" value="이동하기" id="joinClub">
       </div>
   </div>
</body>
<script>

   // 추천 동아리 슬라이더 효과를 jscript를 통해 준다
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
    
    //내가 가입한 동아리 슬라이더 효과를 jscript를 통해 준다
    $(document).ready(function() {
       var swiper = new Swiper(".swiper-container2", {
            effect : "coverflow", // 커버플로우 효과 사용
            grabCursor : true,
            centeredSlides : true,
            loop : false, // 슬라이드 반복
            slidesPerView : "auto",
            coverflowEffect : {
               rotate : 0, // 슬라이더 회전 각 : 클수록 슬라이딩시 회전이 커짐
                  stretch : -50, // 슬라이더간 거리(픽셀) : 클수록 슬라이더가 서로 많이 겹침
                  depth : 0, // 깊이 효과값 : 클수록 멀리있는 느낌이 강해짐
                  modifier : 1, // 효과 배수 : 위 숫자값들에 이 값을 곱하기 처리하여 효과를 강하게 처리함
                  slideShadows : false
               // 슬라이더 그림자 : 3D 효과를 강조하기 위한 회전시 흐릿한 효과
            },
            speed : 500,// 슬라이드 속도 0.5초
            navigation : {
                  nextEl : '.swiper-button-next', // 다음 버튼 클래스명
                  prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
            },
            pagination : {
            el : ".swiper-pagination"
         }
      });
   });
   
   
    // 추천 동아리를 클릭했을때 popup이 뜬다. 해당 popup에 정보를 입력시킨다.
    var c_code ="";
   $(".imgc").on("click",function(){
      c_code = $(this).attr("c_code");
      $.ajax({
         type : "get",
         url : "readClub",
         data : {"c_code":c_code},
         dataType : "json",
         success : function(data) {
            $("#c_pic").html("<img class='popupimgc' src='display?fileName=" + data.cvo.c_pic + "'>");
            $("#c_pid").text(data.cvo.c_pid);
            $("#count").text(data.maincount);
            $("#c_spot").text(data.cvo.c_spot);
            $("#c_regdate").text(data.cvo.c_regdate);
            $("#c_condition").text(data.cvo.c_condition);
            $("#c_welcome").text(data.cvo.c_welcome);
            $("#c_name").text(data.cvo.c_name);
         }
      })
    });
   
    // popup을 없앤다.
   $(document).ready(function() {
      $("#close").click(function(){            
         window.history.back()       
      });       
   });
    
   
    // popup에서 이동하기 button을 누르면 해당 동아리 page로 이동시킨다. 
   $("#joinClub").click(function(){ 
      location.href="club_first?c_code="+c_code; 
   });  
    
    
    var page = 1;
    var keyword = $("#keyword").val();
   // 검색 결과가 나오는 div를 숨긴다.  
   $("#divSearchResult").hide();
   
   // 동아리 검색 결과를 ajax을 통해 보여준다. 
    $("#btnSearch").on("click",function(){
       keyword = $("#keyword").val();
       
       getSearchResult();
       
    });
    
     //페이지네이션
   $("#page_nation").on("click","a",function(e){
        e.preventDefault();
        page=$(this).attr("href");
        
        getSearchResult();
     });
     
     //검색 결과를 가져오는 기능을 하는 함수를 만든다.
   function getSearchResult(){
        $.ajax({
          type : "get",
         url : "searchcir",
         data : {"keyword":keyword,"page":page},
         dataType : "json",
         success:function(data) {
            	var temp=Handlebars.compile($("#temp").html());
                 $("#searchResult").html(temp(data));
                 
                 $("#divSearchResult").hide();
                 if(data.pm.totalCount=='0'){
 		        	$("#divSearchResult").html("검색결과가 없습니다");
 		        	$("#divSearchResult").show();
 		        }
                 
                 var str="";
                 if(data.pm.prev){
                    str += "<a href='"+ (data.pm.startPage-1) +"'>◀</a>"
                 }       
                 for(var i=data.pm.startPage; i<=data.pm.endPage; i++){
                    if(page==i){
                       str += "[<a href='"+ i +"' class='active'>" + i +"</a>]";
                    }else{
                       str += "[<a href='"+ i +"'>" + i +"</a>]";
                    }
            }
                if(data.pm.next){
                  str += "<a href='"+ (data.pm.endPage+1) +"'>▶</a>"
               }
                $("#page_nation").html(str);
                
         }
       });
   }


</script>
</html>