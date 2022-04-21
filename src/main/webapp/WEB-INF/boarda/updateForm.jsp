<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%-- <%@ include file="../fix/ad_top.jsp"%> --%>
<%@ include file="../admin/adtop.jsp" %>

<style type="text/css">
.err {
	color: red;
	font-weight: bold;
}

#container {
	width: 1200px;
	margin: auto;
}

</style>

<center>
<br><h3>고객센터 QnA 수정</h3><br>
</center>
<div id="container">
	<form:form class="needs-validation" action="update.ba" method="post" commandName="babean">
		<label for="exampleFormControlInput1" class="form-label">카테고리</label>
		<select name="bacategory" class="form-select" aria-label="Default select example" id="exampleFormControlTextarea1">
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
			<input type="text" name="basubject" class="form-control" id="exampleFormControlInput1" value="${babean.basubject }" required>
		</div>
		<br>
		
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">답변</label>
			<textarea class="form-control" name="bacontent" id="exampleFormControlTextarea1" rows="3" required style="resize:none">${babean.bacontent }</textarea>
		</div>
		
		<center><button type="submit" class="btn btn-primary btn-md" style="margin: auto">수정</button></center>
	</form:form>
</div>
