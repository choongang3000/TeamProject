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
	
	#b-insert{
		border-radius : 3px;
    	border : 1px solid #35BCAE;
    	background-color: #35BCAE;
    	color: white;
    	height: 32px;
    	width: 80px;
	}

    #b-reset{
    	border-radius : 3px;
    	border : 1px solid blue;
    	background-color: blue;
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
    
    #img1{
    	float:left;
    }
    
    #img2{
    	float:left;
    }
    
    #img3{
    	float:left;
    }
    
</style>

<script src="<%= request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript">
	function readURL1(event) {
			if(document.getElementById("img1") != null){
				var img = document.getElementById("img");
				document.querySelector("div#image_container1").removeChild(img1);
			}
			var reader = new FileReader();
			reader.onload = function(event) { 
				var img = document.createElement("img");
				img.setAttribute("id","img1");
				img.setAttribute("src", event.target.result);
				img.setAttribute("width","200px");
				img.setAttribute("height","200px");				
				document.querySelector("div#image_container1").appendChild(img); 
			}; 
			
			reader.readAsDataURL(event.target.files[0]);
	}
	
	function readURL2(event) {
			if(document.getElementById("img2") != null){
				var img = document.getElementById("img");
				document.querySelector("div#image_container2").removeChild(img2);
			}
			var reader = new FileReader();
			reader.onload = function(event) { 
				var img = document.createElement("img");
				img.setAttribute("id","img2");
				img.setAttribute("src", event.target.result);
				img.setAttribute("width","300px");
				img.setAttribute("height","200px");				
				document.querySelector("div#image_container2").appendChild(img); 
			}; 
			
			reader.readAsDataURL(event.target.files[0]);
	}
	
	function readURL3(event) {
			if(document.getElementById("img3") != null){
				var img = document.getElementById("img");
				document.querySelector("div#image_container3").removeChild(img3);
			}
			var reader = new FileReader();
			reader.onload = function(event) { 
				var img = document.createElement("img");
				img.setAttribute("id","img3");
				img.setAttribute("src", event.target.result);
				img.setAttribute("width","200px");
				img.setAttribute("height","200px");				
				document.querySelector("div#image_container3").appendChild(img); 
			}; 
			
			reader.readAsDataURL(event.target.files[0]);
	}
</script>

<br><br>
<center><!-- 업데이트인지?? BTBean 소문자/대문자 상관없다고 함.. -->
	<form:form commandName="BTBean" method="post" action="insert.bt" enctype="multipart/form-data">
		<!-- form에 type="file"이 있을 경우 반드시 enctype 써야함.. 메서드 post타입으로 꼭 지정하기..-->
		<table border="1" width="1200px" >
			<tr height="50" style="border-bottom: 1px dotted gray">
				<td align="center" id="input-text" style="border-right: 1px dotted gray" width="40%">과목</td>
				<td>&nbsp;
					<select name="subject">
							<option value="">전체 선택</option>
							<c:forEach var="i" items="${sub }">
								<option value="${i }">${i }</option>
							</c:forEach>
					</select>
							<br>
							<form:errors cssClass="err" path="subject" />
				</td>
			</tr>
			<tr height="50" style="border-bottom: 1px dotted gray">	
				<td align="center" style="border-right: 1px dotted gray" width="40%">퀴즈 이미지</td>
				<td>&nbsp;&nbsp;<input type="file" name="upload2" value="파일선택"  onchange="readURL1(event);" required> <!-- input에 required를 붙이면 예쁘게 유효성 검사가 뜬다규~★ -->
				<br><form:errors cssClass="err" path="quizimg" />
				
				<!-- <img id="blah" src="#" alt="image" width="100px" height="100px"/> -->
	<!-- 			&nbsp;<img id="blah" src="" /> -->
				<%-- <%=request.getContextPath() %>/resources/images/1퀴즈.png" alt="image" width="100px" height="100px/> --%>
				</td>
			</tr>    
			<tr height="50" style="border-bottom: 1px dotted gray">
				<td align="center" style="border-right: 1px dotted gray" width="40%">문제 이미지</td>
				<td>&nbsp;&nbsp;<input type="file" name="upload1" value="파일선택" onchange="readURL2(event);" required> <!-- MultipartFile의 변수명(Bean에서 설정)과 name의 변수명은 일치해야함 -->
				<br><form:errors cssClass="err" path="examfile" />
				</td>
			</tr>
			<tr height="50" style="border-bottom: 1px dotted gray">	
				<td align="center" style="border-right: 1px dotted gray" width="40%">정답 이미지</td>
				<td>&nbsp;&nbsp;<input type="file" name="upload3" value="파일선택" onchange="readURL3(event);" required>
				<br><form:errors cssClass="err" path="movingimg" />
				</td>
			</tr>    
			<tr height="50" style="border-bottom: 1px dotted gray">	
				<td align="center" style="border-right: 1px dotted gray" width="40%">정답 입력(Alert 내용)</td>
				<td>&nbsp;&nbsp;<input type="text" name="answer" value="${BTBean.answer }" required>
				<br><form:errors cssClass="err" path="answer" />
				</td>
			</tr>    
			<tr height="50" style="border-bottom: 1px dotted gray">	
				<td align="center" style="border-right: 1px dotted gray" width="40%">비밀번호</td>
				<td>&nbsp;&nbsp;<input type="password" name="passwd" value="${BTBean.passwd }" required>
				<br><form:errors cssClass="err" path="passwd" />
				</td>
			</tr>    
			<tr height="50" style="border-bottom: 1px dotted gray" align="center">
				<td align="center" style="border-right: 1px dotted gray" width="40%" >
					예시 화면/미리 보기
				</td>
				<td width="60%" align="center">
					<div id="image_container1"><img id="img1" src="<%=request.getContextPath() %>/resources/images/${bt.quizimg}" width="200px" height="200px"></div>
					<div id="image_container2"><img id="img2" src="<%=request.getContextPath() %>/resources/images/${bt.examfile}" width="300px" height="200px"></div>
					<div id="image_container3"><img id="img3" src="<%=request.getContextPath() %>/resources/images/${bt.movingimg}" width="200px" height="200px"></div>
				</td>
			</tr>
			<tr height="70">
				<td colspan="2" align="center">
					<input id="b-insert" type="submit" value="글쓰기">
					<input id="b-reset" type="reset" value="다시작성">
					<input id="b-list" type="button" value="목록보기" onClick="location.href='list.bt'"> <!--onClick="list.jsp"만 했을 땐 이동이 안되니깐 onClick="location.href='list.jsp'"사용  -->
					<!-- 원하는 위치가고 싶을 때 a태그를 쓰거나.. location사용... -->
				</td>
			</tr>
		</table>	
	</form:form>
</center>
<br><br><br>
<%@include file="../user/usbottom.jsp"%>