<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
   <!--  deleteForm.jsp<br> -->

<center>
<br><br>
<h2 align="center">비밀번호 입력</h2>
<br>
<form method="post" action="delete.bs?num=${num }">
	<input type="hidden" name="pageNumber" value="${pageNumber}">
	<table border="0" width="60%">
		<!-- <tr>
			<td>비밀번호를 입력하세요</td>
		</tr> -->
		<tr>
			<td align="center" bgcolor="#DCDCDC">
			<br>
				<div><b>삭제하실 글의 비밀번호를 입력해주세요.</b></div> <br>
			</td>
		</tr>
		<tr>
			<td>
				<br>
				<input type="password" name="passwd" class="form-control" id="floatingPassword" placeholder="비밀번호">
				<br>
			</td>
		</tr>
		<tr>
			<td align="center">
			<br>
				<input class="btn btn-secondary btn-sm" type="submit" value="글삭제">
				<input class="btn btn-secondary btn-sm" type="button" value="글목록" onClick="location.href='list.bs?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form>    
</center>
<%@ include file="../admin/adbottom.jsp" %> 