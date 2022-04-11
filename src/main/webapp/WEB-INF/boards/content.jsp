<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
   <!--  content.jsp<br> -->
    <style type="text/css">
	body{
		text-align:center;
	}
	table{
		margin:auto;
		width:800px;
	}
	img{
		width:300px;
	}
</style>

<br><br>
<h3>수강후기</h3>
<br>
<table width="60%">
	<tr height="40" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">
			글번호
		</td>
		<td align="center">
			${bb.num } <!-- 글번호 -->
		</td>
		<td align="center" bgcolor="#DCDCDC">
			조회수
		</td>
		<td align="center">
			${bb.readcount } <!-- 조회수 -->
		</td>
	</tr>
	
	<tr height="40" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">
			작성자
		</td>
		<td align="center">
			${bb.writer } <!-- 작성자 -->
		</td>
		<td align="center" bgcolor="#DCDCDC">
			작성일 
		</td>	
		<td align="center">
			<fmt:formatDate value="${bb.reg_date }" pattern="yyyy/MM/dd HH:mm" type="both"/> <!-- 작성일 -->
		</td>	
	</tr>

	<tr height="40" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">
			글제목
		</td>	
		<td colspan="3" align="center">
			${bb.subject } <!-- 글제목 -->
		</td>	
	</tr>
	
	<tr height="400" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">
			이미지
		</td>
		<td colspan="3" align="center">
			<c:if test='${imageName != null }'>
				<img src="<%=request.getContextPath() %>/resources/${imageName}"> <!-- 이미지 -->
			</c:if>
			<c:if test='${imageName == null }'>
				이미지 없음
			</c:if>
		</td>
	</tr>
	
	<tr height="300" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC"> 
			글내용
		</td>	
		<td colspan="3" align="center">
			${bb.content } <!-- 글내용 -->
		</td>
	</tr>
	<tr align="center" height="50" style="border-top: solid black 1px">
		<td colspan="4">
			<input class="btn btn-secondary btn-sm" type="submit" value="글수정" onClick="location.href='update.bs?num=${bb.num}&pageNumber=${pageNumber}'">
			<input class="btn btn-secondary btn-sm" type="button" value="글삭제" onClick="location.href='delete.bs?num=${bb.num}&pageNumber=${pageNumber}'">
			<input class="btn btn-secondary btn-sm" type="button" value="답글쓰기" onClick="location.href='reply.bs?ref=${bb.ref}&re_step=${bb.re_step}&re_level=${bb.re_level}&pageNumber=${pageNumber}'">
			<input class="btn btn-secondary btn-sm" type="button" value="글목록" onClick="location.href='list.bs?pageNumber=${pageNumber}'">
		</td>
	</tr>
</table>
<%@ include file="../admin/adbottom.jsp" %>     

    