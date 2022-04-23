<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>

 <style>
    .table{
    	width:1200px;
    	text-align: center;
    }
    
</style>

<center>
<!-- shlist.jsp <br> -->
<br><h2><b>주문내역 조회</b></h2>   
<table>
<tr height="100">
	<td colspan="6">
		<form action="shlist.ad" method="get" class="btn-group">
			<input type="text" name="keyword" size="25" placeholder="조회할 회원 아이디 입력" class="form-control">
			<input type="submit" value="검색" class="btn btn-secondary btn-sm"> 
		</form>
    </td>
</tr>
</table>
<table border="0" align="center" class="table table-striped">
<tr height="30px" style="border-bottom: 2px solid black; text-align: center">
	<th>NO.</th>
	<th>주문번호</th>
	<th>아이디</th>
	<th>주문일자</th>
	<th>총금액</th>
	<th>상세정보</th>
</tr>
<c:if test="${fn:length(list) == 0 }">
<tr>
	<th colspan=6>주문내역이 존재하지 않습니다</th>
</tr>
</c:if>
<c:set var="totalcount" value="${totalcount - ((pageInfo.pageNumber-1) * pageInfo.pageSize) }"/>
<c:forEach var="list" items="${list }">
<tr height="50" style="vertical-align: middle">
	<td>${totalcount }</td>
	<td>${list.onum}</td>
	<td>${list.aid }</td>
	<td>${list.odate }</td>
	<td><fmt:formatNumber value="${list.totprice }" pattern="#,###,###"/></td>
	<td><input type="button" value="상세정보" class="btn btn-outline-primary" onClick="location.href='shlistdetail.ad?onum=${list.onum }'"></td>
</tr>
<c:set var="totalcount" value="${totalcount-1 }"/>
</c:forEach>
</table>
<br>
${pageInfo.pagingHtml }
</center>
<br>
<%@ include file="../admin/adbottom.jsp" %>