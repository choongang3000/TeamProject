<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
    <!-- sublist.jsp<br> -->
    <style>
    	body{
    		margin: auto;
    	}
    	table{
    		margin: auto;
    		text-align: center;
    	}
    
    </style>
    
    <center>
    <h2>과목 카테고리</h2>
    
    <br>
    
    <form action="subinsert.ad" method="post">
    	과목명 <input type="text" name="subname">
    	<input type="submit" value="과목추가">
    </form>
    
    <br>
    
    <form action="subupdate.ad" method="post">
    	<input type="hidden" name="subnum" value="${subbean.subnum }">
    	수정명 <input type="text" name="subname" value="${subbean.subname }">
    	<input type="submit" value="과목수정">
    </form>
    
    <br><br>
    
    <table border="0" width="60%" align="center">
    	<tr height="30px">
    		<td>번호</td>
    		<td>과목명</td>
    		<td>수정</td>
    		<td>삭제</td>
    	</tr>
    	<c:forEach var="list" items="${sublist }">
    	<tr height="10px">
	    	<td>${list.subnum }</td>
	    	<td>${list.subname }</td>
	    	<td><a href="subupdate.ad?subnum=${list.subnum }">수정</a></td>
    		<td><a href="subdelete.ad?subnum=${list.subnum }">삭제</a></td>	
    	</tr>
    	</c:forEach>
    </table> 
    
    </center>
    
<%@ include file="../admin/adbottom.jsp" %>   
