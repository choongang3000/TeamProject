<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<c:choose>
	<c:when test="${sessionScope.loginInfo.type eq 'admin' }">
		<%@ include file="../admin/adtop.jsp" %>
	</c:when>
	<c:otherwise>
		<%@ include file="../user/ustop.jsp"%>
	</c:otherwise>
</c:choose>

<style>
	.table{
    	width:1200px;
    	text-align: center;
    }
</style>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/check.js"></script>

<center>
<div class="container">
<br>
<h2 align="center">수강후기 수정</h2>
<br>
<form method="post" action="update.bod?num=${bb.num }&pageNumber=${pageNumber}" onsubmit="return check()">
	<input type="hidden" name="num" value="${bb.num}">
	<table border="0" width="60%">
		<%-- <tr>
			<td colspan="2" align="right">
				<a href="list.bod?pageNumber=${pageNumber }">글목록</a>
			</td>
		</tr> --%>
		<!-- <tr align="center">
		<td colspan="2">글수정</td>
		</tr> -->
		<tr>
			<td align="center" bgcolor="#DCDCDC">이 름</td>
			<td>
				<!-- <input type="text" name="writer" value="${bb.writer}"> -->
				<input type="text" name="writer" value="${bb.writer}" class="form-control" id="floatingInput" readonly>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">제 목</td>
			<td>
				<!-- <input type="text" name="subject" value="${bb.subject}"> -->
				<input type="text" name="subject" value="${bb.subject}" class="form-control" id="floatingInput" placeholder="제목을 입력해주세요" required>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">Email</td>
			<td>
				<!-- <input type="text" name="email" value="${bb.email}"> -->
				<input type="text" name="email" value="${bb.email}" class="form-control" id="floatingInput" placeholder="email을 입력해주세요">
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">내용</td>
			<td>
				<!-- <textarea name="content" rows="15" cols="50">${bb.content}</textarea> -->
				<textarea name="content" rows="15" cols="50" class="form-control" placeholder="내용을 입력해주세요" id="floatingTextarea" style="resize:none;" required>${bb.content}</textarea>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">비밀번호</td>
			<td>
				<!-- <input type="password" name="passwd"> -->
				<input type="password" name="passwd" class="form-control" id="floatingInput" placeholder="비밀번호을 입력해주세요" required>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<br>
				<input type="submit" class="btn btn-primary" value="수정완료">
				<input type="reset" class="btn btn-secondary" value="다시작성">
				<input type="button" class="btn btn-info" value="목록보기" onClick="location.href='list.bod?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form>
</div>
</center>

<c:choose>
	<c:when test="${sessionScope.loginInfo.type eq 'admin' }">
		<%@ include file="../admin/adbottom.jsp" %> 
	</c:when>
	<c:otherwise>
		<%@ include file="../user/usbottom.jsp"%>
	</c:otherwise>
</c:choose>