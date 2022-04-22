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
<br><br>
<!-- shlist.jsp <br> -->
<h2><b>주문내역 조회</b></h2>
<br>    

<table class="table" align="center" style="width:70%">

<tr height="50" class="bg-light" style="text-align: center; vertical-align: middle;">
	<th width=10%>주문번호</th>
	<th width=40%>주문강의</th>
	<th width=15%>총금액</th>
	<th width=20%>주문일자</th>
	<th width=15%>상세정보</th>
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

</table>

</center>
<br>
<%@ include file="../user/usbottom.jsp" %>
