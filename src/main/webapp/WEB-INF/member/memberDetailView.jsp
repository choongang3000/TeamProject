<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@ include file="../user/ustop.jsp"%>
<!--  회원정보<br> -->
 
<center>
	 <h3> 회원정보 </h3>
<table border="1" width="600">
	<tr>
    		<td>아이디</td>
    		<td>${mbean.id }</td>
    </tr>
    <tr>
    		<td>비밀번호</td>
    		<td>***************</td>
    </tr>
    <tr>
    		<td>이름</td>
    		<td>${mbean.aname }</td>
    </tr>
	<tr>
    		<td>TYPE</td>
    		<td>${mbean.type }</td>
    </tr>
    <tr>
    		<td>생년월일</td>
    		<td>${mbean.rrn1 } - *******</td>
    </tr>
    <tr>
    		<td>지역정보</td>
    		<td>${mbean.addr}</td>
    </tr>
    <tr>
    		<td>이메일</td>
    		<td>${mbean.email }</td>
    </tr>
    <tr>
    		<td>휴대폰</td>
    		<td>${mbean.phone1 } - ${mbean.phone1 } - ${mbean.phone1 }</td>
    </tr>
    <tr>
    		<td>회원가입일</td>
    		<td>${mbean.joindate }</td>
    </tr>
    <tr>
    		<td colspan="2">
    			<input class="btn btn-secondary btn-sm" type="button" value="뒤로가기" onClick="history.back()">
    			<input class="btn btn-secondary btn-sm" type="submit" value="내 정보 관리" onClick="location.href='update.mem?anum=${loginInfo.anum}'"></a>
    		</td>
    </tr>
    
</table>

</center>