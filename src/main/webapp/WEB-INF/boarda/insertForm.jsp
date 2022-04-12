<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<style type="text/css">
.err {
	color: red;
	font-weight: bold;
}
</style>

<h2>질문 입력</h2>

<form:form commandName="BABean" action="insert.ba" method="post"
	enctype="multipart/form-data">
	
	*질문 <input type="text" name="basubject">
	<form:errors cssClass="err" path="basubject" />
	<br>
	답변 <input type="text" name="bacontent">
	<form:errors cssClass="err" path="bacontent" />
	<br>
	<input class="form-control" id="formFile" type="file" name="upload" value="파일선택">
	<br>
	카테고리
	<select name="bacategory">
		<option selected>카테고리 선택</option>
		<option value="회원">회원</option>
		<option value="클래스 이용">클래스 이용</option>
		<option value="학습">학습</option>
	</select>
	<form:errors cssClass="err" path="bacategory" />
	<br>
	<input type="submit" value="추가하기">
</form:form>