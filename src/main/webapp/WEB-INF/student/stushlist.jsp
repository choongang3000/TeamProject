<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../admin/adtop.jsp" %>

<style>
	table{
		width:50%;
		text-align: center;
	}
</style>

<center>

<!-- shlist.jsp <br> -->
<h2>주문내역 조회</h2>
<br>    

<table border="0" align="center">

<tr height="50">
	<td>주문번호</td>
	<td>주문강의</td>
	<td>총금액</td>
	<td>주문일자</td>
	<td>상세정보</td>
</tr>

<tr height="30">
	<td>1</td>
	<td>주문강의 외 2개</td>
	<td><fmt:formatNumber value="${totalcount }" pattern="#,###,###"/></td>
	<td>2022-03-31</td>
	<td><a href="shlistdetail.stu">주문상세보기</a></td>
</tr>

<tr height="50">
	<td colspan="3">총합</td>
	<td>금액</td>
</tr>

</table>
</center>

<%@ include file="../admin/adbottom.jsp" %>
