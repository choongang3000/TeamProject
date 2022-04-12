<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
 
<!--  회원정보<br> -->
 
<center>
	 <h3> 회원정보 </h3>
<table border="1" width="600">
	<tr>
    		<td>아이디</td>
    		<td>${bean.id }</td>
    </tr>
    <tr>
    		<td>비밀번호</td>
    		<td>***************</td>
    </tr>
    <tr>
    		<td>이름</td>
    		<td>${bean.name }</td>
    </tr>
	<tr>
    		<td>TYPE</td>
    		<td>${bean.type }</td>
    </tr>
    <tr>
    		<td>생년월일</td>
    		<td>${bean.rrn1 } - *******</td>
    </tr>
    <tr>
    		<td>지역정보</td>
    		<td>${bean.addr}</td>
    </tr>
    <tr>
    		<td>이메일</td>
    		<td>${bean.email }</td>
    </tr>
    <tr>
    		<td>휴대폰</td>
    		<td>${bean.phone1 } - ${bean.phone1 } - ${bean.phone1 }</td>
    </tr>
    <tr>
    		<td>회원가입일</td>
    		<td>${bean.joindate }</td>
    </tr>
    <tr>
    		<td colspan="2">
    			<a href="list.prd">뒤로가기</a>
    		</td>
    </tr>
    
    
</table>

</center>