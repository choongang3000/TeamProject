<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp" %>
<!-- list.jsp<br> -->

<script>
	function insert(){
		location.href = "insert.bs";
	}
/* 
	var rating = $('.review .rating');
	rating.each(function(){
		var targetScore = $(this).attr('data-rate');
		$(this).find('svg:nth-child(-n+' + targetScore +')').css({color:'#F05522'});
	});
	
	var userScore = $('#makeStar');
	userScore.change(function(){
		var userScoreNum = $(this).val();
		console.log(userScoreNum);
		$('.make_star svg').css({color:'#000'});
		$('.make_star svg:nth-child(-n' + userScoreNum +')').css({color:'#F05522'});
	});
	
	$('.make_star svg').click(function({
		var targetNum = $(this).index +1 ;
		$('.make_star svg').css({color:'#000'});
		$('.make_star svg:nth-child(-n+' + targetNum +')').css({color:'#F05522'});
	});
	
 */
 </script>
    
<style>
	.star-rating {
	  border:solid 1px #ccc;
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
<%-- 
<br><br>
<h2 align="center">수강 후기 게시판(전체글:${totalCount })</h2>
<center>
<br>
<div  class="input-prepend">
	<form method="get" action="list.bs" class="btn-group">
		<div class="input-group">
			<select name="whatColumn" class="form-control">
				<option value="all">전체글
				<option value="writer">작성자
				<option value="title">제목
			</select>

		<input type="text" name="keyword" class="form-control">
		<input type="submit" value="검색" class="btn btn-secondary btn-sm">
		</div>
	</form>
</div>
 --%>
<br><br>
<center>
<nav class="navbar navbar-light bg-light" style="width: 1200px">
	<div class="container-fluid">
		<a class="navbar-brand"><b>&nbsp;수강 후기 게시판</b></a>
		<form action="list.bs" method="get" class="d-flex">
			<select class="form-select form-select-sm" name="whatColumn" style="height:35px; width:100px;">
				<option value="all">전체글
				<option value="coname">강의명
				<option value="writer">작성자
				<option value="title">제목
			</select>
			&nbsp;
			<input class="form-control me-2" type="text" placeholder="Search" name="keyword" style="height:35px; width:120px;">
			<button class="btn btn-outline-primary" type="submit" style="height:35px; width:70px;">검색</button>
		</form>
	</div>
</nav>
<table class="table" border="0" align="center" style="width:1200px">
	
	<tr height="40" bgcolor="#DCDCDC" style="border-bottom: 3px double black;"> <!-- 목록제목 -->
		<td align="center" width=5%><b>번호</b></td>
		<td align="center" width=20%><b>제목</b></td>
		<td align="center"><b>강의명</b></td>
		<td align="center"><b>강의평가</b></td>
		<td align="center"><b>작성자</b></td> <!-- 추후 삭제예정 -->
		<td align="center"><b>작성일</b></td>
		<td align="center"><b>조회수</b></td>
	</tr>
	
	<c:if test="${fn:length(list) == 0 }">
	<tr>
		<td colspan="7" align="center"><h3>후기를 찾을 수 없습니다.</h3></td>
	<tr>
	</c:if>
	
	
	<c:set var="contentNum" value="${(totalCount - ((pageInfo.pageNumber-1)*pageInfo.pageSize)) }"/> <!-- 글번호 계산 -->
	
	<c:forEach var="list" items="${list }">
	<tr height="40">
		<td align="center">${contentNum}</td> <!-- 글번호 -->
		
		<c:set var="contentNum" value="${contentNum -1 }"/> <!-- 1씩 감소시켜서 조회 -->
		<td><!-- 제목부분 -->
			<c:if test="${list.re_level > 0 }"> <!-- 답글이 1개 이상일 경우 -->
			<c:set var="wid" value="${list.re_level * 20 }"/> <!-- 답글쓰기할때 공백처리 -->
				<img src="<%=request.getContextPath() %>/resources/images/level.gif" width="${wid }" height="15">
				<img src="<%=request.getContextPath() %>/resources/images/re.gif">
			</c:if>
			
			<a href="detail.bs?num=${list.num }&pageNumber=${pageInfo.pageNumber}">${list.title }</a> <!-- 글제목(글 상세보기) -->
			
			<c:if test="${list.readcount >= 10 }"> <!-- 조회수 10명 이상일 경우 HOT이미지 -->
				<img src="<%=request.getContextPath() %>/resources/images/hot.gif">
			</c:if>	
		</td>
		<td align="center">${list.coname} [${list.coteacher }]</td> <!-- 강의명 -->
		<c:if test="${list.rating == null }">
			<td align="center">미평가</td> 				
		</c:if>
		<c:if test="${list.rating == '1' }">
			<td align="center"><font color="#ffd400">★</font></td>				
		</c:if>
		<c:if test="${list.rating == '2' }">
			<td align="center"><font color="#ffd400">★★</font></td> 					
		</c:if>
		<c:if test="${list.rating == '3' }">
			<td align="center"><font color="#ffd400">★★★</font></td> 				
		</c:if>
		<c:if test="${list.rating == '4' }">
			<td align="center"><font color="#ffd400">★★★★</font></td> 					
		</c:if>
		<c:if test="${list.rating == '5' }">
			<td align="center"><font color="#ffd400">★★★★★</font></td> 				
		</c:if>
		<td align="center">${list.writer}</td> <!-- 작성자 -->
		<td align="center"><fmt:formatDate value="${list.reg_date}" type="both" pattern="yy-MM-dd HH:mm"/></td> <!-- 날짜 -->
		<td align="center">${list.readcount}</td> <!-- 조회수 -->
	</tr>	
	</c:forEach>
	<c:if test="${sessionScope.loginInfo.type eq 'student'}">
	<tr height="30"> <!-- 글쓰기 -->
		<td colspan="7" align="right">
			<c:if test="${loginInfo != null }">
			<input type="button" value="후기 작성" onClick="insert()" class="btn btn-secondary btn-sm">
			</c:if>
		</td>
	<tr>
	</c:if>
	</table>
	<%-- <c:forEach var="colist" items="colist">
		<td align="center">${colist.coname }</td><!-- 과목명 -->
	</c:forEach> --%>
<br>

<!-- 하단페이지 -->
<!-- <div class="pagination"> -->
	${pageInfo.pagingHtml }
<!-- </div> -->
</center>
<br><br>
<%@ include file="../user/usbottom.jsp" %>
