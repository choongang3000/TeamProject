<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %> 
   
<script>
	function paygo(){
		location.href="shlist.stu";
	}
</script>

<!-- cartArr 로 cart목록 가져옴 -->
<center>
	<br>
	<h2>장바구니</h2>
	<table border=1 width="70%">
		<tr style="border-bottom: 2px solid black">
			<th>No</th>
			<th>강의 선생님</th>
			<th>강의명</th>
			<th>주문 금액</th>
			<th>삭제</th>
		</tr>
		<tr>
			<td>여기다</td>
			<td>반복문</td>
			<td>사용하여</td>
			<td>장바구니 구현</td>
			<td width="10px"><input type="button" value="삭제"></td>
		</tr>
		<tr>
			<td colspan="5" align=right>총 금액:</td>
		</tr>
	</table>
	<table width="70%">
		<tr>
			<td align=right>
				<input type="button" value="계속 쇼핑하기" onClick="history.back()">
				<input type="button" value="결제하기" onClick="paygo()">
			</td>
			<!-- <td width=20px></td> -->
		</tr>
	</table>
</center>
