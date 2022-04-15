<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../fix/ad_top.jsp"%>
<style type="text/css">
.err {
	color: red;
	font-weight: bold;
}

#container {
	width: 65%;
	margin: auto;
}
</style>
<div id="container">
	<form:form class="needs-validation" action="update.ba" method="post" commandName="babean">
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
			<input type="text" name="basubject" class="form-control" id="exampleFormControlInput1" value="${babean.basubject }" required>
		</div>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">답변</label>
			<textarea class="form-control" name="bacontent" id="exampleFormControlTextarea1" rows="3" required>${babean.bacontent }</textarea>
		</div>
		<button type="submit" class="btn btn-primary btn-sm">수정</button>
	</form:form>
</div>