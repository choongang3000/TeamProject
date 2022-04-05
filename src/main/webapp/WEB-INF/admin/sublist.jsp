<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
    <!-- sublist.jsp<br> -->
    <center>
    <h2>과목 카테고리</h2>
    <br>
    <form action="subinsert.ad" method="post">
    	과목명: <input type="text" name="subname">
    	<input type="submit" value="과목추가">
    </form>
    
    <br>
    
    <table border="1">
    	<tr>
    		<td>번호</td>
    		<td>과목명</td>
    		<td>수정</td>
    		<td>삭제</td>
    	</tr>
    	<c:forEach var="list" items="${sublist }">
    	<tr>
	    	<td>${list.subnum }</td>
	    	<td>${list.subname }</td>
	    	<td>수정</td>
    		<td>삭제</td>	
    	</tr>
    	</c:forEach>
    </table>
    </center>
    