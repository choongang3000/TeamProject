<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp" %>
<style>
	table{
		width:1200px;
		align:center;
		text-align:center;
	}
</style>
<center>
<br>
<h2>강의 상세보기</h2>
<br>

<br>
<table border="1" align="center" class="table table-bordered border-secondary" style="width:1200px">
	<tr>
		<th width="150" height="50">강의번호</th>
		<td>${course.conum }</td>
		<th width="150" height="50">강의명</th>
		<td>${course.coname }</td>
	</tr>
	<tr>
		<th width="150" height="50">담당선생님</th>
		<td>${course.coteacher }</td>
		<th width="150" height="50">과목</th>
		<td>${course.cosubject }</td>
	</tr>
	<tr>
		<th width="150" height="300">강의이미지</th>
		<td colspan="3">
			<img src="<%=request.getContextPath() %>/resources/images/${course.coimage}">
		</td>
	</tr>
	<tr>
		<th width="150" height="300">강의영상</th>
		<td colspan="3">
			<br>
			<video
				src="<%=request.getContextPath() %>/resources/images/강의동영상1.mp4"
				poster="<%=request.getContextPath()%>/resources/images/로고짤.gif"
				width="500"
				controls autoplay>
			</video>
			<br>
		</td>
	</tr>
	<tr>
		<th width="150" height="50">강의소개</th>
		<td colspan="3">${course.cocontent }</td>
	</tr>
	<tr>
		<th width="150" height="50">강의가격</th>
		<td><fmt:formatNumber value="${course.coprice }" pattern="###,###"/>원</td>
		<th width="150" height="50">업로드날짜</th>
		<fmt:parseDate var="coupload_date" value="${course.coupload_date }" pattern="yyyy-MM-dd"/>
		<td><fmt:formatDate value="${coupload_date }" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>
<br>
<table style="width:60%">
	<tr>
		<td align=right>
			<%-- <input type="button" value="돌아가기" onClick="location.href='tcCourseList.mem?pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}'" >
		 --%>
		 	<input type="button" value="돌아가기" onClick="history.back()" >
		</td>
	</tr>
</table>
</center>
<%@ include file="../user/usbottom.jsp" %>