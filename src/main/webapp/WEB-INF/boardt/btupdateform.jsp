<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="bttop.jsp"%>
<!--
update.bt 요청 => BoardUpdateController   
-->

<style>
	.err{
		color:red;
		font-weight:bold;
	}
	
	table{
		background: #E4F2FF;
	}
	
	#input-text{
		width : 450;
	}
	
	#b-update{
    	border-radius : 3px;
    	border : 1px solid blue;
    	background-color: blue;
    	color: white;
    	height: 32px;
    	width: 80px;
    }
    
    #b-reset{
    	border-radius : 3px;
    	border : 1px solid #35BCAE;
    	background-color: #35BCAE;
    	color: white;
    	height: 32px;
    	width: 80px;
    }
    
    #b-list{
    	border-radius : 3px;
    	border : 1px solid gray;
    	background-color: gray;
    	color: white;
    	height: 32px;
    	width: 80px;
    }
    
</style>
<br><br><br>
<center>
<!-- BTBean으로 담아서 넘겨줘용 -->
<form:form commandName="bt" method="post" action="update.bt?pageNumber=${pageNumber}" enctype="multipart/form-data">
	<br><br>
		<input type="hidden" name="num" value="${bt.num}">
		<table border="1" width="700">
			<tr height="50">
				<td align="center" id="input-text">과목</td>
				<td> 
					<select name="subject">
							<option value="">전체 선택</option>
							<c:forEach var="i" items="${sub }">
								<option value="${i }"<c:if test="${bt.subject == i}">selected</c:if>>
									${i }
								</option>
							</c:forEach>
					</select>
				<br><form:errors cssClass="err" path="subject" />
				</td>
			</tr>
			<tr height="50">
				<td align="center" id="input-text">퀴즈 이미지</td>
				<td><input type="file" name="upload2" value="파일선택"> <!-- MultipartFile의 변수명(Bean에서 설정)과 name의 변수명은 일치해야함 -->
				<br><form:errors cssClass="err" path="quizimg" />
				</td>
			</tr>
			<tr height="50">
				<td align="center" id="input-text">문제 이미지</td>
				<td><input type="file" name="upload1" value="파일선택">
				<br><form:errors cssClass="err" path="examfile" />
				</td>
			</tr>
			<tr height="50">	
				<td align="center">정답 이미지</td>
				<td><input type="file" name="upload3" value="파일선택">
				<br><form:errors cssClass="err" path="movingimg" />
				</td>
			</tr>    
			<tr height="50">	
				<td align="center">정답 입력(Alert 내용)</td>
				<td><input type="text" name="answer" value="${bt.answer }">
				<br><form:errors cssClass="err" path="answer" />
				</td>
			</tr>
			<tr height="50">
				<td align="center">비밀번호</td>
				<td>
					<input type="password" name="passwd">
					<form:errors path="passwd" cssClass="err"/>
				</td>
			</tr>
			<tr height="50">
				<td colspan="2" align="center">
					<input id="b-update" type="submit" value="수정완료">
					<input id="b-reset" type="reset" value="입력리셋">
					<input id="b-list" type="button" value="목록보기" onClick="location.href='list.bt?pageNumber=${pageNumber}'">
				</td>
			</tr>
	</table>
</form:form>
</center> 
<%@include file="../user/usbottom.jsp"%>