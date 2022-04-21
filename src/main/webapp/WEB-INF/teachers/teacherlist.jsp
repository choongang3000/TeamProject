<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		/* img Layout */
		#teacher-img{
				
				border : 1px solid #D8D8D8;
				display : block;
				margin : 10px auto;
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
				float:left;
				width:800px;
				text-align:center;
				margin:80px auto;
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
			<c:forEach items="${subArr }" var="course">
			<c:if test="${course != 'ETC' }">
			<tr id="category-center">
				<td><a href="list.te?cosubject=${course }"><font color="6C757D"><b>${course }</b></font></a></td>
			</tr>
			</c:if>
			</c:forEach>
			<tr id="category-center">
				<td><a href="list.te?cosubject=ETC"><font color="6C757D"><b>종합반</b></font></a></td>
			</tr>
		</table>
	</aside>	

<div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      <%-- <c:forEach var="te" items="${list }"> --%>
      <c:forEach var="te" items="${list }">
 			 <div class ="container" id="div_teacher" align="center">
 			 	<c:if test="${te.subject=='ETC'}"><!-- 참,거짓 판별할 때 EL안에다가 써줘야함 -->
					<h5><b>종합반</b>강사</h5>
				</c:if>
				<c:if test="${te.subject !='ETC'}">
 			 	<h5><b>${te.subject }</b>강사</h5>
 			 	</c:if>
 			 	<div align="center">
 			 		<img id="teacher-img" src="<%=request.getContextPath() %>/resources/images/${te.t_image}" width=180 height=250/>
	 			 		<div class="card-body">
	 			 		<h5><b>${te.tname }</b>선생님</h5>
	 			 			<p class="card-text">${te.introduction}</p>
	 			 			<a href="sublist.te?tname=${te.tname}"><button id="button3" type="button" class="btn btn-secondary btn-sm"><font color="white">강의 보러가기<img src="<%=request.getContextPath() %>/resources/images/icon/하늘색이동화살표.png" width="40" height="20"/></font></button></a>
	 			 		</div>
 			 	</div>
 			 </div>
       </c:forEach>
      </div>
    </div>
    <div align="center">${pageInfo.pagingHtml}</div>
</div>
${t_image }

<div id=foot>
<%@ include file="../user/usbottom.jsp"%>
</div>
</body>

