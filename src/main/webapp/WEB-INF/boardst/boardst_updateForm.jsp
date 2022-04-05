<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="top.jsp" %>
boardst/boardst_updateForm.jsp<br>
&nbsp;
<center>
	<form action="update.bst" method="post"  enctype="multipart/form-data">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
	<input type="hidden" name="num" value="${board.num }">
	<table border=1 class="table table-striped" style="width:60%">
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
				<input type="text" class="form-control" name="title" placeholder="제목 입력" value="${board.title }" style="width:100%; display:inline; margin-top:10px;">
			</td>
		</tr>
		<tr>
			<td>
				<div class="form-floating">
				  <textarea class="form-control" id="floatingTextarea" style="height: 300px; width:100%; resize: none;" name="content">${board.content }</textarea>
				  <label for="floatingTextarea">수정할 질문 내용</label>
				  <br>
					<p>
						<input class="form-control" type="file" name="upload">
					</p>
					<p>
					&nbsp;기존 파일 : 
					<c:set var="name_length" value="${fn:length(board.image)}"/>
					<c:set var="fileName" value="${fn:substring(board.image,37,name_length)}"/>
					${fileName }
					</p>
				</div>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" class="btn btn-secondary btn-sm" value="수정 완료"> 
				&nbsp;
				<input type="button" class="btn btn-secondary btn-sm" value="취소" onClick="location.href='detail.bst?pageNumber=${pageNumber}&num=${board.num }'">
			</td>
		</tr>
	</table>
	</form>
</center>
<%@ include file="bottom.jsp" %>