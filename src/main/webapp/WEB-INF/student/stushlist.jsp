<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp" %>

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  
<script>
  function cancelPay() {
    jQuery.ajax({
      "url": "{환불요청을 받을 서비스 URL}", // 예: http://www.myservice.com/payments/cancel
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": "{결제건의 주문번호}", // 예: ORD20180131-0000011
        "cancel_request_amount": 2000, // 환불금액
        "reason": "테스트 결제 환불" // 환불사유
        "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
        "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
        "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
      }),
      "dataType": "json"
    });
  }
</script>  
<style>
	table{
		width:50%;
		text-align: center;
	}
</style>

<center>

<!-- shlist.jsp <br> -->
<h2>주문내역 조회</h2>
<br>    

<table border="0" align="center">

<tr height="50">
	<th>주문번호</th>
	<th>주문강의</th>
	<th>총금액</th>
	<th>주문일자</th>
	<th>환불</th>
	<th>상세정보</th>
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
	<td><input type="button" value="환불" onClick="cancelPay()"></td> 
	<td><a href="shlistdetail.stu?onum=${ob.obean.onum }">주문상세보기</a></td>
</tr>
<c:set var="number" value="${number + 1 }"/>
</c:forEach>
<tr height="50">
	<td colspan="3">총합</td>
	<td>금액</td>
</tr>

</table>
</center>

<%@ include file="../user/usbottom.jsp" %>
