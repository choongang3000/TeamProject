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
    		width:1200px;
    	} 
    </style>
    <br>
    <h2><b>주문 상세내역 조회</b></h2>
    <br>
    <table align="center" border="1" style="width:1200px;">
    	<tr height="30px" style="border-bottom: 2px solid black; text-align: center">
    		<th bgcolor="#DCDCDC">고객ID</th>
    		<th bgcolor="#DCDCDC">주문번호</th>
    		<th bgcolor="#DCDCDC">과목</th>
    		<th bgcolor="#DCDCDC">상품명</th>
    		<th bgcolor="#DCDCDC">담당선생님</th>
    		<th bgcolor="#DCDCDC">금액</th>
    	</tr>
    	<c:forEach var="od" items="${odArr }">
    	<tr height="40px" style="border-bottom: 1px solid lightgray">
    		<td>${od.aid }</td>
    		<td>${od.onum }</td>
    		<td>${od.cosubject }</td>
    		<td>${od.coname }</td>
    		<td>${od.coteacher }</td>
    		<td>
    			<fmt:formatNumber value="${od.coprice }" pattern="##,###,###"/>원
    		</td>
    	</tr>
    	</c:forEach>
    	<c:set var="totalprice" value="0"/>
    	<c:set var="totalcount" value="0"/>
    	<c:forEach var="od" items="${odArr }">
    	<c:set var="totalprice" value="${totalprice + od.coprice }"/>
    	</c:forEach>
    	<tr height="30px" style="border-top: 2px solid black; text-align: center">
    		<th bgcolor="#DCDCDC">총 개수</th>
    		<th>${fn:length(odArr) }개</th>
    		<th bgcolor="#DCDCDC">총 금액</th>
    		<th colspan="2"><fmt:formatNumber value="${totalprice }" pattern="##,###,###"/>원</th>
    	</tr>
    </table>
    <br><br>
    <input type="button" class="btn btn-secondary" value="뒤로가기" onClick="history.back()">
<br><br>

<%@ include file="../admin/adbottom.jsp" %>
