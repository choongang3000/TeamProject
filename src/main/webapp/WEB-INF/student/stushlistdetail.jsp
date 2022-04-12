<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
	
	<style>
    	body{
    		align: center;
    		text-align: center;
    		margin: auto;
    	}
    </style>
    
	<h2>결제 상세내역 조회</h2>
	<br>
	<div>구매일자: 2022.03.31</div>
	<br>
	<table border="0" align="center" width="50%" height="80%">
		<tr>
			<td colspan="3" align="center" bgcolor="#DCDCDC">구매상품</td>
		</tr>
		
		<tr>
			<td bgcolor="#DCDCDC">상품명</td>
			<td bgcolor="#DCDCDC">구매가</td>
			<td bgcolor="#DCDCDC">수강상태</td>
		</tr>
		
		<tr>
			<td>
				<br>
				<img src="" width="100" height="100"><br>
				HTML 뽀개기(기초)
			</td>
			<td>50,000원</td>
			<td>수강중</td>
		</tr>
	</table>
	<br>
	<br>
	<table border="0" align="center" width="50%" height="80%">
		<tr>
			<td colspan="2" align="center" bgcolor="#DCDCDC">결제정보</td>
		</tr>
		<tr>
			<td height="50">총 상품 금액<br>50,000원</td>
			<td height="50">결제 금액<br>50,000원</td>
		</tr>
		<tr>
			<td colspan="2" height="100">총 결제 금액 50,000원</td>
		</tr>
	</table>
	<br>
<input type="button" value="목록" onClick="history.back()">
<%@ include file="../admin/adbottom.jsp" %>
