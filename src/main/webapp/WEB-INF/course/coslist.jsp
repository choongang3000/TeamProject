<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>    

<a href="start.jsp">시작페이지</a> <br>
<a href="logout.jsp">로그아웃</a>

<center>
<h2>강좌 리스트 화면(course.jsp)</h2>
<form action="list.cos" method="get">
	<select name="whatColumn">
		<option value="">선택
		<option value="coname">상품명
		<option value="cocontents">설명
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색">
</form>
<table border="1">
	<tr>
		<td align="right" colspan="6">
			<input type="button" value="추가하기" onclick="insert()">
		</td>
	</tr>
	<tr>
		<th>상품번호</th>
		<th>상품명</th>
		<th>설명</th>
		<th>가격</th>
		<th>삭제</th>
		<th>수정</th>
	</tr>
	<c:forEach var="course" items="${list}">
	<tr>
		<td>
			<c:out value="${course.conum }" />
		</td>
		<td>
			<a href="detail.cos?conum=${course.conum }&pageNumber=${pageInfo.pageNumber }">${course.coname }</a>
		</td>
		<td>${course.cocontent }</td>
		<td>${course.coprice }원</td>
		<td>삭제</td>
		<td>
			<input type="button" value="수정">
		</td>
	</tr>
	</c:forEach>
</table>
<br>
	${pageInfo.pagingHtml }
</center>
<br><br><br><br><br><br><br>