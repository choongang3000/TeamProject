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
		width:80%;
		margin:auto;
		align:center;
		text-align:center;
	}
	table{
		text-align:center;
		align:center;
	}
	img{
		width:20%;
		height:20%;
	}
</style>

<center>
<h2>강의 정보</h2>

<br>
<table border="0" align="center" width="80%">
	<tr style="border: 1px solid black">
		<th width="150" height="50" bgcolor="#DCDCDC">강의번호</th>
		<td>${cobean.conum }</td>
		<th width="150" height="50" bgcolor="#DCDCDC">강의명</th>
		<td>${cobean.coname }</td>
	</tr>    
	<tr style="border: 1px solid black">
		<th width="150" height="50" bgcolor="#DCDCDC">담당선생님</th>
		<td>${cobean.coteacher }</td>
		<th width="150" height="50" bgcolor="#DCDCDC">과목</th>
		<td>${cobean.cosubject }</td>
	</tr>
	<tr style="border: 1px solid black">
		<th width="150" height="150" bgcolor="#DCDCDC">강의이미지</th>
		<td colspan="3">
			<img src="<%=request.getContextPath() %>/resources/images/${cobean.coimage}">
		</td>
	</tr>
	<tr style="border: 1px solid black">
		<th width="150" height="300" bgcolor="#DCDCDC">강의영상</th>
		<td colspan="3">
			<br>
			<video
				src="<%=request.getContextPath() %>/resources/images/${cobean.covideo}"
				poster="<%=request.getContextPath()%>/resources/images/로고짤.gif"
				width="500" height="282"
				controls autoplay>
			</video>
			<br>
		</td>
	</tr>
	<tr style="border: 1px solid black">
		<th width="150" height="50" bgcolor="#DCDCDC">강의소개</th>
		<td colspan="3">${cobean.cocontent }</td>
	</tr>
	<tr style="border: 1px solid black">
		<th width="150" height="50" bgcolor="#DCDCDC">강의가격</th>
		<td><fmt:formatNumber value="${cobean.coprice }" pattern="###,###"/></td>
		<th width="150" height="50" bgcolor="#DCDCDC">업로드날짜</th>
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