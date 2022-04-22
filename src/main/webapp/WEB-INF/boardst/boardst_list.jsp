<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp" %>
	<br><br>
	<center>
		<table width="1200px" style="text-align: center; width:1200px" class="table table-striped" > <!-- JH : 너비 70% -> 1200px로 수정함 -->
			<tr>
				<c:if test="${loginInfo.type=='student' }">
				<td colspan=6 align=right>
					<input type="button" value="질문 작성" class="btn btn-secondary btn-sm" onClick="location.href='insert.bst?pageNumber=${pageInfo.pageNumber}'">
				</td>
				</c:if>
			</tr>
			<tr style="border-bottom: 2px solid black;">
				<th width=30 >NO</th>
				<th width=60>과목</th>
				<c:if test="${loginInfo.type=='student' }">
				<th width=90>선생님</th>
				</c:if>
				<c:if test="${loginInfo.type=='teacher' }">
				<th width=90>학생ID</th>
				</c:if>
				<th width=450>제목</th>
				<th width=170>작성일</th>
				<th width=100>상태</th>
			</tr>
			<c:if test="${fn:length(boardArr) == 0 }">
				<tr>
					<td colspan=6 style="text-align: center; vertical-align: middle;" height=100px>작성한 질문이 없습니다</td>
				</tr>
			</c:if>
			<c:set var="contentNum" value="${(totalCount - ((pageInfo.pageNumber-1)*pageInfo.pageSize)) }"/>
			<c:forEach var="bd" items="${boardArr}">
			<tr>
				<th>${contentNum }</th>
				<c:set var="contentNum" value="${contentNum -1 }"/>
				<td>${bd.subject }</td>
				<c:if test="${loginInfo.type=='student' }">
				<td>${bd.teacher }</td>
				</c:if>
				<c:if test="${loginInfo.type=='teacher' }">
				<td>${bd.stuid }</td>
				</c:if>
				<td align=left>
					&nbsp;
					<a href="detail.bst?pageNumber=${pageInfo.pageNumber }&num=${bd.num}">${bd.title }</a>
				</td>
				<td><fmt:formatDate value="${bd.write_date }" type="both" pattern="yyyy/MM/dd HH:mm"/> </td>
				<c:if test="${bd.st_check == 'BR'}">
				<td><font color=gray><span class="badge rounded-pill bg-secondary">답변대기</span></font></td>
				</c:if>
				<c:if test="${bd.st_check == 'AR'}">
				<td><font color=blue><span class="badge rounded-pill bg-primary">답변완료</span></font></td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
		<br>
		${pageInfo.pagingHtml }
		
	</center>
	<br><br>
<%@ include file="../user/usbottom.jsp" %>