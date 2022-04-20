<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="membertop.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	a{
		text-decoration: none;
	}
	a:hover{
		text-decoration: underline;
	}
	.wrapper {
	  display: grid;
	  place-items: center;
	  min-height: 100vh;
	}
	
	.content {
	  font-size: 2rem;
	  padding: 3rem;
	  border-radius: 1rem;
	}
</style>

<!-- loginForm.mem => MemberLoginController로 이동 -->
<div class="wrapper">
<div class="content">
<form:form method="post" action="loginForm.mem" commandname="loginBean">
	<table border="1" width="300" height="150px" class="table table-borderless" style="width:400px">
		<tr>
			<td><h2>On_인터넷 강의 로그인</h2></td>
		</tr>
		<tr>
			<td><input type="text" class="form-control form-control-lg" name="id" placeholder="아이디" required></td>
		</tr>
		<tr>
			<td><input type="password" class="form-control form-control-lg" name="pw" placeholder="비밀번호" required></td>
		</tr>
		<tr>
			<td align=right>
				<a href="findid.mem" class="link-secondary" >아이디 찾기</a>&nbsp;|&nbsp;
				<a href="findpw.mem" class="link-secondary" >비밀번호 찾기</a>&nbsp;|&nbsp;
				<a href="register.mem" class="link-secondary" >회원가입</a>
				<!-- <input type="button" value="회원목록보기"  onClick="memberList()"> -->
			</td>
		</tr>
		<tr>
			<td>
				<div class="d-grid gap-1 col-12 mx-auto">
				  <button class="btn btn-primary" type="submit">로그인</button>
				</div>
			</td>
		</tr>
	</table>
</form:form>
<%@ include file="kakaologin.jsp" %>
</div>
</div>
<%@ include file="memberbottom.jsp" %>