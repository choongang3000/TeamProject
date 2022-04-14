<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp"%>

<style type="text/css">

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
		h1 {
				font:20px "맑은 고딕",돋움,arial; 
				color:#fff;
				background-color:#690;
				border-radius:20px;
				padding:5px 30px;
				margin-bottom:20px;
		}
		
		#teacherbox{
				margin : 70px auto;
		}
		
		/* img Layout */
		#teacher-img{
				border : 1px solid #D8D8D8;
				display : block;
				text-align:center;
		}
		
		#category{
			   float:left;
			   text-align:center;
			   margin:80px 7%; /* 80px 위아래 auto 좌우 */
			   width:200px;
			   border : 1px solid #D8D8D8;
			   background-color:#F6F6F6;
			   /*border : 1px solid #D8D8D8; 바탕보다 진한 테두리 설정*/
			   /*float:left;*/
		}
		
		#category-top{
			    background-color:#365E43;
			    border : 1px solid #365E43;
			    width:200px;
			    line-height: 50px;
		}
		
		#category-center{
		 		background-color:white;
				text-color : #6C757D;
			    border : 1px solid #D8D8D8;
			    width:200px;
				line-height: 40px;
				text-decoration : none;
		}
		
		#main-title {
				width:800px;
				text-align:center;
				margin:30px auto;
				background-color:#F6F6F6;
				/*border-radius:10px;*/ /* 테두리 둥글게 설정 */
		}
		
		#td-title{ /* 강의 제목 설정 */
			   text-align:left;
		}
	
      	a {
      			text-decoration : none; 
      	}

      	
      	#button3{ /* 강의질문 버튼 색상 설정 */
				border : 1px solid #35BCAE;
		      	background-color:#35BCAE;
		      	 width:120px;
		}

		#foot{
      			width:100%;
      			text-align: center;
      	}

      	center{
      	 		width:100%
      	 }
      	.album py-5 bg-light{
      		margin:80px; /* 80px 위아래 auto 좌우 */
      	}
      	#div_teacher{
      		margin-bottom: 100px;
      	}
</style>

<body>
	<aside>
		<table id="category">
			<tr id="category-top">
				<td><a href="list.te"><font color="white"><b>과목별 선생님</b></font></a></td>
			</tr>
			<tr id="category-center">
				<td><a href=""><font color="6C757D"><b>JAVA</b></font></a></td>
			</tr>
			<tr id="category-center">
				<td><a href=""><font color="6C757D"><b>DB</b></font></a></td>
			</tr>
			<tr id="category-center">
				<td><a href=""><font color="6C757D"><b>JSP</b></font></a></td>
			</tr>
			<tr id="category-center">
				<td><a href=""><font color="6C757D"><b>CSS</b></font></a></td>
			</tr>
			<tr id="category-center">
				<td><a href=""><font color="6C757D"><b>HTML</b></font></a></td>
			</tr>
		</table>
	</aside>	
<%-- 
<div class="container">

 			<div class ="container" id="div_teacher" align="center">
 			<div id="teacherbox" align="center">
 			 	<c:if test="${bean.subject=='ETC'}"><!-- 참,거짓 판별할 때 EL안에다가 써줘야함 -->
					<h5><b>종합반</b>강사</h5><br>
				</c:if>
				<c:if test="${bean.subject !='ETC'}">
 			 	<h5><b>${bean.subject }</b>강사</h5><br>
 			 	</c:if>
 			 		<img id="teacher-img" src="<%=request.getContextPath() %>/resources/images/${bean.t_image}" width=300 height=300/>
	 			 		<div class="card-body">
	 			 		<h5><b>${bean.tname }</b>선생님</h5>
	 			 			<p class="card-text" align="center">${bean.introduction}</p>
	 			 		</div>
 			</div>
</div> --%>
	
	<div id="main-title">
		<h1>개설 과목</h1>
		<table width="800">
			<tr>
				<th align="center">이미지</th>
				<th align="center">강의명</th>
				<th align="center">설명</th>
				<th align="center">가격</th>
				<th align="center">버튼</th>
			</tr>
		 	<c:forEach var="course" items="${list}"> 
			<tr>
				<td>
					<img id="teacher-img" src="<%=request.getContextPath()%>/resources/images/${course.coimage}" width=80 height=80>
				</td>
				<td>
					<a href="detail.cos?conum=${course.conum }&pageNumber=${pageInfo.pageNumber }">${course.coname }</a>
				</td>
				<td>
					${course.cocontent }
				</td>
				<td>
					<fmt:formatNumber value="${course.coprice}" pattern="#,###"/>원
				</td>
				<td>
					<a href=""><button id="button1" type="button" class="btn btn-secondary btn-sm">수강신청 &nbsp;<img src="<%=request.getContextPath() %>/resources/images/book-outline.svg" width="20" height="20"/></button></a> &nbsp;
					<a href=""><button id="button2" type="button" class="btn btn-secondary btn-sm">강의질문 &nbsp;<img src="<%=request.getContextPath() %>/resources/images/질문게시판.svg" width="20" height="20"/></button></a>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<hr>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
    <hr>
</div>

<div id=foot>
<%@ include file="../user/usbottom.jsp"%>
</div>
</body>