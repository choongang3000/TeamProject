<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
boardst/boardst_insertForm.jsp<br>
 &nbsp;
<center>
	<form action="insert.bst" method="post" enctype="multipart/form-data">
	<input type="hidden" name="stuid" value="kim"> <!-- 추가 수정필요 -->
	<table class="table table-striped" style="width:60%" border=1>
		<tr>
			<td>
				<select name="subject" class="form-select" style="width:15%; display: inline;"> <!-- 추가 수정필요 -->
					<option value="">과목 선택</option>
					<option value="국어">국어</option>
					<option value="영어">영어</option>
					<option value="수학">수학</option>
					<option value="과학">과학</option>
					<option value="사회">사회</option>
				</select>
				&nbsp;
				<select name="teacher" class="form-select" style="width:15%;  display: inline;"> <!-- 추가 수정필요 -->
					<option value="">선생님 선택</option>
					<option value="아이유">아이유</option>
				</select>
				<input type="text" class="form-control" name="title" placeholder="제목 입력" style="width:100%; display:inline; margin-top:10px;">
			</td>
		</tr>
		<tr>
			<td>
				<div class="form-floating">
					<textarea class="form-control" id="floatingTextarea2" name="content" style="height: 300px; width:100% ; resize: none;"></textarea>
					<label for="floatingTextarea2">질문 작성</label>
					<br>
					<p>
						<input class="form-control" type="file" name="upload">
					</p>
				</div>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" class="btn btn-secondary btn-sm" value="질문 등록"> 
				&nbsp;
				<input type="button" class="btn btn-secondary btn-sm" value="취소" onClick="location.href='list.bst?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
	</form>
</center>
<%@ include file="bottom.jsp" %>