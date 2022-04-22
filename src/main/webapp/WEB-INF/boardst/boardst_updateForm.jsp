<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp" %>
<br>
<center>
	<form action="update.bst" method="post"  enctype="multipart/form-data">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
	<input type="hidden" name="num" value="${board.num }">
	<table border=1 class="table table-striped" style="width:60%">
		<tr>
			<td>
				<select name="subject" class="form-select" style="width:15%; display: inline;" required> <!-- 추가 수정필요 -->
					<option value="">과목 선택</option>
					<c:forEach var="sub" items="${subArr }">
					<option value="${sub }" <c:if test="${board.subject == sub }">selected</c:if>>${sub }</option>
					</c:forEach>					
				</select>
				&nbsp;
				<select name="teacher" class="form-select" style="width:15%;  display: inline;" required> <!-- 추가 수정필요 -->
					<option value="">선생님 선택</option>
					<c:forEach var="tc" items="${teacherArr}">
					<option value="${tc }" <c:if test="${board.teacher == tc }">selected</c:if>>${tc }</option>
					</c:forEach>
				</select>
				<input type="text" class="form-control" name="title" placeholder="제목 입력" value="${board.title }" style="width:100%; display:inline; margin-top:10px;" required>
			</td>
		</tr>
		<tr>
			<td>
				<div class="form-floating">
				  <textarea class="form-control" id="floatingTextarea" style="height: 300px; width:100%; resize: none;" name="content" required>${board.content }</textarea>
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
				<input type="submit" class="btn btn-primary btn-sm" value="수정 완료"> 
				&nbsp;
				<input type="button" class="btn btn-secondary btn-sm" value="취소" onClick="location.href='detail.bst?pageNumber=${pageNumber}&num=${board.num }'">
			</td>
		</tr>
	</table>
	</form>
</center>
<%@ include file="../user/usbottom.jsp" %>