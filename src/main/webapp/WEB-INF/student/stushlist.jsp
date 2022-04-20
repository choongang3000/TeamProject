<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp" %>

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
	<th>주문번호</th>
	<th>주문강의</th>
	<th>총금액</th>
	<th>주문일자</th>
	<th>상세정보</th>
</tr>
<c:if test="${fn:length(obArr) == 0 }">
<tr>
	<td colspan=6 style="height: 100px; text-align: center; vertical-align: middle;">주문 내역이 없습니다</td>
</tr>	
</c:if>
<c:set var="number" value="1"/>
<c:forEach var="ob" items="${obArr}">
<tr height="30">
	<td>${number }</td>
	
	<c:if test="${ob.elseNum != 0 }">
	<td>${ob.coname } 외 ${ob.elseNum }개</td>
	</c:if>
	
	<c:if test="${ob.elseNum == 0 }">
	<td>${ob.coname }</td>
	</c:if>
	
	<td><fmt:formatNumber value="${ob.obean.totprice }" pattern="#,###,###"/>원</td>
	<td><fmt:formatDate value="${ob.obean.odate }" type="both" pattern="yyyy/MM/dd HH:mm"/></td>
	<td><a href="shlistdetail.stu?onum=${ob.obean.onum }">주문상세보기</a></td>
</tr>
<c:set var="number" value="${number + 1 }"/>
</c:forEach>
<tr height="50">
	<td colspan="3">총합</td>
	<td>금액</td>
</tr>

</table>

</center>

<%@ include file="../user/usbottom.jsp" %>
