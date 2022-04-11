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
	body{
		width:70%;
		margin:auto;
	}
</style>
  <center>
  <h2>강의 목록</h2><br><br>
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
   
   <br><br>
   
   <table border="0" width="80%" height="60%" align="center">
	    <tr height="30">
			<td colspan="9" align="right">
				<input type="button" value="강의추가" onClick="insert()" class="btn btn-secondary btn-sm">
			</td>
		<tr>
    	<tr height="40px">
    		<td>번호</td>
    		<td>강의명</td>
    		<td>담당선생님</td>
    		<td>강의과목</td>
    		<td>강의이미지</td>
    		<td>강의영상</td>
    		<td>강의소개</td>
    		<td>강의가격</td>
    		<td>업로드날짜</td>
    	</tr>
    	<c:forEach var="list" items="${colist }">
    	<!-- conum,coname,coteacher,cosubject,coimage,covideo,cocontent,coprice,coupload_date -->
    	<tr height="40px">
    		<td>${list.conum }</td>
    		<td><a href="codetail.ad?conum=${list.conum }">${list.coname }</a></td>
    		<td>${list.coteacher }</td>
    		<td>${list.cosubject }</td>
    		<td>${list.coimage }</td>
    		<td>${list.covideo }</td>
    		<td>${list.cocontent }</td>
    		<td><fmt:formatNumber value="${list.coprice }" pattern="#,###,###"/></td>
    		<td>
    			<fmt:formatDate value="${list.coupload_date }" pattern="yyyy-MM-dd"/>
    		</td>
    	</tr>
    	</c:forEach>
    </table>
   
<%@ include file="../admin/adbottom.jsp" %>   