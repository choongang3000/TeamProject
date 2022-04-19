<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 카카오 로그인 시작 -->
<a href="https://kauth.kakao.com/oauth/authorize?client_id=ab47803f90790112e45956f811b8e370&redirect_uri=http://localhost:8080/auth/kakao/callback&response_type=code">
<img class="login-frm-btn" src="<%=request.getContextPath()%>/resources/images/icon/kakao_login_medium_narrow.png" />
</a>
<!-- 카카오 로그인 끝 -->