<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp" %>

<script type="text/javascript">
	function gotolist(){
		location.href = "list.cos";

	}
</script>

<style>
	* { /* 기본적인 마진,패딩 없앰*/
		margin:0;
		padding:0; 
		text-decoration : none; /* 밑줄 없애기 */
		list-style : none; /* 불릿 없애기 */
	}
		
	body { 
		width:100%;
		margin-top:30px;
	}
	
	#button1{ /* 강의목록 버튼 색상 설정 */
    	border : 1px solid #35BCAE;
	   	background-color:#35BCAE;
    }
      	
    #button2{ /* 뒤로가기 버튼 색상 설정 */
    	border : 1px solid gray;
	   	background-color: gray;
    }
    
    .text-muted{
    	font-size: 20px;
    }
    
    center{
    	background-color: #F6F6F6;
    	height : 50%
    }
</style>

<br>
<center>

<br>

	<div> <!-- 강의이름&선생님 -->
		<p class="text-muted">${course.coteacher}의 ${course.coname }</p>
	</div>
	
	<br>
	
	<div id="covideo"> <!-- 강의영상출력 -->
				<%-- poster="<%=request.getContextPath()%>/resources/images/온강 로고.png" --%>
		<video
				src="<%=request.getContextPath() %>/resources/images/${course.covideo}"
				poster="<%=request.getContextPath()%>/resources/images/로고짤.gif"
				width="500"
				controls>
		</video>
	</div>
	
	<br>
	
	<div>
		<!-- <input type="button" value="뒤로가기" onClick="history.back();"> -->
		<!-- <input type="button" value="강의목록" onClick="gotolist()"> -->
		<a onclick="history.back();"><button id="button2" type="button" class="btn btn-secondary btn-sm">뒤로가기 &nbsp;<img src="<%=request.getContextPath() %>/resources/images/icon/뒤로가기(흰색).svg" width="20" height="20"/></button></a>
		<a onclick="gotolist()"><button id="button1" type="button" class="btn btn-secondary btn-sm">강의목록 &nbsp;<img src="<%=request.getContextPath() %>/resources/images/icon/과목.png" width="20" height="20"/></button></a>
	</div>

</center>
<br>
<%@ include file="../user/usbottom.jsp" %>


<%-- 
<table border=1>
	<tr>
		<th>${course.coname }</th>
	</tr>
	<tr>
		<th>${course.covideo }</th>
	</tr>
	<tr>
		<td>
			<video
				src="<%=request.getContextPath() %>/resources/images/${course.covideo}"
				poster="<%=request.getContextPath()%>/resources/images/${course.covideo}"
				width="800"
				controls autoplay>
			</video>
		</td>
	</tr>
</table>
 --%>
