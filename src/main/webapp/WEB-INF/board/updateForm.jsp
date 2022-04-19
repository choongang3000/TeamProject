<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${sessionScope.loginInfo.type eq 'admin' }">
		<%@ include file="../admin/adtop.jsp" %>
	</c:when>
	<c:otherwise>
		<%@ include file="../user/ustop.jsp"%>
	</c:otherwise>
</c:choose>
<head>					<!-- 헤드 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 -->



</head>  				<!-- 헤드 끝-->

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/check.js"></script>

<div class="container">
<body>   <!-- 바디시작 -->

<form method="post" action="update.bod?num=${bb.num }&pageNumber=${pageNumber}" onsubmit="return check()">
	<input type="hidden" name="num" value="${bb.num}">
	<table border="1" class='table'>
		<%-- <tr>
			<td colspan="2" align="right">
				<a href="list.bod?pageNumber=${pageNumber }">글목록</a>
			</td>
		</tr> --%>
		<tr align="center">
		<td colspan="2">글수정</td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">이 름</td>
			<td><input type="text" name="writer" value="${bb.writer}"></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">제 목</td>
			<td><input type="text" name="subject" value="${bb.subject}"></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">Email</td>
			<td><input type="text" name="email" value="${bb.email}"></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">내용</td>
			<td><textarea name="content" rows="15" cols="50">${bb.content}</textarea></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">비밀번호</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" class="btn btn-primary" value="수정완료">
				<input type="reset" class="btn btn-secondary" value="다시작성">
				<input type="button" class="btn btn-info" value="목록보기" onClick="location.href='list.bod?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 부트스트랩2 -->
</body>
</div>