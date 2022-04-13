<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<head>					<!-- 헤드 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 -->



</head>  				<!-- 헤드 끝-->

<%-- 
<jsp:include page="color.jsp"></jsp:include>
include 액션태그 : 실행한 결과를 가져옴
 --%>
<%@ include file="color.jsp" %> <!-- include 지시어 : 내용을 복붙 -->

<div class="container">
	<body>   <!-- 바디시작 -->
		
	<form method="post" action="insert.bod">
	<table border="1" class='table'>
		<tr align="center">
		<td colspan="2">글쓰기</td>
		</tr>
		
		<tr>
			<td align="center" class="table-secondary" >이 름</td>
			<td><input type="text" name="writer" value="수강생1"></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">제 목</td>
			<td><input type="text" name="subject" value="질문있어요"></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary" >Email</td>
			<td><input type="text" name="email" value="bdd@yx.net"></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">내용</td>
			<td><textarea name="content" rows="15" cols="50">질문드려요</textarea></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">비밀번호</td>
			<td><input type="password" name="passwd" value="1234"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기" class="btn btn-primary" onClick="return check()">
				<input type="reset" value="다시작성" class="btn btn-secondary">
				<input type="button" value="목록보기" class="btn btn-info" onClick="location.href='list.bod'">
			</td>
		</tr>
	</table>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 부트스트랩2 -->
</body>
</div>