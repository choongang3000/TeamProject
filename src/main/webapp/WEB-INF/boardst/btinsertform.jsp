<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="bttop.jsp"%>
<!--
insert.bt 요청 => BTInsertController
-->

<style type="text/css">
	#input-text{
		width : 450;
	}  

	.err {
	color: red;
	font-weight: bold;
	}

	table{
		background: #E4F2FF;
	}
</style>

<br><br>
<center><!-- 업데이트인지?? BTBean 소문자/대문자 상관없다고 함.. -->
	<form:form commandName="BTBean" method="post" action="insert.bt" enctype="multipart/form-data">
		<!-- form에 type="file"이 있을 경우 반드시 enctype 써야함.. 메서드 post타입으로 꼭 지정하기..-->
		<table border="1" width="700">
			<tr>
				<td colspan="2" align="right"><a href="list.bt">글목록</a></td><!-- 보고 있던 페이지로 가라고 설정해두지 않아서 글목록을 누르면 목록 1페이지로 돌아감 -->
			</tr>
			<tr>
				<td align="center" id="input-text">과목</td>
				<td>
					<select name="subject">
							<option value="">전체 선택</option>
							<c:forEach var="i" items="${sub }">
								<option value="${i }">${i }</option>
							</c:forEach>
							<br>
					</select>
							<form:errors cssClass="err" path="subject" />
				</td>
			</tr>
			<tr>	
				<td align="center">퀴즈 이미지</td>
				<td><input type="file" name="upload2" value="파일선택">
				<br><form:errors cssClass="err" path="quizimg" />
				</td>
			</tr>    
			<tr>
				<td align="center">문제 이미지</td>
				<td><input type="file" name="upload1" value="파일선택"> <!-- MultipartFile의 변수명(Bean에서 설정)과 name의 변수명은 일치해야함 -->
				<br><form:errors cssClass="err" path="examfile" />
				</td>
			</tr>
			<tr>	
				<td align="center">정답 이미지</td>
				<td><input type="file" name="upload3" value="파일선택">
				<br><form:errors cssClass="err" path="movingimg" />
				</td>
			</tr>    
			<tr>	
				<td align="center">정답 입력(Alert 내용)</td>
				<td><input type="text" name="answer" value="${BTBean.answer }">
				<br><form:errors cssClass="err" path="answer" />
				</td>
			</tr>    
			<tr>	
				<td align="center">비밀번호</td>
				<td><input type="password" name="passwd" value="${BTBean.passwd }">
				<br><form:errors cssClass="err" path="passwd" />
				</td>
			</tr>    
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onClick="location.href='list.bt'"> <!--onClick="list.jsp"만 했을 땐 이동이 안되니깐 onClick="location.href='list.jsp'"사용  -->
					<!-- 원하는 위치가고 싶을 때 a태그를 쓰거나.. location사용... -->
				</td>
			</tr>
		</table>	
	</form:form>
</center>
<br><br><br>
<%@include file="../user/usbottom.jsp"%>