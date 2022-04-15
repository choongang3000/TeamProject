<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp" %>

<style>
	.col-sm-5{
		margin-top: 10px;
		margin-bottom: 20px;
	}
</style>
<div class="row justify-content-center">
  <div class="col-sm-5">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">내 정보 관리</h5>
        <p class="card-text">내 정보 관리, 수정</p>
        <input class="btn btn-secondary" type="button" value="내 정보 관리" onClick="location.href='tcInfo.mem?anum=${loginInfo.anum}'">
      </div>
    </div>
  </div>
  <div class="col-sm-5">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">학생 질문 게시글 관리</h5>
        <p class="card-text">학생 질문 게시글 관리</p>
        <a href="list.bst" class="btn btn-primary">질문 게시글 관리</a>
      </div>
    </div>
  </div>
  <div class="col-sm-5">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">내 강의 목록</h5>
        <p class="card-text">강의 목록</p>
        <a href="<%=request.getContextPath()%>wishList.jsp" class="btn btn-primary">내 강의 목록</a>
      </div>
    </div>
  </div>
  <div class="col-sm-5">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">추가 할거 있음</h5>
        <p class="card-text">추가 하셈</p>
        <a href="<%=request.getContextPath()%>wishList.jsp" class="btn btn-primary">버튼도 추가</a>
      </div>
    </div>
  </div>
</div>
<%@ include file="../user/usbottom.jsp" %>