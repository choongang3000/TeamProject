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
<head>					<!-- 헤드 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 -->



</head>  				<!-- 헤드 끝-->

<%@ include file="color.jsp" %> <!-- include 지시어 : 내용을 복붙 -->
<div class="container">

<table border="1" class='table'>
	<tr>
		<td colspan="4" align="center">글내용 보기</td>
	</tr>
	<tr>
		<td align="center" class="table-secondary">
			글번호
		</td>
		<td align="center" >
			${bb.num }
		</td>
		<td align="center" class="table-secondary">
			조회수
		</td>
		<td align="center">
			${bb.readcount }
		</td>
	</tr>
	<tr  align="center">
		<td align="center" class="table-secondary">
			작성자
		</td>
		<td align="center">
			${bb.writer }
		</td>
		<td align="center" class="table-secondary">
			작성일
		</td>	
		<td align="center">
			<fmt:formatDate value="${bb.reg_date }" pattern="yyyy/MM/dd HH:mm" type="both"/>
		</td>	
	</tr>
	<tr>
		<td align="center" class="table-secondary">
			글제목
		</td>	
		<td colspan="3" align="center">
			${bb.subject }
		</td>	
	</tr>
	<tr height="100">
		<td class="table-secondary">
			글내용
		</td>	
		<td colspan="3" align="center">
			${bb.content }
		</td>
	</tr>
	<tr align="center">
		<td colspan="4">
			<input type="submit" value="글수정" class="btn btn-info" onClick="location.href='update.bod?num=${bb.num}&pageNumber=${pageNumber}'">
			<input type="button" value="글삭제" class="btn btn-secondary" onClick="location.href='delete.bod?num=${bb.num}&pageNumber=${pageNumber}'">
			<c:if test="${sessionScope.loginInfo.type eq 'admin' }">
				<input type="button" value="답변하기" class="btn btn-info" onClick="location.href='reply.bod?ref=${bb.ref }&re_step=${bb.re_step}&re_level=${bb.re_level}&pageNumber=${pageNumber}'">
			</c:if>
			<input type="button" value="글목록" class="btn btn-secondary" onClick="location.href='list.bod?pageNumber=${pageNumber}'">
		</td>
	</tr>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 부트스트랩2 -->
</body>
</div>