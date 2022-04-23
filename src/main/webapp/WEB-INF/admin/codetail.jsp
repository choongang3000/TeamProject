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
		margin:auto;
		align:center;
		text-align:center;
	}
	table{
		text-align:center;
		align:center;
	}
	/* img{
		width:20%;
		height:20%;
	} */
</style>

<center>
<h2><b>강의 정보</b></h2>

<br>
<table class="table" align="center" border=1 style="width:1200px">
	<tr>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">강의번호</th>
		<td  style="vertical-align: middle;">${cobean.conum }</td>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">강의명</th>
		<td  style="vertical-align: middle;">${cobean.coname }</td>
	</tr>    
	<tr>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">담당선생님</th>
		<td style="vertical-align: middle;">${cobean.coteacher }</td>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">과목</th>
		<td style="vertical-align: middle;">${cobean.cosubject }</td>
	</tr>
	<tr>
		<th width="150" height="150" style="background: lightgray; text-align: center; vertical-align: middle;">강의이미지</th>
		<td colspan="3" style="vertical-align: middle;">
			<img src="<%=request.getContextPath() %>/resources/images/${cobean.coimage}"  width=200px>
		</td>
	</tr>
	<tr>
		<th width="150" height="300" style="background: lightgray; text-align: center; vertical-align: middle;">강의영상</th>
		<td colspan="3" style="vertical-align: middle;">
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
	<tr>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">강의소개</th>
		<td colspan="3" style="vertical-align: middle;">${cobean.cocontent }</td>
	</tr>
	<tr>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">강의가격</th>
		<td style="vertical-align: middle;"><fmt:formatNumber value="${cobean.coprice }" pattern="###,###"/></td>
		<th width="150" height="50" style="background: lightgray; text-align: center; vertical-align: middle;">업로드날짜</th>
		<td style="vertical-align: middle;"><fmt:formatDate value="${cobean.coupload_date }" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>
<br>

<input type="button" value="이전화면" class="btn btn-secondary" onClick="history.back()">
<input type="button" value="수정" class="btn btn-primary" onClick="upd()">
<input type="button" value="삭제" class="btn btn-outline-danger" onClick="del()">
</center>
<br>
<%@ include file="../admin/adbottom.jsp" %>