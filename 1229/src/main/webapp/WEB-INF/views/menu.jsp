<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="utf-8"/>
		<title>final project</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
		<meta name="description" content="Waxom free psd template"/>
		<meta name="keywords" content="free, psd, template, responsive"/>
		<meta name="robots" content="index, follow"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>	
		<script defer src="https://use.fontawesome.com/releases/v5.5.0/js/all.js" integrity="sha384-GqVMZRt5Gn7tB9D9q7ONtcp4gtHIUEW/yG7h98J7IpE3kpi+srfFyyB/04OV6pG0" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
		<script>
		  WebFont.load({
			google: {
			  families: ['Montserrat:300,400,700', 'Raleway:300,400,500,600,700,800']
			}
		  });
		</script>     
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="http://malsup.github.com/jquery.cycle2.js"></script>
		<script src="http://malsup.github.io/jquery.cycle2.carousel.js"></script>
		<script>$.fn.cycle.defaults.autoSelector = '.cycle-slideshow';</script>
		<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/defualt.css">
		<script src="<%=request.getContextPath() %>/resources/js/script.js"></script>	
		
	</head>
	<body>
		<header> 
			<div class="container clearfix">
				<h1 class="logo"><a href="/"></a></h1>
				<nav class="clearfix">
					<ul class="main-menu">
						<li class="dropmenu"><a href="/" class="active">Home</a></li>
						<li class="dropmenu"><a href="schedule">일정</a>
							<ul class="babymenu-ul">
						    	<li class="babymenu-li"><a href="makeGroup">모임 만들기</a></li>
						    </ul>
						</li>    											    
						<li class="dropmenu"><a href="/">동아리</a>
							<ul class="babymenu-ul">
						    	<li class="babymenu-li"><a href="makeClub">동아리 만들기</a></li>
						    </ul>
						</li>
						<c:if test="${not empty id}">
						<li class="dropmenu"><a href="myPage_group">마이페이지</a>
							<ul class="babymenu-ul"> 
						        <li class="babymenu-li"><a href="myPage_group">모임 관리</a></li>
						        <li class="babymenu-li"><a href="myPage_club">동아리 관리</a></li>
						        <li class="babymenu-li"><a href="myPage_userUpdate">회원정보수정</a></li>
						    </ul>
						</li>
						</c:if>
						<li class="dropmenu"><a href="notice">고객센터</a>
							<ul class="babymenu-ul">
							 	<li class="babymenu-li"><a href="notice">공지사항</a></li>
						        <li class="babymenu-li"><a href="event">이벤트</a></li>
						        <li class="babymenu-li"><a href="QnA">Q&A</a></li>
						    </ul>
						</li>
						<c:if test="${id == 'master'}">
							<li class="dropmenu"><a href="master_userManage">관리자페이지</a>
								<ul class="babymenu-ul">
							        <li class="babymenu-li"><a href="master_userManage">회원 관리</a></li>
									<li class="babymenu-li"><a href="master_clubManage">동아리 관리</a></li>
									<li class="babymenu-li"><a href="master_groupManage">모임 관리</a></li>
							    </ul>
						    </li>
						</c:if>	
						<c:if test="${id == null}">
							<li class="dropmenu"><a href="login">로그인</a></li>
						</c:if>
						<c:if test="${id != null}">
							<li class="dropmenu"><a href="logout">로그아웃</a></li>
						</c:if>				
					</ul>
					<span class="toggle"><i class="fas fa-bars"></i></span>		
				</nav>		
			</div>		
		</header>
		<div class="slider">
			<ul class="slider-list cycle-slideshow" 
				data-cycle-fx="scrollHorz" 
				data-cycle-timeout="0"
				data-cycle-slides="> li"
				data-cycle-prev=".slider .prev"
				data-cycle-next=".slider .next"
				data-cycle-pager=".pager" >
				<li class="slide1">
					<div class="contents">
						<h3>OTTAE</h3>
						<h2>동아리 시스템</h2>
						<p>OTTAE 에서 100만 회원들과 여러가지 클럽활동을 해보세요. 당신이 원하는 동아리에 들어가서 새로운 인연을 만들어보세요.</p>
						<a href="" class=""></a>				
					</div>

				</li>
				<li class="slide2">
					<div class="contents">
						<h3>OTTAE</h3>
						<h2>일정 관리 시스템</h2>
						<p>OTTAE 에서 보다 쉽게 자신의 스케줄을 관리해보세요. 그일정을 직장 or 지인들과 공유가 가능한 시스템입니다.</p>
						<a href="" class=""></a>			
					</div>
				</li>
				<li class="slide3">
					<div class="contents">
						<h3>OTTAE</h3>
						<h2>모임 관리 시스템</h2>
						<p>OTTAE 에서의 일정 관리 시스템은 직장 or 지인들과 서로의 일정을 공유하고 일정을 정할수 있는 시스템입니다.</p>
						<a href="" class=""></a>			
					</div>
				</li>			
			</ul>
			<p class="controls">
				<a href="" class="prev">prev</a>
				<a href="" class="next">prev</a>
			</p>
			<p class="pager clearfix"></p>			
		</div>
	</body>
</html>		