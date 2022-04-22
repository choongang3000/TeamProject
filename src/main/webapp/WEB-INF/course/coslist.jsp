<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>   
<%@ include file="../user/ustop.jsp"%> 

<%-- <c:choose>
<c:when test="${sessionScope.loginInfo != null}">
<c:if test="${sessionScope.loginInfo.type eq 'admin' }">
<h1>강좌 리스트 화면 - coslist.jsp</h1>
</c:if>
</c:when>
</c:choose> --%>
<!-- <a href="start.jsp">시작페이지</a> <br>
<a href="logout.jsp">로그아웃</a> -->


<script type="text/javascript">
		function insert(){
			location.href = "coinsert.cos"; 
		}//insert
</script>

<style type="text/css">


/* COSListController / coslist.jsp / CoSDao / CoSBean / course.xml */
	
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
				width:1000px; /* 전 : 920px -> 후 : 1000px */
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
      	form{
      			margin:auto;
      	}
      	
      	#b-update{
      			border-radius : 3px;
      			border : 1px solid blue;
      			background-color: blue;
      			color: white;
      			height: 32px;
      			width: 40px;
      	}

      	#b-delete{
      			border-radius : 3px;
      			border : 1px solid red;
      			background-color: red;
      			color: white;
      			height: 32px;
      			width: 40px;
      	}
      	
      	#b-insert{
      			border-radius : 3px;
      			border : 1px solid #690;
      			background-color: #690;
      			color: white;
      			height: 32px;
      			width: 80px;
      	}
      	
      	#searchbutton{
      			border-radius : 3px;
      			border : 1px solid #365E43;
      			background-color: #365E43;
      			color: white;
      			height: 32px;
      			width: 60px;
      	}
      	
       table{
    	
    	width:1000px;
    	text-align: center;
    	
    	}
</style>

<body>
	<aside>
		<table id="category">
 			<tr id="category-top">
				<td><a href="list.cos"><font color="white"><b>전체강좌</b></font></a></td>
			</tr>
			<c:forEach items="${subArr }" var="course">
			<c:if test="${course != 'ETC' }">
			<tr id="category-center">
				<td><a href="list.cos?cosubject=${course }"><font color="6C757D"><b>${course }</b></font></a></td>
			</tr>
			</c:if>
			</c:forEach>
			<tr id="category-center">
				<td><a href="list.cos?cosubject=ETC"><font color="6C757D"><b>종합반</b></font></a></td>
			</tr>
		</table>
	</aside>	

<section>
	<div id="main-title">
		<h1>강좌 리스트</h1>
		<form action="list.cos" method="GET">
			<select name="whatColumn">
				<option value="">선택
				<option value="coname">강의명
				<option value="coteacher">선생님
				<c:if test="${cosubject == null or cosubject == '' }">
				<option value="cosubject">과목명
				</c:if>
				<c:if test="${cosubject != null }">
				</c:if>
			</select>
			<input type="hidden" name="cosubject" value="${cosubject }">
			<input type="text" name="keyword">
			<input type="submit" value="검색" id="searchbutton">
		</form>
		<table> 
		
			<tr align="center" height="30px">
					<th align="center"><!-- | 강사 | --></th>
					<th align="center" width="40%"><!-- | 강의명 | --></th>
					<th align="center"><!-- | 가격 | --></th>
					<th align="center"><!-- 버튼 --></th>
				<c:if test="${sessionScope.loginInfo.type eq 'admin' }">
					<th align="right"><input id="b-insert" type="button" value="추가하기" onclick="insert()"></th>
				</c:if>
			</tr>
			<tr>
				<td colspan="5">
					<hr>
				</td>
			</tr>
			<c:if test="${fn:length(list) == 0 }">
			<tr>
				<td height=80px style="text-align: center; vertical-align: middle;" colspan=5>
					강의 목록이 없습니다
				</td>
			</tr>
			</c:if>
			<c:forEach var="course" items="${list}">
			<tr>
				<td align="center" width="15%"> <!-- JH : 화면 이동 매끄럽게 하기 위해서 width 고정함 -->
					<b>${course.coteacher }</b>선생님
					<img id="teacher-img" src="<%=request.getContextPath()%>/resources/images/${course.coimage}" width=80 height=80>
				</td>
				<%-- <td>
					<c:out value="${course.conum }" />
				</td>	 --%>			
				<td>
					&nbsp;&nbsp;&nbsp;<a href="detail.cos?conum=${course.conum }&pageNumber=${pageInfo.pageNumber }">${course.coname }</a>
				</td>
				<%-- <td>
					${course.cocontent }
				</td> --%>
				<td align=center>
					<fmt:formatNumber value="${course.coprice}" pattern="#,###"/>원 &nbsp;&nbsp;
				</td>
				<%--
				<c:choose>
					<c:when test="${sessionScope.loginInfo.type eq 'admin' }">
						<%@ include file="../admin/adtop.jsp" %>
					</c:when>
					<c:otherwise>
						<%@ include file="../user/ustop.jsp"%>
					</c:otherwise>
				</c:choose>
				 --%>
				<c:if test="${sessionScope.loginInfo.type eq 'student'}"> 
				<td>
					<a href="detail.cos?conum=${course.conum }&pageNumber=${pageInfo.pageNumber }"><button id="button1" type="button" class="btn btn-secondary btn-sm">수강신청 &nbsp;<img src="<%=request.getContextPath() %>/resources/images/icon/book-outline.svg" width="20" height="20"/></button></a> &nbsp;
					<a href="goshow.cos?conum=${course.conum }"><button id="button2" type="button" class="btn btn-secondary btn-sm">강의이동 &nbsp;<img src="<%=request.getContextPath() %>/resources/images/icon/재생 아이콘.png" width="20" height="20"/></button></a>
				</td>
				</c:if>
				<c:if test="${sessionScope.loginInfo.type eq 'admin'}">
				<td>
					<a href="coupdate.cos?conum=${course.conum }&pageNumber=${pageInfo.pageNumber }&cosubject=${cosubject}"><input id="b-update" type="button" class="w-50 btn btn-primary btn-mg" value="수정"></a>&nbsp;
					<a href="codelete.cos?conum=${course.conum }&pageNumber=${pageInfo.pageNumber }&cosubject=${cosubject}&whatColumn=${whatColumn}&keyword=${keyword}"><input id="b-delete" type="button" class="w-50 btn btn-primary btn-mg" value="삭제"></a>
				</td>
				</c:if>
				
			</tr>
			</c:forEach>
		</table>
		 <div class="btn-toolbar" role="toolbar">
        ${pageInfo.pagingHtml }
      </div>
	</div>
</section>

<div id=foot>
<br><br>	
<%@ include file="../user/usbottom.jsp"%>
</div>
</body>