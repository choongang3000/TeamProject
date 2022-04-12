<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../admin/adtop.jsp" %>
<!-- cartArr 로 cart목록 가져옴 -->
<center>
	<h2>장바구니</h2>
	<br>
	<table class="table" style="width:80%">
		<tr style="border-bottom: 2px solid black" class="table-active">
			<th style="width:5%"></th>
			<th style="width:20%;height:30px;text-align: center; vertical-align: middle;">강의 선생님</th>
			<th style="width:50%;text-align: center; vertical-align: middle;">강의명</th>
			<th style="width:25%;text-align: center; vertical-align: middle;">주문 금액</th>
			<th></th>
		</tr>
		<c:set var="i" value="1"/>
		<c:forEach var="cart" items="${cartArr }">
		<tr>
			<td style="width:5%;height:100px;text-align: center; vertical-align: middle;">${i}</td>
			<td style="width:20%;text-align: center; vertical-align: middle;">${cart.coteacher }[${cart.cosubject }]</td>
			<td style="width:50%;text-align: center; vertical-align: middle;">${cart.coname }</td>
			<td style="width:25%;text-align: center; vertical-align: middle;">${cart.coprice }</td>
			<td style="width:10px;text-align: center; vertical-align: middle;">
				<input type="button"  class="btn btn-outline-danger btn-sm" value="삭제">
			</td>
		<c:set var="i" value="${i+1}"/>
		</tr>
		</c:forEach>
		<tr>
			<td colspan=3></td>
			<td style="text-align: right; vertical-align: middle;">총 금액 : ${totalprice }원</td>
			<td></td>
		</tr>
	</table>
	<table width="80%">
		<tr>
			<td align=right>
				<input type="button" value="계속 쇼핑하기" class="btn btn-secondary">
				&nbsp;&nbsp;
				<input type="button" value="결제하기" class="btn btn-primary" onClick="location.href='payment.stu'">
			</td>
			<td width=50px></td>
		</tr>
	</table>
</center>
<%@ include file="../admin/adbottom.jsp" %>