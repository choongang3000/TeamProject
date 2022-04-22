<%@page import="java.text.SimpleDateFormat"%>
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
<head><!-- 헤드 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 -->
<style type="text/css" dir="ltr">
	table{
		width:1200px;
		margin:auto;
		text-align: center;
	}
	body{
		text-align:center;
	}
	
	#container  {
    		width:1200px;
			margin:auto;
    	}
    
    .title{
    	text-align:left;
    }
</style>

</head>  <!-- 헤드 -->

<%@ include file="color.jsp" %> <!-- include 지시어 : 내용을 복붙 -->

<!-- </div> -->	
<!-- <table width="700" border="1"  class="table table-striped"> -->
<div id=container>
<br><br>
<table border="0" class="table table-striped"> <!-- 700 -> 1200 -->
	<tr>
		<td colspan="2" align="left"><a class="navbar-brand" align="right" style="color:black;"><b>&nbsp;고객센터 Q&A</b></a></td>
		<td colspan="3" align="right"><a href="insert.bod" class="btn btn-secondary btn-sm">글쓰기</a></td>
	</tr>
	<tr height="30px" style="border-bottom: 2px solid black; text-align: center">
		<th align="center">번호</th>
		<th align="center">제목</th>
		<th align="center">작성자</th>
		<th align="center">작성일</th>
		<th align="center">조회</th>
		<!-- <td align="center">IP</td> -->
	</tr>
	<c:set var="contentNum" value="${(totalCount - ((pageInfo.pageNumber-1)*pageInfo.pageSize)) }"/>
	<c:forEach var="bd" items="${boardArr}">
	<tr>
		<td align="center">${contentNum}</td>
		<c:set var="contentNum" value="${contentNum -1 }"/>
		<td>
			<c:if test="${bd.re_level > 0 }">
			<c:set var="wid" value="${bd.re_level * 20 }"/>
				<img src="<%=request.getContextPath() %>/resources/images/level.gif" width="${wid }" height="15">
				<img src="<%=request.getContextPath() %>/resources/images/re.gif">
			</c:if>
			<a href="detail.bod?num=${bd.num }&pageNumber=${pageInfo.pageNumber}">${bd.subject }</a>
			<c:if test="${bd.readcount >= 10 }">
				<img src="<%=request.getContextPath() %>/resources/images/hot.gif">
			</c:if>	
		</td>
		<td align="center">${bd.writer}</td>
		<td align="center"><fmt:formatDate value="${bd.reg_date}" type="both" pattern="yyyy/MM/dd HH:mm" /></td>
		<td align="center">${bd.readcount}</td>
		<%-- <td align="center">${bd.ip}</td> --%>
	</tr>	
	</c:forEach>
</table>
<!-- 페이지 번호 설정 -->
<center>
	${pageInfo.pagingHtml }
</center>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- 부트스트랩2 -->
</div>
</body>

<c:choose>
	<c:when test="${sessionScope.loginInfo.type eq 'admin' }">
		<%@ include file="../admin/adbottom.jsp" %>
	</c:when>
	<c:otherwise>
		<%@ include file="../user/usbottom.jsp" %>
	</c:otherwise>
</c:choose>