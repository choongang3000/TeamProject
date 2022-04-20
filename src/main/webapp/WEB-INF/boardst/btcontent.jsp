<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="bttop.jsp"%>
<!--
BTContent.jsp => /content.bt 요청 => BTDetailController
-->
<style>

	tr,td{
		text-align:center;
	} 
	table{
		background: #E4F2FF;
	}
</style>

<br><br><br><br>
<center>
	<table border="1" width="700">
		<tr>
			<td>
				게시 번호
			</td>
			<td>
				${bt.num }
			</td>
		</tr>
		<tr>
			<td>
				과목
			</td>	
			<td>
				${bt.subject } 
			</td>	
		</tr>
		<tr>
			<td>
				문제 이미지
			</td>
			<td>
				<img src="<%=request.getContextPath() %>/resources/images/${bt.examfile}" width=500 height=200>
			</td>
		</tr>
		<tr height="40">
			<td>
			    문제 답
			</td>
			<td>
				${bt.answer }
			</td>
		</tr>
		<tr height="40">
			<td>
			    기본 퀴즈 이미지 
			</td>
			<td colspan="2">
				<img src="<%=request.getContextPath() %>/resources/images/${bt.quizimg}" width=150 height=150>
			</td>
		</tr>
		<tr height="40">
			<td>
			    기본 정답 이미지
			</td>
			<td>
				<img src="<%=request.getContextPath() %>/resources/images/${bt.movingimg}" width=150 height=150>
			</td>
		</tr>
		<tr height="40">
			<td colspan="2">
				<input type="submit" value="글수정" onClick="location.href='update.bt?num=${bt.num}&pageNumber=${pageNumber}'">
				<input type="button" value="글삭제" onClick="location.href='delete.bt?num=${bt.num}&pageNumber=${pageNumber}'">
				<input type="button" value="글목록" onClick="location.href='list.bt?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</center>    
<br><br><br>
<%@include file="../user/usbottom.jsp"%>