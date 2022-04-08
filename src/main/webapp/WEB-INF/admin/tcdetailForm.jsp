<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../admin/adtop.jsp" %>
<center>
<table border=1 class="table table-bordered border-dark" style="width:700px;">
	<tr>
		<td colspan=3 align=right class="table-active">
			<input type="button" value="목록으로" onClick="location.href='tclist.ad'" class="btn btn-secondary btn-sm">
		</td>
	</tr>
	<tr>
		<td rowspan=4 width=130>
			<img src="<%=request.getContextPath() %>/resources/${tbean.t_image}" width=130 height=180>
		</td>
		<th class="table-active" style="text-align: center">이름</th>
		<td align=center>${tbean.aname }</td>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">ID</th>
		<td align=center>${tbean.id }</td>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">PW</th>
		<td align=center>${tbean.pw }</td>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">타입</th>
		<td align=center>
			${tbean.type }
		</td>
	</tr>
	<tr>
		<th colspan=3 class="table-active" style="text-align: center">◈ 개인 정보 ◈</th>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">전화번호</th>
		<td colspan=2>${tbean.phone1 }-${tbean.phone2 }-${tbean.phone3 }</td>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">E-mail</th>
		<td colspan=2>${tbean.email }</td>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">주소</th>
		<td colspan=2>${tbean.addr }</td>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">주민등록번호</th>
		<td colspan=2>${tbean.rrn1 }-${tbean.rrn2 }</td>
	</tr>
	<tr>
		<th colspan=3 class="table-active" style="text-align: center">◈ 계약 관련 ◈</th>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">과목</th>
		<td colspan=2>${tbean.subject }</td>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">소개글</th>
		<td colspan=2>${tbean.introduction }</td>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">가입일</th>
		<td colspan=2>${tbean.joindate }</td>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">계약 만료일</th>
		<td colspan=2>${tbean.tterm }</td>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">임금 비율</th>
		<td colspan=2>${tbean.twageratio }</td>
	</tr>
	<tr>
		<th class="table-active" style="text-align: center">비자 코드</th>
		<td colspan=2>${tbean.visa }</td>
	</tr>
</table>
<br>
<input type="button" value="수정" onClick="location.href='tcupdate.ad?anum=${tbean.anum}'" class="btn btn-primary">
<input type="button" value="삭제" onClick="location.href='tcdelete.ad?anum=${tbean.anum}'" class="btn btn-outline-danger">
</center>
<%@ include file="../admin/adbottom.jsp" %>