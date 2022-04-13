<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="ustop.jsp"%>
<center>ushome -> 상단 강의 탭 눌렀을 때 보일 화면(ussubject.jsp)</center>

<style type="text/css">

		* { /* 기본적인 마진,패딩 없앰*/
			margin:0;
			padding:0; 
			text-decoration : none; /* 밑줄 없애기 */
			list-style : none; /* 불릿 없애기 */
		}
		
		
		body { 
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
				float:left;
				width:800px;
				text-align:center;
				margin:80px auto;
				background-color:#F6F6F6;
				/*border-radius:10px;*/ /* 테두리 둥글게 설정 */
		}
		
		button{
			   background-color:gray;
			   width:110px;
			   border:0;
			   outline:0;
		}
		
		#td-title{ /* 강의 제목 설정 */
			   text-align:left;
		}
		
		
		footer {
				height: 120;
      			display:block;
				position: absolute;
				left: 200;
				bottom: 0;
				width: 100%;
				text-align: center;
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
</style>

<body>
	<aside>
		<table id="category">
			<tr id="category-top">
				<td><a href="subject-main.us"><font color="white"><b>전체강좌</b></font></a></td>
			</tr>
			<tr id="category-center">
				<td><a href="subject-main-java.us"><font color="6C757D"><b>JAVA</b></font></a></td>
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

	<section>
	<div id="main-title"> <!-- 웹 페이지를 구성하는 건 요소 -->
		<h1>온강 강사진들~~</h1>
			<table width="800">
				<tr>
					<td><img id="teacher-img" src="<%=request.getContextPath() %>/resources/images/강사1-작은이미지.png" width="80" height="80"/></td>
					<td id="td-title">비전공자를 위한 자바 프로그래밍 입문</td>
					<td><a href=""><button id="button1" type="button" class="btn btn-secondary btn-sm">수강신청&nbsp<img src="<%=request.getContextPath() %>/resources/images/book-outline.svg" width="20" height="20"/></button></a> &nbsp
						<a href=""><button id="button2" type="button" class="btn btn-secondary btn-sm">강의질문 &nbsp<img src="<%=request.getContextPath() %>/resources/images/질문게시판.svg" width="20" height="20"/></button></a>
					</td>	
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<tr>
					<td><img id="teacher-img" src="<%=request.getContextPath() %>/resources/images/강사2-작은이미지.png" width="80" height="80"/></td>
					<td id="td-title">자바 실전 프로그래밍</td>
					<td>
						<a href=""><button id="button1" type="button" class="btn btn-secondary btn-sm">수강신청 &nbsp<img src="<%=request.getContextPath() %>/resources/images/book-outline.svg" width="20" height="20"/></button></a> &nbsp
						<a href=""><button id="button2" type="button" class="btn btn-secondary btn-sm">강의질문 &nbsp<img src="<%=request.getContextPath() %>/resources/images/질문게시판.svg" width="20" height="20"/></button></a>
					</td>
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
			</table>	
	</div>
	</section>
</body>

<%@include file="usbottom.jsp"%>
