<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<%@ include file="../user/ustop.jsp" %>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="star-rating.css">

<script type="text/javascript">
	$(document).ready(function(){
		$("#s1").click(function(){
			$(".fa-star").css("color","black");
			$("#s1").css("color","yellow");
		});
		$("#s2").click(function(){
			$(".fa-star").css("color","black");
			$("#s1,#s2").css("color","yellow");
		});
		$("#s3").click(function(){
			$(".fa-star").css("color","black");
			$("#s1,#s2,#s3").css("color","yellow");
		});
		$("#s4").click(function(){
			$(".fa-star").css("color","black");
			$("#s1,#s2,#s3,#s4").css("color","yellow");
		});
		$("#s5").click(function(){
			$(".fa-star").css("color","black");
			$(".fa-star").css("color","yellow");
		}); */
		
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
		
	});
</script>

<style>
	.err{
		color:red;
		font-weight:bold;
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

<center>
<br><br>
<h2 align="center">수강후기 수정</h2>
<br>
<form:form method="post" action="update.bs?pageNumber=${pageNumber}" commandName="bb">
	<input type="hidden" name="num" value="${bb.num}">
	<table border="0" width="40%" height="60%">
		<tr>
			<td align="center" bgcolor="#DCDCDC" width="100">이름</td>
			<td>
				<input type="text" name="writer" value="${bb.writer}" class="form-control" id="floatingInput" readonly>
				<form:errors path="writer" cssClass="err"></form:errors>		
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">제목</td>
			<td>
				<input type="text" name="title" value="${bb.title}" class="form-control" id="floatingInput" placeholder="제목을 입력해주세요">
				<form:errors path="title" cssClass="err"></form:errors>				
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">강의명</td>
			<td>
				<!-- <input type="text" name="coname" class="form-control" id="floatingInput" placeholder="제목을 입력해주세요"> -->
				<select name="coname" class="form-control" id="floatingInput" required>
				<option value="">강의선택</option>
				<c:forEach var="colist" items="${colist }">
					<option value="${colist.coname }" <c:if test="${colist.coname == bb.coname }">selected</c:if>>${colist.coname }</option>
				</c:forEach>
				</select>
				<form:errors cssClass="err" path="coname"/>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">선생님</td>
			<td>
				<!-- <input type="text" name="coteacher" class="form-control" id="floatingInput" placeholder="제목을 입력해주세요"> -->
				
					<select name="coteacher" class="form-control" id="floatingInput" required>
					<option value="">선생님선택</option>
					<c:forEach var="telist" items="${telist }">
						<option value="${telist.tname }" <c:if test="${telist.tname == bb.coteacher }">selected</c:if>>${telist.tname }</option>
					</c:forEach>
					</select>
					<form:errors cssClass="err" path="coteacher"/>
				
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">Email</td>
			<td>
				<input type="text" name="email" value="${bb.email}" class="form-control" id="floatingInput" placeholder="작성자를 입력해주세요">		
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">이미지</td>
			<td align="center">
				<c:if test="${bb.image!=null }">
					<img src="<%=request.getContextPath() %>/resources/${bb.image}" width=200 height=400 class="form-control">
				</c:if>
				<c:if test='${bb.image==null}'>
					<input type="text" value="이미지 없음" class="form-control" id="floatingInput" readonly>
				</c:if>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">내용</td>
			<td>
				<textarea name="content" rows="15" cols="50" class="form-control" placeholder="내용을 입력해주세요" id="floatingTextarea" style="resize:none;" required>${bb.content}</textarea>
				<form:errors path="content" cssClass="err"></form:errors>			
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">별점주기</td>
			<td>	
				<div class="star-rating">
				  <input type="radio" id="5-stars" name="rating" value="5" <c:if test="${5 eq bb.rating }">checked</c:if>>
				  <label for="5-stars" class="star">&#9733;</label>
				  
				  <input type="radio" id="4-stars" name="rating" value="4" <c:if test="${4 eq bb.rating }">checked</c:if>>
				  <label for="4-stars" class="star">&#9733;</label>
				  
				  <input type="radio" id="3-stars" name="rating" value="3" <c:if test="${3 eq bb.rating }">checked</c:if>>
				  <label for="3-stars" class="star">&#9733;</label>
				  
				  <input type="radio" id="2-stars" name="rating" value="2" <c:if test="${2 eq bb.rating }">checked</c:if>>
				  <label for="2-stars" class="star">&#9733;</label>
				  
				  <input type="radio" id="1-star" name="rating" value="1" <c:if test="${1 eq bb.rating }">checked</c:if>>
				  <label for="1-star" class="star">&#9733;</label>
			</div>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DCDCDC">비밀번호</td>
			<td>
				<input type="password" name="passwd" class="form-control" id="floatingPassword" placeholder="비밀번호 입력해주세요" required>
				<form:errors path="passwd" cssClass="err"></form:errors>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<br>
				<input class="btn btn-secondary btn-sm" type="submit" value="수정완료">
				<input class="btn btn-secondary btn-sm" type="reset" value="다시작성">
				<input class="btn btn-secondary btn-sm" type="button" value="목록보기" onClick="location.href='list.bs?pageNumber=${pageNumber}'">
			</td>
		</tr>
	</table>
</form:form>
</center>
<%@ include file="../user/usbottom.jsp" %>
