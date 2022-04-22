<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp"%>
<!-- cartArr 로 cart목록 가져옴 -->
<style>
	table{
		width:1200px;
	}
</style>

<center>
	<br><br>
	<h2>장바구니</h2>
	<br>
	<!-- <form action="payment.stu" method="get"> -->
	<table class="table" style="width:1200px; border-top:2px solid lightgray;border-bottom:2px solid lightgray">
		<tr style=" height:40px;">
			<th style="width:5%"></th>
			<th style="width:20%;text-align: center; vertical-align: middle;">강의 선생님</th>
			<th style="width:50%;text-align: center; vertical-align: middle;">강의명</th>
			<th style="width:25%;text-align: center; vertical-align: middle;">주문 금액</th>
			<th></th>
		</tr>
		<c:if test="${fn:length(cartArr) == 0}">
			<tr>
				<td colspan=5 style="text-align: center; vertical-align: middle; height:100px;">
					장바구니가 비어있습니다
				</td>
			</tr>
		</c:if>
		<c:set var="i" value="1"/>
		<c:forEach var="cart" items="${cartArr }">
		<tr>
			<td style="width:5%;height:100px;text-align: center; vertical-align: middle;"><b>${i}</b></td>
			<td style="width:20%;text-align: center; vertical-align: middle;"><b>${cart.coteacher }[${cart.cosubject }]</b></td>
			<td style="width:50%;text-align: center; vertical-align: middle;"><b>${cart.coname }</b></td>
			<fmt:formatNumber var="price" value="${cart.coprice }" pattern="###,###" />
			<td style="width:25%;text-align: center; vertical-align: middle;"><b>${price }원</b></td>
			<td style="width:10px;text-align: center; vertical-align: middle;">
				<input type="button" class="btn btn-outline-danger btn-sm" value="삭제" onClick="location.href='deleteCart.stu?conum=${cart.conum}'">
			</td>
		<c:set var="i" value="${i+1}"/>
		</tr>
		</c:forEach>
		<tr style="height:20px;">
			<td></td>
		</tr>
		<tr class="table-active" style="height:40px;">
			<td colspan=3></td>
			<fmt:formatNumber var="tot_price" value="${totalprice }" pattern="##,###,###"/>
			<td style="text-align: right; vertical-align: middle;"><b>총 금액 : <font color="red">${tot_price }원</font></b></td>
			<td></td>
		</tr>
	</table>
	<table width="80%">
		<tr>
			<td align=right>
				<input type="button" value="계속 쇼핑하기" class="btn btn-secondary" onClick="location.href='list.cos'">
				&nbsp;&nbsp;
				<input type="button" value="결제하기" class="btn btn-primary" onClick="location.href='payment.stu'">
				<!-- <input type="submit" value="결제하기" class="btn btn-primary"> -->
			</td>
			<td width=50px></td>
		</tr>
	</table>
	<!-- </form> -->
	<br><br>
</center>
<%@ include file="../user/usbottom.jsp"%>