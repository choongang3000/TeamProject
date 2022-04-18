<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin/adtop.jsp" %>
<head>					<!-- 헤드 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 -->

<style type="text/css" >
	body{
		text-align:center;
	}
	table{
		margin:auto;
	}
</style>


</head>  				<!-- 헤드 끝-->



<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="check.js"></script>

<%-- <center>
	ref/re_step/re_level<br>
	${ref }/${re_step }/${re_level }<br>
</center> --%>

<div class="container">
<body>


<form method="post" action="reply.bod?pageNumber=${pageNumber}">
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="re_step" value="${re_step}">
	<input type="hidden" name="re_level" value="${re_level}">
	<table border="1" class='table'>
		<tr>
			<td colspan="2" align="center">
				답글쓰기
			</td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">이 름</td>
			<td><input type="text" name="writer" value="홍길동"></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">제 목</td>
			<td><input type="text" name="subject" value="[답글]"></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">Email</td>
			<td><input type="text" name="email" value="aa@xx.com"></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">내용</td>
			<td><textarea name="content" rows="15" cols="50">호호호</textarea></td>
		</tr>
		<tr>
			<td align="center" class="table-secondary">비밀번호</td>
			<td><input type="password" name="passwd" value="1234"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" class="btn btn-secondary" value="답글쓰기" onClick="return check()">
				<input type="reset" class="btn btn-secondary" value="다시작성">
				<input type="button" class="btn btn-primary" value="목록보기" onClick="location.href='list.bod?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 부트스트랩2 -->
</body>
</div>