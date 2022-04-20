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
<%-- 
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "findid.mem",
				type : "POST",
				data : {
					aname : $("#aname").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
 --%>
<!-- loginForm.mem => MemberLoginController로 이동 -->
<div class="wrapper">
<div class="content">
<form:form method="post" action="findid.mem" commandName="loginBean">
	<center>
	<table border="1" width="300" height="150px" class="table table-borderless" style="width:400px">
		<tr>
			<td><h2>On_인터넷 아이디 찾기</h2></td>
		</tr>
		<tr>
			<td><input type="text" class="form-control form-control-lg" id="aname" name="aname" placeholder="이름" required></td>
		</tr>
		<tr>
			<td><input type="text" class="form-control form-control-lg" id="email" name="email" placeholder="E-mail" required></td>
		</tr>
		<tr>
			<td align=right>
				<a href="loginForm.mem" class="link-secondary" >로그인</a>&nbsp;|&nbsp;
				<a href="findpw.mem" class="link-secondary" >비밀번호 찾기</a>&nbsp;|&nbsp;
				<a href="register.mem" class="link-secondary" >회원가입</a>
				<!-- <input type="button" value="회원목록보기"  onClick="memberList()"> -->
			</td>
		</tr>
		<tr>
			<td>
				<div class="d-grid gap-1 col-12 mx-auto">
				  <button class="btn btn-primary" id="findBtn" type="submit">아이디 찾기</button>
				</div>
			</td>
		</tr>
	</table>
	</center>
</form:form>
</div>
</div>
<%@ include file="memberbottom.jsp" %>