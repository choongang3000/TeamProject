<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %> <!-- 현재시간기능임포트 -->
<%@ page import="java.text.SimpleDateFormat" %>

<%@include file="./../common/common.jsp" %>

<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
<style type="text/css">
	.err{
	font-size: 9pt;
	color: red;
	font-weight: bold;
	}
</style> 
<script type="text/javascript">
    function test() {
      var p1 = document.getElementById('pw').value;
      var p2 = document.getElementById('pw2').value;
      
      if(p1.length < 6) {
              alert('입력한 글자가 6글자 이상이어야 합니다.');
              return false;
          }
          
          if( p1 != p2 ) {
            alert("비밀번호불일치");
            return false;
          } else{
            alert("비밀번호가 일치합니다");
            return true;
          }
    }
</script>
<!-- MemberRegisterController에서 member\memberRegisterForm.jsp<br> -->
<h2>회원 가입 화면</h2>
<form:form commandName="member" method="post" action="register.mem"> 
<!-- register.mem => MemberRegisterController -->
	
		<p>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value="">
			<form:errors cssClass="err" path="id" />
		</p>
		<p>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="">
			<form:errors cssClass="err" path="name" />
		</p>
		<p>
			<label for="pw">비밀번호</label>
			<input type="password" name="pw" id="pw" value="">
			<form:errors cssClass="err" path="pw" />
		</p>	
		<!-- 비밀번호일치를 확인하는 기능 추가해보자.... -->
		<p>
			<label for="pw">비밀번호확인</label>
			<input type="password" name="pw2" id="pw2" value="">
			<form:errors cssClass="err" path="pw2" />
		</p>
		<p>
			<label for="type">type</label>
			<input type="radio" name="type" id="type" value="typeA">typeA
			<input type="radio" name="type" id="type" value="typeB">typeB
			<form:errors cssClass="err" path="type" />
		</p>	
		<p>
			<label for="rrn1">생년월일</label>
			<input type="text" name="rrn1" id="rrn1" value=""> 
			-
			<label for="rrn2"></label>
			<input type="text" name="rrn2" id="rrn2" value="*******">
		</p>	
		
		<p>
			<label for="phone1">연락처</label>
			<input type="text" name="phone1" id="phone1" value="010"> 
			-
			<label for="phone2"></label>
			<input type="text" name="phone2" id="phone2" value="">
			-
			<label for="phone3"></label>
			<input type="text" name="phone3" id="phone3" value="">
		</p>
		<p>
			<label for="pw">지역정보</label>
			<input type="text" name="addr" id="addr" value="">
			<form:errors cssClass="err" path="addr" />
		</p>
			<p>
			<label for="joindate">가입일(현재시간)</label><!--  자동으로 현재년월일/히든 -->
			<input type="hidden" name="joindate" id="joindate" value=" <%= sf.format(nowTime) %> ">
			<form:errors cssClass="err" path="joindate" />
		</p>
			
		<p>
			<input type="submit" value="입력완료" >		
		</p>
	</form:form>