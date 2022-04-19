<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp" %>
<center>
<table style="width:60%">
	<tr>
		<td align=right>
			<input type="button" value="돌아가기" onClick="location.href='tcCourseList.mem?pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}'" >
		</td>
	</tr>
</table>
<table border="1" align="center" width="70%" class="table table-bordered border-secondary" style="width:60%">
	<tr>
		<td width="150" height="50">강의번호</td>
		<td>${course.conum }</td>
		<td width="150" height="50">강의명</td>
		<td>${course.coname }</td>
	</tr>
	<tr>
		<td width="150" height="50">담당선생님</td>
		<td>${course.coteacher }</td>
		<td width="150" height="50">과목</td>
		<td>${course.cosubject }</td>
	</tr>
	<tr>
		<td width="150" height="300">강의이미지</td>
		<td colspan="3">
			<img src="<%=request.getContextPath() %>/resources/images/${course.coimage}">
		</td>
	</tr>
	<tr>
		<td width="150" height="300">강의영상</td>
		<td colspan="3">
			<br>
			<video
				src="<%=request.getContextPath() %>/resources/${course.covideo}"
				poster="<%=request.getContextPath()%>/resources/${course.covideo}"
				width="500"
				controls autoplay>
			</video>
			<br>
		</td>
	</tr>
	<tr>
		<td width="150" height="50">강의소개</td>
		<td colspan="3">${course.cocontent }</td>
	</tr>
	<tr>
		<td width="150" height="50">강의가격</td>
		<td><fmt:formatNumber value="${course.coprice }" pattern="###,###"/>원</td>
		<td width="150" height="50">업로드날짜</td>
		<fmt:parseDate var="coupload_date" value="${course.coupload_date }" pattern="yyyy-MM-dd"/>
		<td><fmt:formatDate value="${coupload_date }" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>
</center>
<%@ include file="../user/usbottom.jsp" %>