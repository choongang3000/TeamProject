<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
    <!-- sublist.jsp<br> -->
    <style>
    	.table{
    		width:1200px;
    		text-align: center;
    	}
    
    </style>
    <script>
    	function update(){
    		location.href="subupdate.ad?subnum=${list.subnum }";
    	}
    	
    	function delete(){
    		location.href="subdelete.ad?subnum=${list.subnum }";
    	}
    </script>
    <center>
    <br>
    <h2><b>과목 카테고리</b></h2>
    
    <br>
    
    <form action="subinsert.ad" method="post" class="btn-group">
    	<input type="text" name="subname" placeholder="추가할 과목명 입력" class="form-control" required>
    	<input type="submit" value="과목추가" class="btn btn-secondary btn-sm">
    </form>
    
    <!-- <br> -->
    
    <form action="subupdate.ad" method="post" class="btn-group">
    	<input type="hidden" name="subnum" value="${subbean.subnum }">
    	<input type="text" name="subname" value="${subbean.subname }" placeholder="수정할 과목명 입력" class="form-control" required>
    	<input type="submit" value="과목수정" class="btn btn-secondary btn-sm">
    </form>
    
    <br><br>
    
    <table border="0" width="60%" align="center" class="table table-striped" id="table">
    	<tr height="30px" style="border-bottom: 2px solid black; text-align: center">
    		<th>번호</th>
    		<th>과목명</th>
    		<th>수정</th>
    		<th>삭제</th>
    	</tr>
    	<c:forEach var="list" items="${sublist }">
    	<tr height="10px" style="vertical-align: middle;">
	    	<td>${list.subnum }</td>
	    	<td>${list.subname }</td>
	    	<!-- <td><input type="button" value="수정" class="btn btn-secondary btn-sm" onClick="update()"></td> -->
	    	<!-- <td><input type="button" value="삭제" class="btn btn-secondary btn-sm" onClick="delete()"></td> -->
	    	<td><input type="button" class="btn btn-outline-primary" onClick="location.href='subupdate.ad?subnum=${list.subnum }'" value="수정"></td>
    		<td><input type="button" class="btn btn-outline-danger" onClick="location.href='subdelete.ad?subnum=${list.subnum }'" value="삭제"></td>
    	</tr>
    	</c:forEach>
    </table> 
    
    </center>
    
<%@ include file="../admin/adbottom.jsp" %>   
