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
<br>
<h2><b>강의 상세보기</b></h2>
<br>

<br>
<table border="1" align="center" class="table" style="width:1200px">
	<tr>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">강의번호</th>
		<td style="vertical-align: middle;">${course.conum }</td>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">강의명</th>
		<td style="vertical-align: middle;">${course.coname }</td>
	</tr>
	<tr>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">담당선생님</th>
		<td style="vertical-align: middle;">${course.coteacher }</td>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">과목</th>
		<td style="vertical-align: middle;">${course.cosubject }</td>
	</tr>
	<tr>
		<th width="150" height="300" style="background: lightgray; text-align: center; vertical-align: middle;">강의이미지</th>
		<td colspan="3" style="vertical-align: middle;">
			<img src="<%=request.getContextPath() %>/resources/images/${course.coimage}" width=200px>
		</td>
	</tr>
	<tr>
		<th width="150" height="300" style="background: lightgray; text-align: center; vertical-align: middle;">강의영상</th>
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
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">강의소개</th>
		<td colspan="3" style="vertical-align: middle;">${course.cocontent }</td>
	</tr>
	<tr>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">강의가격</th>
		<td style="vertical-align: middle;"><fmt:formatNumber value="${course.coprice }" pattern="###,###"/>원</td>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">업로드날짜</th>
		<fmt:parseDate var="coupload_date" value="${course.coupload_date }" pattern="yyyy-MM-dd"/>
		<td style="vertical-align: middle;"><fmt:formatDate value="${coupload_date }" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>
<br>
<table style="width:60%">
	<tr>
		<td align=center>
			<%-- <input type="button" value="돌아가기" onClick="location.href='tcCourseList.mem?pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}'" >
		 --%>
		 	<input type="button" class="btn btn-secondary" value="돌아가기" onClick="history.back()" >
		</td>
	</tr>
</table>
</center>
<%@ include file="../user/usbottom.jsp" %>