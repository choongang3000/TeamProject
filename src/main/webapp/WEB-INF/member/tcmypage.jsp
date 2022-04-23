<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp" %>

<style>
	#container {
	width: 1200px;
	margin: auto;
	}
	.col-sm-5{
		margin-top: 10px;
		margin-bottom: 20px;
	}
	#bt {
	 float: right;
	}
</style>
<br><br>
<div id="container">
	<div class="row justify-content-center">
	  <div class="col-sm-5">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">내 정보 관리</h5>
	        <br>
	      <!--   <p class="card-text">내 정보 관리, 수정</p> -->
	        <input class="btn btn-secondary" id="bt" type="button" value="내 정보 관리" onClick="location.href='tcInfo.mem?anum=${loginInfo.anum}'">
	      </div>
	    </div>
	  </div>
	  <div class="col-sm-5">
	    <div class="card">
	      <div class="card-body">
	      <!--   <h5 class="card-title">학생 질문 게시글 관리</h5> -->
	        <h5 class="card-text">학생 질문 게시글 관리</h5>
	        <br>
	        <a href="list.bst"  id="bt" class="btn btn-primary">질문 게시글 관리</a>
	      </div>
	    </div>
	  </div>
	  <div class="col-sm-5">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">내 강의 목록</h5>
	        <br>
	    <!--     <p class="card-text">강의 목록</p> -->
	        <a href="tcCourseList.mem"  id="bt" class="btn btn-primary">내 강의 목록</a>
	      </div>
	    </div>
	  </div>
	  <div class="col-sm-5">
	  </div>
	  <%-- <div class="col-sm-5">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">추가 할거 있음</h5>
	        <p class="card-text">추가 하셈</p>
	        <a href="<%=request.getContextPath()%>wishList.jsp" class="btn btn-primary">버튼도 추가</a>
	      </div>
	    </div>
	  </div> --%>
	</div>
</div>
<%@ include file="../user/usbottom.jsp" %>