<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../fix/ad_top.jsp"%>
<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">내 정보 관리</h5>
        <p class="card-text">내 정보 관리, 수정</p>
        <input class="btn btn-secondary btn-sm" type="submit" value="내 정보 관리" onClick="location.href='update.ac?anum=${accounts.anum}'">내 정보 관리</a>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">내가 작성한 글 관리</h5>
        <p class="card-text">내가 작성한 글, 댓글 관리</p>
        <a href="boards_list.jsp" class="btn btn-primary">내가 작성한 글 관리</a>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">내 강의 목록</h5>
        <p class="card-text">강의 목록</p>
        <a href="<%=request.getContextPath()%>wishList.jsp" class="btn btn-primary">내 강의 목록</a>
      </div>
    </div>
  </div>
</div>