<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../admin/adtop.jsp" %>
<style type="text/css">

.err {
	color: red;
	font-weight: bold;
}

#container{
		width:1200px;
		margin:auto;
	}
	
</style>
<center>
<br><h2>질문 입력</h2><br>
</center>
<div id="container">
</div>
<div id="container">
	<form:form commandName="BABean" action="insert.ba" method="post" enctype="multipart/form-data">
		<label for="exampleFormControlInput1" class="form-label">카테고리</label>
		<select name="bacategory" class="form-select" aria-label="Default select example">
  			<option value="">카테고리 선택</option>
			<option value="회원">회원</option>
			<option value="클래스이용">클래스 이용</option>
			<option value="학습">학습</option>
			<option value="강좌관리">강좌 관리</option>
			<option value="기타">기타</option>
		</select>
		<br>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">질문</label> 
			<input type="text" name="basubject" class="form-control" id="exampleFormControlInput1" required>
		</div>
		<br>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">답변</label>
			<textarea class="form-control" name="bacontent" id="exampleFormControlTextarea1" rows="3" required style="resize:none"></textarea>
		</div>
		<input class="form-control" id="formFile" type="file" name="upload" value="파일선택">
		<br>
		<center><button type="submit" class="btn btn-primary btn-md">작성하기</button></center>
	</form:form>
</div>
<%@ include file="../admin/adbottom.jsp" %>