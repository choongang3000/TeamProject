<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
<!-- colist.jsp<br> -->
<script>
	function insert(){
		//alert(1)
		location.href="coinsert.ad";
	}
</script>

<style>
	.table{
		width:1300px;
		/*text-align: center;*/
	}
	
	
</style>

  <center>
  <br><h2>강의 목록</h2><br>
  	<form method="get" action="colist.ad" class="btn-group">
		<div class="input-group">
			<select name="whatColumn" class="form-control"> <!-- 미완성(대소문자 구분하는법) -->
				<option value="all">전체
				<option value="coname">강의명
				<option value="coteacher">강사명
				<option value="cosubject">과목명
			</select>
		<input type="text" name="keyword" class="form-control">
		<input type="submit" value="검색" class="btn btn-secondary btn-sm">
		</div>
	</form>
   </center>
   
   <br>
   <center>
   <table border="0" align="center" class="table table-striped" id="table">
	    <tr>
			<td colspan="9" align="right">
				<input type="button" value="강의추가" onClick="insert()" class="btn btn-secondary btn-sm">
			</td>
		<tr>
    	<tr height="30px" style="border-bottom: 2px solid black; text-align: center">
    		<th>번호</th>
    		<th>강의명</th>
    		<th>선생님</th>
    		<th>과목</th>
    		<th>이미지</th>
    		<th>영상</th>
    		<th>소개</th>
    		<th>가격</th>
    		<th>날짜</th>
    	</tr>
    	<!-- conum,coname,coteacher,cosubject,coimage,covideo,cocontent,coprice,coupload_date -->
    	<c:forEach var="list" items="${colist }">
    	<tr>
    		<td>${list.conum }</td>
    		<td>
    			<a href="codetail.ad?conum=${list.conum }&pageNumber=${pageInfo.pageNumber}">${list.coname }</a>
    		</td>
    		<td>${list.coteacher }</td>
    		<td>${list.cosubject }</td>
    		<td>
    			<%-- ${list.coimage } --%>
	    		<c:set var="lenimg" value="${fn:length(list.coimage) }"/>
	            <c:set var="img" value="${fn:substring(list.coimage,37,lenimg)}"/>
	            ${fn:substring(list.coimage,37,lenimg)}
    		</td>
    		<td>
    			<%-- ${list.covideo } --%>
    			<c:set var="lenvid" value="${fn:length(list.covideo) }"/>
            	<c:set var="vid" value="${fn:substring(list.covideo,37,lenvid)}"/>
            	<c:out value="${fn:substring(list.covideo,37,lenvid)}"/>
    		</td>
    		<td>${list.cocontent }</td>
    		<td><fmt:formatNumber value="${list.coprice }" pattern="#,###,###"/></td>
    		<td>
    			<fmt:formatDate value="${list.coupload_date }" pattern="yy-MM-dd"/>
    		</td>
    	</tr>
    	</c:forEach>
    </table>
    
    <br><br>
    ${pageInfo.pagingHtml }
	</center>

<%@ include file="../admin/adbottom.jsp" %> 