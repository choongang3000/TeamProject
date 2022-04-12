<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<style type="text/css">
.err {
	color: red;
	font-weight: bold;
}
</style>
<%
	String[] cateArr = {"자주 찾는 질문","회원","클래스 이용","학습","수업 개설/관리","학습 관리","강좌 관리","기타"};

%> 

<form:form commandName="ba" action="update.ba?pageNumber=${pageNumber }" method="post">
<h2>질문 수정(페이지:${pageNumber} 글번호:${ba.banum} )</h2>
	<input type="hidden" name="banum" value="${ba.banum}">
	<p>
	<label>*카테고리</label>
	<select name="bacategory">
		<option value="">선택하세요
		<c:set var="cateArr" value="<%= cateArr %>"/>
		<c:forEach var="bacategory" items="${cateArr}">
			<option value="${bacategory }" <c:if test="${ba.bacategory == bacategory }"> selected </c:if> >${bacategory }
		</c:forEach>
	</select>
	<form:errors cssClass="err" path="bacategory"/>
	</p>
	<p>
		*질문 <input type="text" name="basubject" value="${ba.basubject }"> 
		<form:errors cssClass="err" path="basubject" />
	</p>
	<p>
		*답변 <input type="text" name="bacontent" value="${ba.bacontent }"> 
		<form:errors cssClass="err" path="bacontent" />
	</p>
	<p>
		<input class="form-control" id="formFile" type="file" name="upload" value="${ba.baimage }">
	</p>
	<input type="submit" value="추가하기">
</form:form>
