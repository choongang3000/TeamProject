<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/common/common.jsp"%>
<%@ include file="WEB-INF/user/ustop.jsp"%>

<center>
<br>
<h2>주문 확인</h2>
<br>
<h6>구매일자 : 2022-2-11 07:49</h6>
<table class="table" style="width:60%">
	<tr class="table-active" style="text-align: center">
		<th width=5%>NO</th>
		<th>강사</th>
		<th>강의명</th>
		<th>구매가</th>
	</tr>
	<tr height=100px style="text-align: center; vertical-align: middle;">
		<td>1</td>
		<td>권준[CSS]</td>
		<td>한방에 끝내는 CSS</td>
		<td>8000원</td>
	</tr>
	<tr style="text-align: center">
		<td>2</td>
		<td>한진환[JAVA]</td>
		<td>한방에 끝내는 지옥에서온 JAVA</td>
		<td>4000원</td>
	</tr>
	<tr>
		<td colspan=4 align=right>총 금액 : 12000원</td>
	</tr>
	<%-- 
	<c:set var="totalprice" value="0"/>
	<c:set var="number" value="1"/>
	<c:forEach var="odbean" items="${odbeanArr }">
	<tr>
		<td>${number }</td>
		<td>${odbean.coteacher }[${odbean.cosubject }]</td>
		<td>${odbean.coname }</td>
		<td>${odbean.coprice }원</td>
		<c:set var="totalprice" value="${totalprice + odbean.coprice }"/>
	</tr>
	<c:set var="number" value="${number+1 }"/>
	</c:forEach>
	<tr>
		<td colspan=4 align=right>
			총 금액 : ${totalprice }원
		</td>
	</tr>
	--%>
</table>
</center>
<br>
<%@ include file="WEB-INF/user/usbottom.jsp"%>