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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    	.table{
    		width:1200px;
    		text-align: center;
    	}
    
</style>

<%-- 
<jsp:include page="color.jsp"></jsp:include>
include 액션태그 : 실행한 결과를 가져옴
 --%>
<%-- <%@ include file="color.jsp" %> <!-- include 지시어 : 내용을 복붙 --> --%>
<center>
<div class="container">
	<!-- <body>   바디시작 -->
	<br><h2>Q&A 문의글 작성</h2><br>
	<form method="post" action="insert.bod">
	<input type="hidden" name="aname" value="${loginInfo.aname }">
	<table border="0"  width="60%">
		<tr>
			<td align="center" bgcolor="#DCDCDC">이 름</td>
			<td>
				<input type="text" name="writer" class="form-control" id="floatingInput" value="${loginInfo.id }" readonly>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">제 목</td>
			<td>
				<!-- <input type="text" name="subject" value="질문있어요"> -->
				<input type="text" name="subject" class="form-control" id="floatingInput" placeholder="제목을 입력해주세요" required>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">Email</td>
			<td>
				<!-- <input type="text" name="email" value="bdd@yx.net"> -->
				<input type="text" name="email" class="form-control" id="floatingInput" placeholder="이메일을 입력해주세요">
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">내용</td>
			<td>
				<!-- <textarea name="content" rows="15" cols="50">질문드려요</textarea> -->
				<textarea name="content" rows="15" cols="50" class="form-control" placeholder="내용을 입력해주세요" id="floatingTextarea" style="resize:none;" required></textarea>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">비밀번호</td>
			<td>
				<!-- <input type="password" name="passwd" value="1234"> -->
				<input type="password" name="passwd" class="form-control" id="floatingInput" placeholder="비밀번호을 입력해주세요" required>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<br>
				<input type="submit" value="글쓰기" class="btn btn-primary" onClick="return check()">
				<input type="reset" value="다시작성" class="btn btn-secondary">
				<input type="button" value="목록보기" class="btn btn-info" onClick="location.href='list.bod'">
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