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
    </style>
    
    <h2>주문 상세내역 조회</h2>
    <br><br>
    <table align="center" width="50%" height="50%" border="0">
    	<tr>
    		<td bgcolor="#DCDCDC">고객명</td>
    		<td>학생1</td>
    		<td bgcolor="#DCDCDC">송장번호</td>
    		<td>123456</td>
    	</tr>
    	<tr>
    		<td colspan="1" bgcolor="#DCDCDC">배송지</td>
    		<td colspan="3">서울 영등포구 어쩌고</td>
    	</tr>
    	<tr>
    		<td bgcolor="#DCDCDC">순번</td>
    		<td bgcolor="#DCDCDC">상품명(상품번호)</td>
    		<td bgcolor="#DCDCDC">담당선생님</td>
    		<td bgcolor="#DCDCDC">금액</td>
    	</tr>
    	<tr>
    		<td>1</td>
    		<td>html 어쩌고</td>
    		<td>선생님1</td>
    		<td>50,000</td>
    	</tr>
    	<tr>
    		<td bgcolor="#DCDCDC">총개수</td>
    		<td>1개</td>
    		<td bgcolor="#DCDCDC">총 금액</td>
    		<td>50,000</td>
    	</tr>
    </table>
    <br><br>
    <input type="button" value="뒤로가기" onClick="history.back()">
<br><br>

<%@ include file="../admin/adbottom.jsp" %>
