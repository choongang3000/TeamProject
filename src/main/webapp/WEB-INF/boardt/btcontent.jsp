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
		border : thin;
		border-color: black;
	}
	
	#b-update{
    	border-radius : 3px;
    	border : 1px solid blue;
    	background-color: blue;
    	color: white;
    	height: 32px;
    	width: 80px;
    }
    #b-delete{
    	border-radius : 3px;
    	border : 1px solid red;
    	background-color: red;
    	color: white;
    	height: 32px;
    	width: 80px;
    }
    #b-list{
    	border-radius : 3px;
    	border : 1px solid gray;
    	background-color: gray;
    	color: white;
    	height: 32px;
    	width: 80px;
    }
</style>

<br><br><br><br>
<center>
	<table border="1" width="700">
		<tr height="50">
			<td>
				게시 번호
			</td>
			<td>
				${bt.num }
			</td>
		</tr>
		<tr height="50">
			<td>
				과목
			</td>	
			<td>
				${bt.subject } 
			</td>	
		</tr>
		<tr  height="50">
			<td>
				문제 이미지
			</td>
			<td>
				<img src="<%=request.getContextPath() %>/resources/images/${bt.examfile}" width=500 height=200>
			</td>
		</tr>
		<tr  height="50">
			<td>
			    문제 답
			</td>
			<td>
				${bt.answer }
			</td>
		</tr>
		<tr height="50">
			<td>
			    기본 퀴즈 이미지 
			</td>
			<td colspan="2">
				<img src="<%=request.getContextPath() %>/resources/images/${bt.quizimg}" width=150 height=150>
			</td>
		</tr>
		<tr  height="50">
			<td>
			    기본 정답 이미지
			</td>
			<td>
				<img src="<%=request.getContextPath() %>/resources/images/${bt.movingimg}" width=150 height=150>
			</td>
		</tr>
		<tr  height="50">
			<td colspan="2">
				<input id="b-update" type="submit" value="글수정" onClick="location.href='update.bt?num=${bt.num}&pageNumber=${pageNumber}'">
				<input id="b-delete" type="button" value="글삭제" onClick="location.href='delete.bt?num=${bt.num}&pageNumber=${pageNumber}'">
				<input id="b-list"type="button" value="글목록" onClick="location.href='list.bt?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</center>    
<br><br><br>
<%@include file="../user/usbottom.jsp"%>