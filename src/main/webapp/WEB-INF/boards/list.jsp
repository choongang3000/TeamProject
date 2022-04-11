<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
<!-- list.jsp<br> -->

<script>
	function insert(){
		location.href = "insert.bs";
	}
</script>
    
<style>
	body{
		text-align:center;
	}
	table{
		margin:auto;
	}

</style> 

<br><br>
<h2 align="center">수강 후기 게시판(전체글:${totalCount })</h2>
<center>
<br>
<div  class="input-prepend">
	<form method="get" action="list.bs" class="btn-group">
		<div class="input-group">
			<select name="whatColumn" class="form-control">
				<option value="all">전체글
				<option value="writer">작성자
				<option value="subject">제목
			</select>

		<input type="text" name="keyword" class="form-control">
		<input type="submit" value="검색" class="btn btn-secondary btn-sm">
		</div>
	</form>
</div>

<!-- <table width="700" border="1"> 글쓰기 영역
	<tr>
		<td align="right">
			<input type="button" value="글쓰기" onClick="insert()" class="btn btn-secondary btn-sm">
		</td>
		<td align="right"><a href="insert.bs">글쓰기</a></td>
	</tr>
</table> -->

<table class="table table-hover" width="60%" border="0" align="center">

	<tr height="30"> <!-- 글쓰기 -->
		<td colspan="5" align="right">
			<input type="button" value="글쓰기" onClick="insert()" class="btn btn-secondary btn-sm"  >
		</td>
	<tr>
	
	<tr height="40" bgcolor="#DCDCDC"> <!-- 목록제목 -->
		<td align="center">번호</td>
		<td align="center">제목</td>
		<td align="center">작성자</td>
		<td align="center">작성일</td>
		<td align="center">조회수</td>
	</tr>
	
	<c:set var="contentNum" value="${(totalCount - ((pageInfo.pageNumber-1)*pageInfo.pageSize)) }"/> <!-- 글번호 계산 -->
	
	<c:forEach var="list" items="${list }">
	<tr height="40">
		<td align="center">${contentNum}</td> <!-- 글번호 -->
		
		<c:set var="contentNum" value="${contentNum -1 }"/> <!-- 1씩 감소시켜서 조회 -->
		<td><!-- 제목부분 -->
			<c:if test="${list.re_level > 0 }"> <!-- 답글이 1개 이상일 경우 -->
			<c:set var="wid" value="${list.re_level * 20 }"/> <!-- 답글쓰기할때 공백처리 -->
				<img src="<%=request.getContextPath() %>/resources/images/level.gif" width="${wid }" height="15">
				<img src="<%=request.getContextPath() %>/resources/images/re.gif">
			</c:if>
			
			<a href="detail.bs?num=${list.num }&pageNumber=${pageInfo.pageNumber}">${list.subject }</a> <!-- 글 상세보기 -->
			
			<c:if test="${list.readcount >= 10 }"> <!-- 조회수 10명 이상일 경우 HOT이미지 -->
				<img src="<%=request.getContextPath() %>/resources/images/hot.gif">
			</c:if>	
		</td>
		<td align="center">${list.writer}</td> <!-- 작성자 -->
		<td align="center"><fmt:formatDate value="${list.reg_date}" type="both" pattern="yy/MM/dd HH:mm" /></td> <!-- 날짜 -->
		<td align="center">${list.readcount}</td> <!-- 조회수 -->
	</tr>	
	</c:forEach>

	</table>
<br>
 <!-- 하단페이지 -->
${pageInfo.pagingHtml }
</center>
<%@ include file="../admin/adbottom.jsp" %> 

