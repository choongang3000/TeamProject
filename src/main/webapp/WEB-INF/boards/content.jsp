<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<%@ include file="../admin/adtop.jsp" %>
   <!--  content.jsp<br> -->
<style type="text/css">
	body{
		text-align:center;
	}
	table{
		margin:auto;
		width:800px;
	}
	img{
		width:300px;
	}
	.star-rating {
	  /* border:solid 1px #ccc; */
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

<br><br>
<h3>수강후기</h3>
<br>
<table width="60%">
	<tr height="40" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">
			글번호
		</td>
		<td align="center">
			${bb.num } <!-- 글번호 -->
		</td>
		<td align="center" bgcolor="#DCDCDC">
			조회수
		</td>
		<td align="center">
			${bb.readcount } <!-- 조회수 -->
		</td>
	</tr>
	
	<tr height="40" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">
			작성자
		</td>
		<td align="center">
			${bb.writer } <!-- 작성자 -->
		</td>
		<td align="center" bgcolor="#DCDCDC">
			작성일 
		</td>	
		<td align="center">
			<fmt:formatDate value="${bb.reg_date }" pattern="yyyy/MM/dd HH:mm" type="both"/> <!-- 작성일 -->
		</td>	
	</tr>
	
	<tr height="40" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">과목명</td>
		<td align="center">${bb.coname}</td>
		<td align="center" bgcolor="#DCDCDC">선생님</td>
		<td align="center">${bb.coteacher}</td>
	</tr>
	
	<tr height="40" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">
			별점
		</td>
		<td align="center">
			<div class="star-rating">
				  <input type="radio" id="5-stars" name="rating" value="5" onclick="return(false);" <c:if test="${5 eq bb.rating }">checked</c:if>>
				  <label for="5-stars" class="star">&#9733;</label>
				  
				  <input type="radio" id="4-stars" name="rating" value="4" onclick="return(false);" <c:if test="${4 eq bb.rating }">checked</c:if>>
				  <label for="4-stars" class="star">&#9733;</label>
				  
				  <input type="radio" id="3-stars" name="rating" value="3" onclick="return(false);" <c:if test="${3 eq bb.rating }">checked</c:if>>
				  <label for="3-stars" class="star">&#9733;</label>
				  
				  <input type="radio" id="2-stars" name="rating" value="2" onclick="return(false);" <c:if test="${2 eq bb.rating }">checked</c:if>>
				  <label for="2-stars" class="star">&#9733;</label>
				  
				  <input type="radio" id="1-star" name="rating" value="1" onclick="return(false);" <c:if test="${1 eq bb.rating }">checked</c:if>>
				  <label for="1-star" class="star">&#9733;</label>
			</div>
		</td>	
		<td align="center" bgcolor="#DCDCDC">
			글제목
		</td>	
		<td align="center">
			${bb.title } <!-- 글제목 -->
		</td>	
	</tr>
	
	<tr height="400" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC">
			이미지
		</td>
		<td colspan="3" align="center">
			<c:if test='${imageName != null }'>
				<img src="<%=request.getContextPath() %>/resources/${imageName}"> <!-- 이미지 -->
			</c:if>
			<c:if test='${imageName == null }'>
				이미지 없음
			</c:if>
		</td>
	</tr>
	
	<tr height="300" style="border-top: solid black 1px">
		<td align="center" bgcolor="#DCDCDC"> 
			글내용
		</td>	
		<td colspan="3" align="center">
			${bb.content } <!-- 글내용 -->
		</td>
	</tr>
	<tr align="center" height="50" style="border-top: solid black 1px">
		<td colspan="4">
		<br>
			<input class="btn btn-secondary btn-sm" type="submit" value="글수정" onClick="location.href='update.bs?num=${bb.num}&pageNumber=${pageNumber}'">
			<input class="btn btn-secondary btn-sm" type="button" value="글삭제" onClick="location.href='delete.bs?num=${bb.num}&pageNumber=${pageNumber}'">
			<input class="btn btn-secondary btn-sm" type="button" value="글목록" onClick="location.href='list.bs?pageNumber=${pageNumber}'">
			<%-- <c:if test="">
			<input class="btn btn-secondary btn-sm" type="button" value="답글쓰기" onClick="location.href='reply.bs?ref=${bb.ref}&re_step=${bb.re_step}&re_level=${bb.re_level}&pageNumber=${pageNumber}'">
			</c:if> --%>
		</td>
	</tr>
</table>
<%@ include file="../admin/adbottom.jsp" %>