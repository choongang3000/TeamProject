<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="membertop.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function login(){
		location.href="loginForm.mem";
	}
	
	function findPw(){
		location.href="findpw.mem";
	}
	
	function register(){
		location.href="register.mem";
	}
</script>
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
<div class="b-example-divider"></div>

<div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <!-- <h5 class="modal-title">Modal title</h5> -->
        <h2 class="fw-bold mb-0">아이디 찾기</h2>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
      </div>

      <div class="modal-body p-5 pt-0">
        <form:form method="post" action="findid.mem" commandName="loginBean">
          <div class="form-floating mb-3">
            <input type="text" name="aname" class="form-control rounded-4" id="floatingInput" placeholder="이름" required>
            <label for="floatingInput">이름</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" name="email" class="form-control rounded-4" id="floatingPassword" placeholder="E-mail" required>
            <label for="floatingPassword">이메일</label>
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">아이디 찾기</button>
           <hr class="my-4">
           <h2 class="fs-5 fw-bold mb-3">기타</h2>
          <button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4" onClick="login()">
            <svg class="bi me-1" width="16" height="16"></svg>로그인
          </button>
          <button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4" onClick="findPw()">
            <svg class="bi me-1" width="16" height="16"></svg>비밀번호 찾기
          </button>
          <button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4" onClick="register()">
            <svg class="bi me-1" width="16" height="16"></svg>회원가입
          </button>
        </form:form>
      </div>
    </div>
  </div>
</div>

<div class="b-example-divider"></div>


    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      
  </body>
</html>
<%@ include file="memberbottom.jsp" %>