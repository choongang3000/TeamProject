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



<c:if test="${fn:length(cosArr) == 0 }">
<div>
	<br><br>
	<h3>강의가 존재하지 않습니다</h3>
</div>
</c:if>
<c:forEach var="cos" items="${cosArr}">
<div class="card text-center col-sm-8">
  <div class="card-header">
    <ul class="nav nav-pills card-header-pills">
      <li class="nav-item">
        <a class="nav-link" id="atag" href="tcCourseDetail.mem?conum=${cos.conum }&pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}">자세히 보기</a>
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
<%@ include file="../user/usbottom.jsp" %>