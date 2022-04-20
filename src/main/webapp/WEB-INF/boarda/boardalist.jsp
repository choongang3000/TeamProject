<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<c:choose>
	<c:when test="${sessionScope.loginInfo.type eq 'admin' }">
		<%@ include file="../admin/adtop.jsp" %>
	</c:when>
	<c:otherwise>
		<%@ include file="../user/ustop.jsp"%>
	</c:otherwise>
</c:choose>
<style>

		* { /* 기본적인 마진,패딩 없앰*/
			margin:0;
			padding:0; 
			text-decoration : none; /* 밑줄 없애기 */
			list-style : none; /* 불릿 없애기 */
			/*position : absolute;*/
		}
		
		body { 
				margin-top:30px;
		}


	   	#container  {
    		width:65%;
			margin:auto;
    	}
    	
    	.count{
    		text-align : left;
    	/*	margin : 20px 20px;	*/
    		margin : auto;
    	}
    	.accordion-button{
    		background-color:#D9E5FF;
    	}
    	.accordion-collapse{
    		text-align : left;
	   	/*	margin : 20px 20px; */
    		margin : auto;
    	}
    	
    	
</style>
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>  
	function insert() {
		location.href = "insert.ba";
	}
	
	$(document).ready(function(){
	      $("a[id=navselect]").click(
	         function(){$(this).addClass("active");},
	         function(){$(this).removeClass("active");}         
	      );
	 });
</script>
<%
	String[] heading = {"flush-headingOne", "flush-headingTwo", "flush-headingThree", "flush-headingFour",
		"flush-headingFive", "flush-headingSix", "flush-headingSeven", "flush-headingEight", "flush-headingNine",
		"flush-headingTen"};
	String[] collapse = {"flush-collapseOne", "flush-collapseTwo", "flush-collapseThree", "flush-collapseFour",
		"flush-collapseFive", "flush-collapseSix", "flush-collapseSeven", "flush-collapseEight", "flush-collapseNine",
		"flush-collapseTen"};
%>
<c:set var="heading" value="<%=heading%>" />
<c:set var="collapse" value="<%=collapse%>" />

<body>
<div id=container>
<nav class="navbar navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand">FAQ 자주 묻는 질문</a>

		<form action="list.ba" method="get" class="d-flex">
			<input class="form-control me-2" type="search" placeholder="Search" name="keyword">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
	</div>
</nav>
<ul class="nav nav-tabs">
	<li class="nav-item"><a class="nav-link" id="navselect" href="list.ba">자주 찾는 질문</a></li>
	<li class="nav-item"><a class="nav-link" id="navselect" href="list.ba?bacategory=회원">회원</a></li>
	<li class="nav-item"><a class="nav-link" id="navselect" href="list.ba?bacategory=클래스이용">클래스 이용</a></li>
	<li class="nav-item"><a class="nav-link" id="navselect" href="list.ba?bacategory=학습">학습</a></li>
	<li class="nav-item"><a class="nav-link" id="navselect" href="list.ba?bacategory=강좌관리">강좌 관리</a></li>
	<li class="nav-item"><a class="nav-link" id="navselect" href="list.ba?bacategory=기타">기타</a></li>
</ul>
<c:if test="${sessionScope.loginInfo.type eq 'admin' }">
		<input class="btn btn-secondary btn-sm" type="button" value="삽입" onClick="insert()">
</c:if>
<div class="count">총${totalCount}개</div>
<div class="accordion accordion-flush" id="accordionFlushExample">
	<c:forEach var="i" begin="0" end="${fn:length(list)-1 }">
		<div class="accordion-item">
			<h2 class="accordion-header" id="${heading[i] }">
				<c:set var="s" value="#" />
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="${s}${collapse[i] }" aria-expanded="false" aria-controls="${collapse[i] }">
					${list[i].basubject }
				</button>
			</h2>
			<div id="${collapse[i] }" class="accordion-collapse collapse" aria-labelledby="${heading[i] }" data-bs-parent="#accordionFlushExample">
				<div class="accordion-body">
					${list[i].bacontent }
					<c:if test="${list[i].baimage != null }">
						<img src="<%request.getContextPath(); %>/resources/images/re.gif" width="" height="">
					</c:if>
					<%-- <c:if test="${list[i].bafile != null }">
						파일 출력 설정 위치 
					</c:if> --%>
					<c:if test="${sessionScope.loginInfo.type eq 'admin' }">
						<input class="btn btn-secondary btn-sm" type="submit" value="수정" onClick="location.href='update.ba?banum=${list[i].banum}&pageNumber=${pageInfo.pageNumber}'">
					<input class="btn btn-secondary btn-sm" type="submit" value="삭제" onClick="location.href='delete.ba?banum=${list[i].banum}&pageNumber=${pageInfo.pageNumber}'">
					</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
</div>
<center>${pageInfo.pagingHtml}</center>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>
<%@ include file="boarda_bottom.jsp"%>
