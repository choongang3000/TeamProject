<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp" %>
<br>
<center>
<table border=1>
	<tr>
		<th>${course.coname }</th>
	</tr>
	<tr>
		<th>${course.covideo }</th>
	</tr>
	<tr>
		<td>
			<video
				src="<%=request.getContextPath() %>/resources/images/${course.covideo}"
				poster="<%=request.getContextPath()%>/resources/images/${course.covideo}"
				width="800"
				controls autoplay>
			</video>
		</td>
	</tr>
</table>
</center>
<br>
<%@ include file="../user/usbottom.jsp" %>