<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
<!-- adshlistdetail.jsp -->
    
    <style>
    	body{
    		align: center;
    		text-align: center;
    		margin: auto;
    	}   
    	table{
    		text-align: center;
    	} 
    </style>
    
    <h2>주문 상세내역 조회</h2>
    <br><br>
    <table align="center" width="70%" height="30%" border="0">
    	<tr>
    		<td bgcolor="#DCDCDC">고객ID</td>
    		<td bgcolor="#DCDCDC">주문번호</td>
    		<td bgcolor="#DCDCDC">상품명</td>
    		<td bgcolor="#DCDCDC">담당선생님</td>
    		<td bgcolor="#DCDCDC">금액</td>
    	</tr>
    	<c:forEach var="od" items="${odArr }">
    	<tr>
    		<td>${od.aid }</td>
    		<td>${od.onum }</td>
    		<td>${od.cosubject }</td>
    		<td>${od.coteacher }</td>
    		<td>
    			<fmt:formatNumber value="${od.coprice }" pattern="##,###,###"/>원
    		</td>
    	</tr>
    	</c:forEach>
    	<c:forEach var="od" items="${odArr }">
    	<c:set var="totalcount" value="0"/>
    	<c:set var="totalprice" value="0"/>
    	<c:set var="totalprice" value="${totalprice + od.coprice }"/>
    	<tr>
    		<td bgcolor="#DCDCDC">총 개수</td>
    		<td>${fn:length(odArr) }개</td>
    		<td bgcolor="#DCDCDC">총 금액</td>
    		<td colspan="2"><fmt:formatNumber value="${totalprice }" pattern="##,###,###"/>원</td>
    	</tr>
    	</c:forEach>
    </table>
    <br><br>
    <input type="button" value="뒤로가기" onClick="history.back()">
<br><br>

<%@ include file="../admin/adbottom.jsp" %>
