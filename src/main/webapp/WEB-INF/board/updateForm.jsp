<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/check.js"></script>


<center>
<form method="post" action="update.bod?pageNumber=${pageNumber}" onsubmit="return check()">
	<table border="1">
		<input type="hidden" name="num" value="${bb.num}">
		<tr>
			<td colspan="2" align="right">
				<a href="list.bod?pageNumber=${pageNumber }">글목록</a>
			</td>
		</tr>
		<tr>
			<td align="center">이 름</td>
			<td><input type="text" name="writer" value="${bb.writer}"></td>
		</tr>
		<tr>
			<td align="center">제 목</td>
			<td><input type="text" name="subject" value="${bb.subject}"></td>
		</tr>
		<tr>
			<td align="center">Email</td>
			<td><input type="text" name="email" value="${bb.email}"></td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td><textarea name="content" rows="15" cols="50">${bb.content}</textarea></td>
		</tr>
		<tr>
			<td align="center">비밀번호</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정완료">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onClick="location.href='list.bod?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form>
</center>