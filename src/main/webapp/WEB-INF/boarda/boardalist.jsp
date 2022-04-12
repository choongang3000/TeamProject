<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adtop.jsp"%>
<style>
	body {
		width:1500px;
		margin: 0 auto;
	}
</style>
<script>
	function insert() {
		location.href = "insert.ba";
	}
	
<%
	String[] heading = {"flush-headingOne", "flush-headingTwo", "flush-headingThree", "flush-headingFour",
		"flush-headingFive", "flush-headingSix", "flush-headingSeven", "flush-headingEight", "flush-headingNine",
		"flush-headingTen"};
	String[] collapse = {"flush-collapseOne", "flush-collapseTwo", "flush-collapseThree", "flush-collapseFour",
		"flush-collapseFive", "flush-collapseSix", "flush-collapseSeven", "flush-collapseEight", "flush-collapseNine",
		"flush-collapseTen"};
%>
</script>
<c:set var="heading" value="<%=heading%>" />
<c:set var="collapse" value="<%=collapse%>" />

<body>
<nav class="navbar navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand">FAQ 자주 묻는 질문</a>

		<form action="list.ba" method="get" class="d-flex">
			<input class="form-control me-2" type="search" placeholder="Search"
				aria-label="Search" name="keyword">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
	</div>
</nav>
<input class="btn btn-secondary btn-sm" type="button" value="삽입" onClick="insert()">
총${totalCount}개
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
					<!--<c:if test="${list[i].bafile != null }">
						<!-- 파일 출력 설정 위치 
					</c:if>-->
					<input class="btn btn-secondary btn-sm" type="submit" value="수정" onClick="location.href='update.ba?banum=${list[i].banum}&pageNumber=${pageInfo.pageNumber}'">
					<input class="btn btn-secondary btn-sm" type="submit" value="삭제" onClick="location.href='delete.ba?banum=${list[i].banum}&pageNumber=${pageInfo.pageNumber}'">
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<center>${pageInfo.pagingHtml}</center>
</body>