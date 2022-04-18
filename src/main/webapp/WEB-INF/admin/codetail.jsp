<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
<!-- colist.jsp<br> -->


<script>
	function upd(){
		location.href="coupdate.ad?conum=${cobean.conum }";
	}
	
	function del(){
		location.href="codelete.ad?conum=${cobean.conum }";
	}
</script>

<style>
	body{
		width:70%;
		margin:auto;
	}
	table{
		text-align:center;
	}
	img{
		width:50%;
		height:30%;
	}
</style>

<center>
<h2>강의 정보</h2>

<br>
<table border="0" align="center" width="70%">
	<tr>
		<td width="150" height="50">강의번호</td>
		<td>${cobean.conum }</td>
		<td width="150" height="50">강의명</td>
		<td>${cobean.coname }</td>
	</tr>    
	<tr>
		<td width="150" height="50">담당선생님</td>
		<td>${cobean.coteacher }</td>
		<td width="150" height="50">과목</td>
		<td>${cobean.cosubject }</td>
	</tr>
	<tr>
		<td width="150" height="300">강의이미지</td>
		<td colspan="3">
			<img src="<%=request.getContextPath() %>/resources/${cobean.coimage}">
		</td>
	</tr>
	<tr>
		<td width="150" height="300">강의영상</td>
		<td colspan="3">
			<br>
			<video
				src="<%=request.getContextPath() %>/resources/${cobean.covideo}"
				poster="<%=request.getContextPath()%>/resources/${cobean.covideo}"
				width="500"
				controls autoplay>
			</video>
			<br>
		</td>
	</tr>
	<tr>
		<td width="150" height="50">강의소개</td>
		<td colspan="3">${cobean.cocontent }</td>
	</tr>
	<tr>
		<td width="150" height="50">강의가격</td>
		<td><fmt:formatNumber value="${cobean.coprice }" pattern="###,###"/></td>
		<td width="150" height="50">업로드날짜</td>
		<td><fmt:formatDate value="${cobean.coupload_date }" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>
<br>

<input type="button" value="이전화면" onClick="history.back()">
<input type="button" value="수정" onClick="upd()">
<input type="button" value="삭제" onClick="del()">
</center>
<br>
<%@ include file="../admin/adbottom.jsp" %>