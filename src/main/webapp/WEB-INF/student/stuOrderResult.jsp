<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp"%>
<center>
<br>
<h2>구매 완료</h2>
<br><br>
<table class="table" style="width:60%">
	<tr class="table-active" style="text-align: center;">
		<th>NO</th>
		<th>강의명</th>
		<th>구매가</th>
	</tr>
	<c:set var="totalprice" value="0"/>
	<c:set var="number" value="1"/>
	<c:forEach var="odbean" items="${odbeanArr }">
	<tr style="text-align: center; vertical-align: middle;">
		<td>${number }</td>
		<td><b>${odbean.coteacher }[${odbean.cosubject }]</b>&nbsp;${odbean.coname }</td>
		<fmt:formatNumber var="price" value="${odbean.coprice }" pattern="#,###,###"/>
		<td>${price }원</td>
		<c:set var="totalprice" value="${totalprice + odbean.coprice }"/>
	</tr>
	<c:set var="number" value="${number+1 }"/>
	</c:forEach>
	<tr>
		<td colspan=3 align=right class="table-active">
		<fmt:formatNumber var="tot_price" value="${totalprice }" pattern="##,###,###"/>
			<b>결제 금액 : <font color="red">${tot_price }원</font></b>&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
</table>
<br>
<table border=1 class="table" style="width:30%">
	<tr>
		<th class="table-active" style="text-align: center; vertical-align: middle;">결제일</th>
		<td>${odbeanArr[0].oddate}</td>
	</tr>
	<tr>
		<th class="table-active"  style="text-align: center; vertical-align: middle;">결제방식</th>
		<td>무통장입금</td>
	</tr>
	<tr>
		<th class="table-active"  style="text-align: center; vertical-align: middle;">결제금액</th>
		<td>${tot_price }원</td>
	</tr>
</table>
</center>
<br>
<br>
<div class="d-grid gap-2 col-2 mx-auto">
  <button class="btn btn-secondary" type="button" onClick="location.href='home.us'">온강 홈으로</button>
</div>
<br>
<br>
<%@ include file="../user/usbottom.jsp"%>
