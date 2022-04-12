<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="membertop.jsp" %>

<style>
	a{
		text-decoration: none;
	}
	a:hover{
		text-decoration: underline;
	}
</style>

<!-- loginForm.mem => MemberLoginController로 이동 -->
<form:form method="post" action="loginForm.mem" commandName="loginBean">
	<center>
	<table border="1" width="300" height="150px" class="table table-borderless" style="width:400px">
		<tr>
			<td><h2>On_인터넷 비밀번호 찾기</h2></td>
		</tr>
		<tr>
			<td><input type="text" class="form-control form-control-lg" name="id" placeholder="아이디" required></td>
		</tr>
		<tr>
			<td><input type="password" class="form-control form-control-lg" name="email" placeholder="E-mail" required></td>
		</tr>
		<tr>
			<td align=right>
				<a href="loginForm.mem" class="link-secondary" >로그인</a>&nbsp;|&nbsp;
				<a href="findid.mem" class="link-secondary" >아이디 찾기</a>&nbsp;|&nbsp;
				<a href="register.mem" class="link-secondary" >회원가입</a>
				<!-- <input type="button" value="회원목록보기"  onClick="memberList()"> -->
			</td>
		</tr>
		<tr>
			<td>
				<div class="d-grid gap-1 col-12 mx-auto">
				  <button class="btn btn-primary" type="submit">비밀번호 찾기</button>
				</div>
			</td>
		</tr>
	</table>
	</center>
</form:form>
<%@ include file="memberbottom.jsp" %>