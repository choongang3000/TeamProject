<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<style>
	.err{
		color:red;
		font-weight:bold;
	}
</style>

<center>
<br><br>
<h2 align="center">수강후기 수정</h2>
<br>
<form:form method="post" action="update.bs?pageNumber=${pageNumber}" commandName="bb">
	<input type="hidden" name="num" value="${bb.num}">
	<table border="0" width="40%" height="60%">
		<tr>
			<td align="center" bgcolor="#DCDCDC" width="100">이름</td>
			<td>
				<input type="text" name="writer" value="${bb.writer}" class="form-control" id="floatingInput" readonly>
				<form:errors path="writer" cssClass="err"></form:errors>		
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">제목</td>
			<td>
				<input type="text" name="subject" value="${bb.subject}" class="form-control" id="floatingInput" placeholder="작성자를 입력해주세요">
				<form:errors path="subject" cssClass="err"></form:errors>				
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">Email</td>
			<td>
				<input type="text" name="email" value="${bb.email}" class="form-control" id="floatingInput" placeholder="작성자를 입력해주세요">		
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">이미지</td>
			<td align="center">
				<c:if test="${bb.image!=null }">
					<img src="<%=request.getContextPath() %>/resources/${bb.image}" width=200 height=400 class="form-control">
				</c:if>
				<c:if test='${bb.image==null}'>
					<input type="text" value="이미지 없음" class="form-control" id="floatingInput" readonly>
				</c:if>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">내용</td>
			<td>
				<textarea name="content" rows="15" cols="50" class="form-control" placeholder="내용을 입력해주세요" id="floatingTextarea" style="resize:none;">${bb.content}</textarea>
				<form:errors path="content" cssClass="err"></form:errors>			
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">비밀번호</td>
			<td>
				<input type="password" name="passwd" class="form-control" id="floatingPassword" placeholder="비밀번호 입력해주세요">
				<form:errors path="passwd" cssClass="err"></form:errors>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<br>
				<input class="btn btn-secondary btn-sm" type="submit" value="수정완료">
				<input class="btn btn-secondary btn-sm" type="reset" value="다시작성">
				<input class="btn btn-secondary btn-sm" type="button" value="목록보기" onClick="location.href='list.bs?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form:form>
</center>