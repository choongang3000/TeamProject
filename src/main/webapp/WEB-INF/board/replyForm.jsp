<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin/adtop.jsp" %>

<style>
    .table{
    	width:1200px;
    	text-align: center;
    }
    
</style>

<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="check.js"></script>

<%-- <center>
	ref/re_step/re_level<br>
	${ref }/${re_step }/${re_level }<br>
</center> --%>

<center>
<div class="container">
<br>
<h2 align="center">Q&A답변 작성</h2>
<br>

<form method="post" action="reply.bod?pageNumber=${pageNumber}">
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="re_step" value="${re_step}">
	<input type="hidden" name="re_level" value="${re_level}">
	<table border="0" width="60%">
		<!-- <tr>
			<td colspan="2" align="center">
				답글쓰기
			</td>
		</tr> -->
		<tr>
			<td align="center"  bgcolor="#DCDCDC">이 름</td>
			<td>
			<!-- <input type="text" name="writer" value="홍길동"> -->
			<input type="text" name="writer" class="form-control" id="floatingInput" value="${loginInfo.id }" readonly>
			</td>
		</tr>
		<tr>
			<td align="center"  bgcolor="#DCDCDC">제 목</td>
			<td>
			<!-- <input type="text" name="subject" value="[답글]" required> -->
			<input type="text" name="subject" class="form-control" id="floatingInput" placeholder="제목을 입력해주세요" required>
			</td>
		</tr>
		<tr>
			<td align="center"  bgcolor="#DCDCDC">Email</td>
			<td>
			<!-- <input type="text" name="email" value="aa@xx.com"> -->
			<input type="text" name="email" class="form-control" id="floatingInput" placeholder="이메일을 입력해주세요">
			</td>
		</tr>
		<tr>
			<td align="center"  bgcolor="#DCDCDC">내용</td>
			<td>
			<!-- <textarea name="content" rows="15" cols="50">호호호</textarea> -->
			<textarea name="content" rows="15" cols="50" class="form-control" placeholder="내용을 입력해주세요" id="floatingTextarea" style="resize:none;" required></textarea>
			</td>
		</tr>
		<tr>
			<td align="center"  bgcolor="#DCDCDC">비밀번호</td>
			<td>
			<!-- <input type="password" name="passwd" value="1234"> -->
			<input type="password" name="passwd" class="form-control" id="floatingInput" placeholder="비밀번호을 입력해주세요" required>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<br>
				<input type="submit" class="btn btn-secondary" value="답글쓰기" onClick="return check()">
				<input type="reset" class="btn btn-secondary" value="다시작성">
				<input type="button" class="btn btn-primary" value="목록보기" onClick="location.href='list.bod?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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