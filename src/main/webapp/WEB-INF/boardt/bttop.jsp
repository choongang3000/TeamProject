<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../user/ustop.jsp" %>
<!DOCTYPE html>
	<!-- ********************* 추가한 것 ******************** -->
    <style>
    *{
    	text-decoration: none;
    }

    </style>
	<!-- ************************************************** -->
    
     
	
	<!-- 슬라이드 화면 -->
	  <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active" data-bs-interval="10000">
	      <img src="<%=request.getContextPath() %>/resources/images/상단광고1.png" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item" data-bs-interval="10000">
	      <img src="<%=request.getContextPath() %>/resources/images/상단광고2.png" class="d-block w-100" alt="...">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	
	