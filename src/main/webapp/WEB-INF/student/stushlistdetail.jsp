<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp" %>
	
	<style>
    	body{
    		align: center;
    		text-align: center;
    		margin: auto;
    	}
    </style>
    <br><br>
	<h2><b>결제 상세내역 조회</b></h2>
	<br>
	<br>
	<table border="0" align="center" width=60%>
		<tr>
			<td colspan="4" align="center" bgcolor="#DCDCDC">구매상품</td>
		</tr>
		<tr align="center" style="border-bottom: 2px solid black;">
			<th width=5%>No.</th>
			<th width=65%>강의명</th>
			<th width=20%>구매가</th>
			<!-- <td bgcolor="#DCDCDC">환불요청</td> -->
		</tr>
		<c:set var="number" value="1"/>
		<c:set var="totalprice" value="0"/>
		<c:forEach var="od" items="${odArr }">
		<tr align="center" style="border-bottom: 1px solid lightgray">
			<td>${number }</td>
			<td style="padding-top:10px; padding-bottom:10px;">

				<%-- <img src="${od.coimage }" width="50" height="50"> --%>
				<img src="<%=request.getContextPath() %>/resources/images/${od.coimage }" width="50" height="50">
				<br>
				<b>${od.coteacher }[${od.cosubject }]</b>&nbsp;${od.coname }
			</td>
			<td><fmt:formatNumber value="${od.coprice }" pattern="##,###,###"/>원</td>
			<!-- <td>부분환불</td> -->
		</tr>
		<c:set var="totalprice" value="${totalprice + od.coprice }"/>
		<c:set var="number" value="${number +1 }"/>
		</c:forEach>
		<tr style="border-top: 2px solid black;">
			<td colspan=4>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4" align="center" bgcolor="#DCDCDC" style="border-top: 1px solid black;">결제정보</td>
		</tr>
		<tr style="border-bottom:1px dotted lightgray">
			<td height="40" colspan="2" style=text-align:center;>총 결제 개수</td>
			<td colspan="2" style=text-align:center;>총 결제 금액</td>
		</tr>
		<tr style="border-bottom:1px solid black">
			<td height="40" colspan="2" style=text-align:center;>${fn:length(odArr) }개</td>
			<td colspan="2" style=text-align:center;><fmt:formatNumber value="${totalprice }" pattern="##,###,###"/>원</td>
		</tr>
	</table>
	<br><br>
	<input type="button" class="btn btn-secondary" value="주문내역" onClick="location.href='shlist.stu'">
	<br>
<%@ include file="../user/usbottom.jsp" %>
