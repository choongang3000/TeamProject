<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="top.jsp" %>
boardst/boardst_updateReplyForm.jsp<br>

<center>
	<table border=1 class="table table-striped" style="width:60%">
		<tr>
			<td align=right colspan=2>
				<input type="button" value="목록으로" class="btn btn-secondary btn-sm" onClick="location.href='list.bst?pageNumber=${pageNumber}'">
			</td>
		</tr>
		<tr>
			<th width=200 class="table-active" style="font-size:medium; text-align:center; ">
				<span class="badge bg-light text-dark">${board.subject}</span> ${board.teacher } 선생님
			</th>
			<td>&nbsp;${board.title }</td>
		</tr>
		<tr>
			<td colspan=2>
				<font size="2">
				질문자 : <span style="font-weight: bold">${board.stuid }</span>&nbsp;&nbsp;&nbsp;
				작성일 : <fmt:formatDate value="${board.write_date }" pattern="yyyy-MM-dd HH:mm" type="both"/>   
				</font>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<div class="form-floating">
					<textarea style="width:100%; height:300px; resize:none;" disabled style="resize: none;">${board.content }</textarea>
				</div>
			</td>
		</tr>
	</table>
	<!-- 답글 테이블 -->
	<form action="updateReply.bst?pageNumber=${pageNumber}" method="post">
	<table style="width:60%; margin-top:50px; border:none;">
	<!--
	  num number primary key,
	  pnum number references board_st(num) on delete cascade,
	  teachid varchar2(15) not null,
	  content varchar2(300) not null,
	  image varchar2(30),
	  repdate date default sysdate
	-->
		<input type="hidden" name="num" value="${reply.num }">
		<input type="hidden" name="pnum" value="${board.num }">
		<tr>
			<td>
				<div class="form-floating">
					<textarea class="form-control" name="content" id="floatingTextarea2" style="height:300px; width:100%; resize:none;">${reply.content }</textarea>
					<label for="floatingTextarea2">답변 수정</label>
				</div>
			</td>
		</tr>
		<tr>
			<td align="center">
				<br>
				<input type="submit" class="btn btn-secondary btn-sm" value="수정 완료">
			</td>	
		</tr>
	</table>
	</form>
	
</center>
<%@ include file="bottom.jsp" %>