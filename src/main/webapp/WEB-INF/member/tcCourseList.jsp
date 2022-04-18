<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp" %>
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
	    $('a[id=atag]').hover(
		    function () { $(this).addClass('active'); },
		    function () { $(this).removeClass('active'); }
		);
	});
</script>


<style>
	.col-sm-8{
		margin-top: 10px;
		margin-bottom: 20px;
	}
</style>
<center>
<nav class="navbar navbar-light bg-light" style="width: 75%">
	<div class="container-fluid">
		<a class="navbar-brand">내 강의 목록</a>
		<form action="tcCourseList.mem" method="get" class="d-flex">
			<select class="form-select form-select-sm" name="whatColumn">
				<option value="">과목 선택</option>
				<c:forEach var="sub" items="${subArr }">
				<option value="${sub }">${sub }</option>
				</c:forEach>
			</select>
			&nbsp;
			<input class="form-control me-2" type="search" placeholder="Search" name="keyword">
			<button class="btn btn-outline-primary" type="submit">Search</button>
		</form>
	</div>
</nav>
<c:forEach var="cos" items="${cosArr}">
<div class="card text-center col-sm-8">
  <div class="card-header">
    <ul class="nav nav-pills card-header-pills">
      <li class="nav-item">
        <a class="nav-link" id="atag" href="#">자세히 보기</a>
      </li>
      <!-- 
      <li class="nav-item">
        <a class="nav-link" id="atag" href="#">Link</a>
      </li>
       -->
    </ul>
  </div>
  <div class="card-body">
    <h5 class="card-title"><b>${cos.cosubject }</b></h5>
    <p class="card-text"><b>${cos.coname }</b></p>
    <fmt:parseDate var="coupload_date" value="${cos.coupload_date }" pattern="yyyy-MM-dd" />
    <fmt:formatDate var="upload_date"  value="${coupload_date }" type="both" pattern="yyyy-MM-dd"/>
    <p class="card-text">강의 추가일 : ${upload_date }</p>
  </div>
</div>
</c:forEach>
${pageInfo.pagingHtml }
</center>
<br><br>

<!-- <div class="row justify-content-center">
  <div class="col-sm-8">
    <div class="card bg-light">
      <div class="card-body grid">
        <h5 class="card-title">CSS</h5>
        <p class="card-text">지옥에서 돌아온 git-hub(1)</p>
        <input class="btn btn-secondary" type="button" value="자세히 보기" onClick="location.href='#'">
      </div>
    </div>
  </div>
</div> -->
	<!-- <table border=1>
		<tr>
			<th>NO</th>
			<th>과목</th>
			<th>강의명</th>
			<th>강의 추가일</th>
			<th>상세보기</th>
		</tr>
	</table> -->
<%@ include file="../user/usbottom.jsp" %>