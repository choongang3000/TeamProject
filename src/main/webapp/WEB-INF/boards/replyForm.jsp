<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<%@ include file="../admin/adtop.jsp" %>
<style type="text/css" >
	body{
		text-align:center;
	}
	table{
		margin:auto;
	}
	.err{
		color:red;
		font-weight: bold;
	}
</style>
<!-- replyForm.jsp<br> -->
<br><br>
<h2 align="center">수강후기 답변</h2>
<br>
<form:form commandName="BSBean" method="post" action="reply.bs?pageNumber=${pageNumber}" enctype="multipart/form-data">
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="re_step" value="${re_step}">
	<input type="hidden" name="re_level" value="${re_level}">
	<%
	System.out.println("ref:"+ request.getParameter("ref"));
	System.out.println("re_step:"+ request.getParameter("re_step"));
	System.out.println("re_level:"+ request.getParameter("re_level"));
	%>
	<table border="0" width="40%" height="60%">
		<!-- <tr>
			<td colspan="2" align="right">
				<a href="list.bs">글목록</a>
			</td>
		</tr> -->
		<tr>
			<td align="center" bgcolor="#DCDCDC" width="100">이름</td>
			<td>
				<input type="text" name="writer" class="form-control" id="floatingInput" placeholder="작성자를 입력해주세요">
				<form:errors cssClass="err" path="writer"/>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">제목</td>
			<td>
				<input type="text" name="subject" value="[답글]" class="form-control" id="floatingInput" placeholder="답글제목을 입력해주세요">
				<form:errors cssClass="err" path="subject"/>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">Email</td>
			<td><input type="text" name="email" class="form-control" id="floatingInput" placeholder="이메일을 입력해주세요"></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">이미지</td>
			<td><input class="form-control" id="formFile" type="file" name="upload" value="파일선택"></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">내용</td>
			<td>
				<textarea name="content" rows="15" cols="50" class="form-control" placeholder="내용을 입력해주세요" id="floatingTextarea" style="resize:none;"></textarea>
				<form:errors cssClass="err" path="content"/>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">비밀번호</td>
			<td>
				<input type="password" name="passwd" class="form-control" id="floatingPassword" placeholder="비밀번호 입력해주세요">
				<form:errors cssClass="err" path="passwd"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input class="btn btn-secondary btn-sm" type="submit" value="답글쓰기">
				<input class="btn btn-secondary btn-sm" type="reset" value="다시작성">
				<input class="btn btn-secondary btn-sm" type="button" value="목록보기" onClick="location.href='list.bs?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form:form>
<%@ include file="../admin/adbottom.jsp" %>     
