<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Carousel Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
	
    <!-- Bootstrap core CSS --> <!-- 여기 부분을 바꿔줌 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- Favicons -->
	<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
	<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
	<meta name="theme-color" content="#7952b3">

	
    <style>
     .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      .top_nav{
      	text-decoration: none;
      	font-weight: bold;
      }
      
      .title{
      	font-size:large;
      	text-decoration: none;
      	font-weight:bold;
      }
      <!-- 슬라이드 화면 -->
      
      .container {
      	width : 300vw; /*가로 폭*/
      }
      .inner {
        width : 100vw;
        float : left;
      }
      
      .faddress{
    	text-align: center;
    	height: 120; /* 하단 높이 */
    	width: 100%;
      }
      
      *{
    	text-decoration: none;
      }
      
    </style>
  </head>
   <body>
    
	<div class="container">
	  <header class="blog-header py-3">
	    <div class="row flex-nowrap justify-content-between align-items-center">
	      <div class="col-4 pt-1">
	       <!--  <a class="link-secondary" href="#">Subscribe</a> -->
	      </div>
	      <div class="col-4 text-center">
	        <a class="blog-header-logo text-dark title" href="home.us"><img src="<%=request.getContextPath() %>/resources/images/온강 로고.png" width="100" height="100"/></a>
	      </div>
	      <div class="col-4 d-flex justify-content-end align-items-center">
	        <a class="link-secondary" href="#" aria-label="Search">
	          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
	        </a>
	        <c:choose>
				<c:when test="${sessionScope.loginInfo != null}">
					<div id="header-main-menu">
						<c:if test="${sessionScope.loginInfo.type eq 'admin' }">
							<span>관리자님 반갑습니다!</span>
							<a href="list.ad" class="header-sub-menu">관리자 홈으로 가기</a>
						</c:if>
						<c:if test="${sessionScope.loginInfo.type != 'admin' }">
							<span>${loginInfo.aname } 님 반갑습니다!</span>
							<a href="#" class="header-sub-menu">정보수정</a>
							<a href="cartlist.stu" class="header-sub-menu">장바구니</a>
							<a href="shlist.stu" class="header-sub-menu">구매목록</a>							
						</c:if>
						<a href="<%=request.getContextPath()%>/logout.jsp" class="header-sub-menu">로그아웃</a>
					</div>
				</c:when>
				<c:otherwise>
					<div id="header-main-menu">
						<a href="loginForm.mem" class="header-sub-menu">로그인</a> 
						<a href="register.mem" class="header-sub-menu">회원가입</a>
					</div>
				</c:otherwise>
			</c:choose>
	    </div>
	  </header>
	
	  <div class="nav-scroller py-1 mb-2 border-bottom">
	    <nav class="nav d-flex justify-content-between">
	      <a class="p-2 link-secondary top_nav" href="list.cos">강의 &nbsp<img src="<%=request.getContextPath() %>/resources/images/computer-mouse-solid.svg" width="20" height="20"/></a>
	      <!-- 강의 jsp는 course폴더에 있음 -->
	      <a class="p-2 link-secondary top_nav" href="list.te">선생님 &nbsp<img src="<%=request.getContextPath() %>/resources/images/computer-mouse-solid.svg" width="20" height="20"/></a>
	      <a class="p-2 link-secondary top_nav" href="list.bt">Quiz &nbsp<img src="<%=request.getContextPath() %>/resources/images/quiz-bell.svg" width="20" height="20"/></a>
	      <a class="p-2 link-secondary top_nav" href="list.ba">FAQ 게시판 &nbsp<img src="<%=request.getContextPath() %>/resources/images/computer-mouse-solid.svg" width="20" height="20"/></a>
	      <a class="p-2 link-secondary top_nav" href="mypage.mem">마이페이지 &nbsp<img src="<%=request.getContextPath() %>/resources/images/mypage.svg" width="20" height="20"/></a>
	    </nav>
	  </div>
	</div>
   
   