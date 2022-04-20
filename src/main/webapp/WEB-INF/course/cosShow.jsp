<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp" %>

<script type="text/javascript">
	function gotolist(){
		location.href = "list.cos";

	}
</script>

<br>
<center>

<br>

	<div> <!-- 강의이름&선생님 -->
		<h2>${course.coteacher}의 ${course.coname }</h2>
	</div>
	
	<br>
	
	<div> <!-- 강의영상출력 -->
		<video
				src="<%=request.getContextPath() %>/resources/images/${course.covideo}"
				poster="<%=request.getContextPath()%>/resources/images/온강 로고.png"
				width="800"
				controls>
		</video>
	</div>
	
	<br>
	
	<div>
		<input type="button" value="뒤로가기" onClick="history.back();">
		<input type="button" value="강의목록" onClick="gotolist()">
	</div>

</center>
<br>
<hr>
<%@ include file="../user/usbottom.jsp" %>


<%-- 
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
 --%>
