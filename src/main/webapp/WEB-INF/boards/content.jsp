<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<%@ include file="../user/ustop.jsp" %>
   <!--  content.jsp<br> -->
<style type="text/css">
	.star-rating {
	  display:flex;
	  flex-direction: row-reverse;
	  font-size:1.5em;
	  justify-content:space-around;
	  padding:0 .2em;
	  text-align:center;
	  width:5em;
	}
	
	.star-rating input {
	  display:none;
	}
	
	.star-rating label {
	  color:#ccc;
	  cursor:pointer;
	}
	
	.star-rating :checked ~ label {
	  color:#f90;
	}
	
	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  color:#fc0;
	}
	
	article {
	  background-color:#ffe;
	  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
	  color:#006;
	  font-family:cursive;
	  font-style:italic;
	  margin:4em;
	  max-width:30em;
	  padding:2em;
	}
	
	.con{
		height:60px;
		width:500px;
		position:absolute;
		margin:auto;
		left:0;
		right:0;
		top:0;
		bottom:0;
	}
	
	.fa-star{
		font-size:65px;
	}	 	
</style>
<center>
<nav class="navbar navbar-light bg-light" style="width: 75%">
	<div class="container-fluid">
		<a class="navbar-brand"><b>&nbsp;수강 후기</b></a>
	</div>
</nav>
<br>
<table class="table" style="width:60%">
	<tr style="height:40px" class="bg-light">
		<td align=left width=70%>&nbsp;&nbsp;${bb.title } <font color="lightgray">|</font> <b>${bb.coname}[${bb.coteacher}]</b></td>
		<td align=right><font color="gray">작성일</font>&nbsp;<fmt:formatDate value="${bb.reg_date }" pattern="yyyy-MM-dd HH:mm" type="both"/>&nbsp;&nbsp;</td>
	</tr>
	<tr style="height:30px">
		<td align=left><font color="gray">&nbsp;&nbsp;작성자</font>&nbsp;${bb.writer }</td>
		<td align=right><font color="gray">조회 수</font> ${bb.readcount }&nbsp;&nbsp;</td>
	</tr>
	<tr style="height:30px" class="bg-light">
		<c:if test="${bb.rating == null }">
			<td colspan=2>&nbsp;&nbsp;<font color="gray">별점</font>&nbsp;미평가</td>
		</c:if>
		<c:if test="${bb.rating == '1' }">
			<td colspan=2>&nbsp;&nbsp;<font color="gray">별점</font>&nbsp;<font color="#ffd400">★</font></td>
		</c:if>
		<c:if test="${bb.rating == '2' }">
			<td colspan=2>&nbsp;&nbsp;<font color="gray">별점</font>&nbsp;<font color="#ffd400">★★</font></td>
		</c:if>
		<c:if test="${bb.rating == '3' }">
			<td colspan=2>&nbsp;&nbsp;<font color="gray">별점</font>&nbsp;<font color="#ffd400">★★★</font></td>
		</c:if>
		<c:if test="${bb.rating == '4' }">
			<td colspan=2>&nbsp;&nbsp;<font color="gray">별점</font>&nbsp;<font color="#ffd400">★★★★</font></td>
		</c:if>
		<c:if test="${bb.rating == '5' }">
			<td colspan=2>&nbsp;&nbsp;<font color="gray">별점</font>&nbsp;<font color="#ffd400">★★★★★</font></td>
		</c:if>
	</tr>
	<c:if test='${imageName != null }'>
	<tr>
		<td colspan="2" align="center">
				<img src="<%=request.getContextPath() %>/resources/${imageName}"> <!-- 이미지 -->
		</td>
	</tr>
	</c:if>
	<tr>
		<td colspan="2" align="center">
			<textarea style="width:100%; height:300px; resize:none;" disabled style="resize: none;">${bb.content }</textarea>
		</td>
	</tr>
	<tr align="center" style="border-top: solid black 1px; height:60px; vertical-align: middle;" class="bg-light">
		<td colspan="2">
			<c:if test="${loginInfo.id == bb.writer}">
			<input class="btn btn-primary" type="submit" value="후기 수정" onClick="location.href='update.bs?num=${bb.num}&pageNumber=${pageNumber}'">
			</c:if>
			<input class="btn btn-secondary" type="button" value="후기 목록" onClick="location.href='list.bs?pageNumber=${pageNumber}'">
			<c:if test="${loginInfo.id == bb.writer || loginInfo.type == 'admin'}">
			<input class="btn btn-outline-danger" type="button" value="삭제" onClick="location.href='delete.bs?num=${bb.num}&pageNumber=${pageNumber}'">
			</c:if>
			<%-- <c:if test="">
			<input class="btn btn-secondary btn-sm" type="button" value="답글쓰기" onClick="location.href='reply.bs?ref=${bb.ref}&re_step=${bb.re_step}&re_level=${bb.re_level}&pageNumber=${pageNumber}'">
			</c:if> --%>
		</td>
	</tr>
</table>
</center>
<br>
<%@ include file="../user/usbottom.jsp" %>