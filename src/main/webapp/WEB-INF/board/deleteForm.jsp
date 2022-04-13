<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>					<!-- 헤드 -->
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 -->



</head>  				<!-- 헤드 끝-->


<div class="container">
<body>   <!-- 바디시작 -->

<form method="post" action="delete.bod?num=${num }">
	<%-- <input type="hidden" name="num" value="<%=num %>"> --%>
	<input type="hidden" name="pageNumber" value="${pageNumber}">
	<table border="1" align="center" class="table">
		<tr class="table-secondary">
			<td>비밀번호를 입력하세요</td>
		</tr>
		<tr>
			<td class="table-secondary">비밀번호: <input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" class="btn btn-secondary" value="글삭제" btn btn-secondary >
				<input type="button" class="btn btn-secondary" value="글목록" btn btn-secondary  onClick="location.href='list.bod?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 부트스트랩2 -->
</body>
</div>