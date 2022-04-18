<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp"%>
<head><!-- 헤드 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 -->
<style type="text/css" dir="ltr">
	body{
		text-align:center;
	}
	table{
		margin:auto;
	}
	
	#container  {
    		width:65%;
			margin:auto;
    	}
    
    .title{
    	text-align:left;
    }
</style>

</head>  <!-- 헤드 -->

<%@ include file="color.jsp" %> <!-- include 지시어 : 내용을 복붙 -->

<body bgcolor="<%= bodyback_c %>"> <!-- 바디 -->
<div id=container>
<div class="title">
<h3>고객센터 QnA (전체 글:${totalCount })</h3>
</div>
<table width="700" border="1"  class="table table-striped">
	<tr>
		<td align="right"><a href="insert.bod" class="btn btn-primary">글쓰기</a></td>
	</tr>
</table>

<table width="700" border="1" class="table table-striped">
	<tr>
		<td align="center">번호</td>
		<td align="center">제목</td>
		<td align="center">작성자</td>
		<td align="center">작성일</td>
		<td align="center">조회</td>
		<!-- <td align="center">IP</td> -->
	</tr>
	<c:set var="contentNum" value="${(totalCount - ((pageInfo.pageNumber-1)*pageInfo.pageSize)) }"/>
	<c:forEach var="bd" items="${boardArr }">
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
<%@include file="../user/usbottom.jsp"%>