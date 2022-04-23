<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adtop.jsp" %>
<center>
<table class="table table-borderless" style="width:700px;">
	<tr style="border-bottom:3px double black">
		<td colspan=3 align=right>
			<input type="button" value="목록으로" onClick="location.href='tclist.ad'" class="btn btn-secondary btn-sm">
		</td>
	</tr>
	<tr>
		<td rowspan=4 width=160>
			<img src="<%=request.getContextPath() %>/resources/images/${tbean.t_image}" width=100% height=200>
		</td>
		<th height=50 valign="middle" class="table-active" style="text-align: center;border-bottom: 1px dotted gray;">이름</th>
		<td align=center style="text-align: center; border-bottom: 1px dotted gray;">${tbean.aname }</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">ID</th>
		<td align=center>${tbean.id }</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">PW</th>
		<td align=center>${tbean.pw }</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">타입</th>
		<td align=center>
			${tbean.type }
		</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th colspan=3 class="table-active" style="text-align: center; background: gray; color:white;">◈ 개인 정보 ◈</th>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">전화번호</th>
		<td colspan=2>0${tbean.phone1 }-${tbean.phone2 }-${tbean.phone3 }</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">E-mail</th>
		<td colspan=2>${tbean.email }</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">주소</th>
		<td colspan=2>${fn:split(tbean.addr,'|')[1] }&nbsp;${fn:split(tbean.addr,'|')[2] }(우편번호:${fn:split(tbean.addr,'|')[0] }) </td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">주민등록번호</th>
		<td colspan=2>${tbean.rrn1 }-${tbean.rrn2 }</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th colspan=3 class="table-active" style="text-align: center; background: gray; color:white;">◈ 계약 관련 정보 ◈</th>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">과목</th>
		<td colspan=2>${tbean.subject }</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">소개글</th>
		<td colspan=2>${tbean.introduction }</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">가입일</th>
		<td colspan=2>${tbean.joindate }</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">계약 만료일</th>
		<td colspan=2>${tbean.tterm }</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom: 1px dotted gray">
		<th class="table-active" style="text-align: center">임금 비율</th>
		<td colspan=2>${tbean.twageratio }</td>
	</tr>
	<tr height=50 valign="middle" style="border-bottom:3px double black">
		<th class="table-active" style="text-align: center">비자 코드</th>
		<td colspan=2>${tbean.visa }</td>
	</tr>
</table>
<br>
<input type="button" value="수정" onClick="location.href='tcupdate.ad?anum=${tbean.anum}'" class="btn btn-primary">
<input type="button" value="삭제" onClick="location.href='tcdelete.ad?anum=${tbean.anum}'" class="btn btn-outline-danger">
</center>
<%@ include file="adbottom.jsp" %>