<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp"%>
<!-- 상단 선생님 탭 - 강의보러가기 버튼 클릭했을 때 보이는 화면  -->
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
				text-align:center;
				
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
		#teacher-img-line{
				border : 1px solid #D8D8D8;
				display : block;
				margin : 10px auto;
		}
		
		#teacher-img{
				margin : 30px 0px 0px 0px;
		}
		
		#category{
			   float:left;
			   text-align:center;
			   margin:80px 100px; /* 80px 위아래 auto 좌우 */
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
				width:1200px;
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
      	
      	#button1{ /* 수강신청 버튼 색상 설정 */
      			border : 1px solid #35BCAE;
		      	background-color:#35BCAE;
      	}
      	
      	#button2{ /* 강의질문 버튼 색상 설정 */
      			border : 1px solid gray;
		      	background-color: gray;
      	}
      	
      	#foot{
      			float:left;
      			width:100%;
      			text-align: center;
      	}
      	
</style>

<body>
			<div id="teacher-img-line">
			<c:if test="${comp.cosubject != 'ETC' }">
			<b>${comp.cosubject } 강사 - ${comp.coteacher } 선생님 / ${comp.introduction }</b>
			</c:if>
			<c:if test="${comp.cosubject == 'ETC' }">
			<b>종합반 강사 - ${comp.coteacher } 선생님 / ${comp.introduction }</b>
			</c:if>
			<img id="teacher-img" src="<%=request.getContextPath()%>/resources/images/${comp.coimage}" width=400 height=300>
			</div>
<section>
	<div id="main-title">
		<h1>개설 과목 리스트</h1>
		<table width="1200">
			<tr align="center" height="30px">
				<th>| 강의명 |</th>
				<th>| 강의소개 |</th>
				<th>| 가격 |</th>
				<th></th>
			</tr>
			<tr>
				<td colspan="4">
				<b><hr></b>
				</td>
			</tr>
			<c:forEach var="course" items="${list}">
			<tr>
				<td>
					<a href="detail.cos?conum=${course.conum }&pageNumber=${pageInfo.pageNumber }">${course.coname }</a>
				</td>
				<td>
					${course.cocontent }
				</td>
				<td align="right">
					<fmt:formatNumber value="${course.coprice}" pattern="#,###"/>원 &nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<a href="detail.cos?conum=${course.conum }&pageNumber=${pageInfo.pageNumber }"><button id="button1" type="button" class="btn btn-secondary btn-sm">수강신청 &nbsp;<img src="<%=request.getContextPath() %>/resources/images/icon/book-outline.svg" width="20" height="20"/></button></a> &nbsp;
					<a href="goshow.cos?conum=${course.conum }"><button id="button2" type="button" class="btn btn-secondary btn-sm">강의이동 &nbsp;<img src="<%=request.getContextPath() %>/resources/images/icon/재생 아이콘.png" width="20" height="20"/></button></a>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<hr>
				</td>
			</tr>
			</c:forEach>
		</table>
		${pageInfo.pagingHtml }
	</div>
</section>

<div id=foot>
<hr>
<br><br>	
<%@ include file="../user/usbottom.jsp"%>
</div>
</body>