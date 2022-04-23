<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<c:choose>
	<c:when test="${sessionScope.loginInfo.type eq 'admin' }">
		<%@ include file="../admin/adtop.jsp" %>
	</c:when>
	<c:otherwise>
		<%@ include file="../user/ustop.jsp"%>
	</c:otherwise>
</c:choose>

<style>
	table{
		margin:auto;
		width:1200px;
		text-align:center;
	}
</style>

<%--<%@ include file="color.jsp" %> --%>
<center>
<div class="container">
<br>
<h2 align="center">Q&A 문의글 수정</h2>
<br>
<table width="60%">
	<!-- <tr>
		<td colspan="4" align="center">글내용 보기</td>
	</tr> -->
	<tr height="40" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">
			글번호
		</td>
		<td align="center">
			${bb.num }
		</td>
		<td align="center" bgcolor="#DCDCDC">
			조회수
		</td>
		<td align="center">
			${bb.readcount }
		</td>
	</tr>
	<tr height="40" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">
			작성자
		</td>
		<td align="center">
			${bb.writer }
		</td>
		<td align="center" bgcolor="#DCDCDC">
			작성일
		</td>	
		<td align="center">
			<fmt:formatDate value="${bb.reg_date }" pattern="yyyy/MM/dd HH:mm" type="both"/>
		</td>	
	</tr>
	<tr height="40" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">
			글제목
		</td>	
		<td colspan="3" align="center">
			${bb.subject }
		</td>	
	</tr>
	<tr height="300" style="border-top: solid black 1px">
		<td bgcolor="#DCDCDC">
			글내용
		</td>	
		<td colspan="3" align="center">
			${bb.content }
		</td>
	</tr>
	<tr align="center" height="50" style="border-top: solid black 1px">
		<td colspan="4">
			<br>
			<c:if test="${loginInfo.aname == bb.writer || loginInfo.type == 'admin' }">
				<input type="submit" value="글수정" class="btn btn-info" onClick="location.href='update.bod?num=${bb.num}&pageNumber=${pageNumber}'">
				<input type="button" value="글삭제" class="btn btn-secondary" onClick="location.href='delete.bod?num=${bb.num}&pageNumber=${pageNumber}'">
			</c:if>
			<c:if test="${sessionScope.loginInfo.type eq 'admin' }">
				<input type="button" value="답변하기" class="btn btn-info" onClick="location.href='reply.bod?ref=${bb.ref }&re_step=${bb.re_step}&re_level=${bb.re_level}&pageNumber=${pageNumber}'">
			</c:if>
			<input type="button" value="글목록" class="btn btn-secondary" onClick="location.href='list.bod?pageNumber=${pageNumber}'">
		</td>
	</tr>
</table>
</div>
</center>

<c:choose>
	<c:when test="${sessionScope.loginInfo.type eq 'admin' }">
		<%@ include file="../admin/adbottom.jsp" %> 
	</c:when>
	<c:otherwise>
		<%@ include file="../user/usbottom.jsp"%>
	</c:otherwise>
</c:choose>