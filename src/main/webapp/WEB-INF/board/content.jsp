<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
content.jsp<br>

<style type="text/css">
	body{
		text-align:center;
	}
	table{
		margin:auto;
		width:500px;
	}
</style>


<%@ include file="color.jsp" %> <!-- include 지시어 : 내용을 복붙 -->
<body bgcolor="<%= bodyback_c %>">

<b>글내용 보기</b>
<table border="1">
	<tr>
		<td align="center">
			글번호
		</td>
		<td align="center">
			${bb.num }
		</td>
		<td align="center">
			조회수
		</td>
		<td align="center">
			${bb.readcount }
		</td>
	</tr>
	<tr  align="center">
		<td align="center">
			작성자
		</td>
		<td align="center">
			${bb.writer }
		</td>
		<td align="center">
			작성일
		</td>	
		<td align="center">
			<fmt:formatDate value="${bb.reg_date }" pattern="yyyy/MM/dd HH:mm" type="both"/>
		</td>	
	</tr>
	<tr>
		<td align="center">
			글제목
		</td>	
		<td colspan="3" align="center">
			${bb.subject }
		</td>	
	</tr>
	<tr height="100">
		<td>
			글내용
		</td>	
		<td colspan="3" align="center">
			${bb.content }
		</td>
	</tr>
	<tr align="center">
		<td colspan="4">
			<input type="submit" value="글수정" onClick="location.href='update.bod?num=${bb.num}&pageNumber=${pageNumber}'">
			<input type="button" value="글삭제" onClick="location.href='delete.bod?num=${bb.num}&pageNumber=${pageNumber}'">
			<input type="button" value="답글쓰기" onClick="location.href='reply.bod?ref=${bb.ref }&re_step=${bb.re_step}&re_level=${bb.re_level}&pageNumber=${pageNumber}'">
			<input type="button" value="글목록" onClick="location.href='list.bod?pageNumber=${pageNumber}'">
		</td>
	</tr>
</table>