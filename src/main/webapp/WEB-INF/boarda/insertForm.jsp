<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../fix/ad_top.jsp"%>
<style type="text/css">

.err {
	color: red;
	font-weight: bold;
}

#container{
		width:65%;
		margin:auto;
	}
	
</style>
<div id="container">
<h2>질문 입력</h2>

</div>
<div id="container">
	<form:form commandName="BABean" action="insert.ba" method="post" enctype="multipart/form-data">
		<select name="bacategory" class="form-select" aria-label="Default select example">
  			<option value="">카테고리 선택</option>
			<option value="회원">회원</option>
			<option value="클래스이용">클래스 이용</option>
			<option value="학습">학습</option>
			<option value="강좌관리">강좌 관리</option>
			<option value="기타">기타</option>
		</select>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">질문</label> 
			<input type="text" name="basubject" class="form-control" id="exampleFormControlInput1" required>
		</div>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">답변</label>
			<textarea class="form-control" name="bacontent" id="exampleFormControlTextarea1" rows="3" required></textarea>
		</div>
		<input class="form-control" id="formFile" type="file" name="upload" value="파일선택">
		<button type="submit" class="btn btn-primary btn-sm">작성하기</button>
	</form:form>
</div>