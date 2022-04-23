<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../user/ustop.jsp" %>
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	function delete_board(){
		var result = confirm('정말로 삭제 하시겠습니까?');
		if(result){
			location.href="delete.bst?num=${board.num}&pageNumber=${pageNumber }";
		}
		else{
			return false;
		}
	}
	
	function delete_reply(){
		var result = confirm('정말로 삭제 하시겠습니까?');
		if(result){
			location.href='deleteReply.bst?replyNum=${reply.num}&pageNumber=${pageNumber}&num=${board.num}';
		}
		else{
			return false;
		}
	}
	
	function download(filename){
		const encFileName = filename;
		 $.ajax({
		        type:"POST",
		        url : "fileDownLoad.bst?FileName="+ encFileName,
		        success : function(data) {
		            window.location ="fileDownLoad.bst?FileName="+ encFileName; 
		        },
		        error:function(request,status){
		            alert("오류가 발생했습니다.");
		        }
		 	});
	}
	
</script>
<br><br>
<center>
	<table border="0" class="table table-striped" style="width:1200px">
		<!-- <tr>	
			<td colspan="3" align="left" style="height:35px;">
				<a class="navbar-brand" align="right" style="color:black;"><b>&nbsp;질문 보기</b></a>
			</td>
		</tr> -->
		<tr>
			<%-- <td align=left>
				<c:if test="${loginInfo.type=='student' }">
				<input type="button" value="삭제" class="btn btn-outline-danger btn-sm" onClick="return delete_board()">
				</c:if>
			</td> --%>
			<td colspan="1" align="left" style="height:35px;">
				<a class="navbar-brand" align="right" style="color:black;"><b>&nbsp;학생 질문</b></a>
			</td>
			<td align=right colspan="2">
				<c:if test="${loginInfo.type=='student' }">
				<input type="button" value="수정" class="btn btn-primary btn-sm" onClick="location.href='update.bst?num=${board.num}&pageNumber=${pageNumber }'">
				</c:if>
				<c:if test="${loginInfo.type=='student' }">
				<input type="button" value="삭제" class="btn btn-outline-danger btn-sm" onClick="return delete_board()">
				</c:if>
				<input type="button" value="목록으로" class="btn btn-secondary btn-sm" onClick="location.href='list.bst?pageNumber=${pageNumber}'">
			</td>
		</tr>
		<tr>
			<th width=200 class="table-active" style="font-size:medium; text-align:center; ">
				<span class="badge bg-light text-dark">${board.subject}</span> ${board.teacher } 선생님
			</th>
			<td>&nbsp;${board.title }</td>
		</tr>
		<tr>
			<td colspan=2>
				<font size="2">
				질문자 : <span style="font-weight: bold">${board.stuid }</span>&nbsp;&nbsp;&nbsp;
				작성일 : <fmt:formatDate value="${board.write_date }" pattern="yyyy-MM-dd HH:mm" type="both"/>   
				</font>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<div class="form-floating">
					<textarea style="width:100%; height:300px; resize:none;" disabled style="resize: none;">${board.content }</textarea>
				</div>
				<br>
				<font style="font-weight: bold;">첨부파일 : </font>
				<c:set var="name_length" value="${fn:length(board.image)}"/>
				<c:set var="fileName" value="${fn:substring(board.image,37,name_length)}"/>
				<a href="javascript:download('${board.image}');">
					${fileName }
				</a>
			</td>
		</tr>
	</table>
	<br>
	<!-- 답글 테이블 -->
	<c:if test="${reply ne null }"> <!-- 선생님이 답변을 달았을때 -->
		<table border="0" class="table" style="width:1200;">
		<!-- 	<tr class="table-light">
			</tr> -->
			<tr class="table-light">
				<td colspan="1" align="left" style="height:35px;">
					<a class="navbar-brand" align="right" style="color:black;"><b>&nbsp;선생님 답변</b></a>
				</td>
				<c:if test="${loginInfo.type == 'teacher'}">
				<!-- <td align=left></td> -->
				<td align=right>
				<input type="button" value="답변 삭제" class="btn btn-outline-danger btn-sm" onClick="return delete_reply()">
				<input type="button" value="답변 수정" class="btn btn-primary btn-sm" onClick="location.href='updateReply.bst?replyNum=${reply.num}&pageNumber=${pageNumber}&num=${board.num}'"></td>
				</c:if>
			</tr>
			<tr>
				<th width=200 style="text-align: center;" class="table-active">${reply.teachid }</th>
				<td class="table-light">
					<font size="2">
						&nbsp;&nbsp;답변일 : <fmt:formatDate value="${reply.repdate }" type="both" pattern="yyyy-MM-dd HH:mm"/>
					</font>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<textarea name="content" style="width:100%; height:300px; resize:none;" disabled>${reply.content }</textarea>
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${loginInfo.type == 'teacher' }">
	
	<c:if test="${reply eq null }"> <!-- 답변X 일때 -->
		<form action="reply.bst?num=${board.num }&pageNumber=${pageNumber}" method="post">
			<input type="hidden" name="pnum" value="${board.num }">
			<input type="hidden" name="teachid" value="${loginInfo.aname }"> <!-- 여기 나중에 수정 필요 -->
		<br>
		<table style="width:1200px; margin-top:50px; border:none;">
	  <!-- 	 
	  num number primary key,
	  pnum number references board_st(num) on delete cascade,
	  teachid varchar2(15) not null, 
	  content varchar2(300) not null,
	  image varchar2(30),
	  repdate date default sysdate 
	  -->
		  	<tr>	
				<td colspan="3" align="left" style="height:35px;">
					<a class="navbar-brand" align="right" style="color:black;"><b>&nbsp;선생님 답변</b></a>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-floating">
					  <textarea class="form-control" name="content" id="floatingTextarea2" style="height:300px; width:1200px; resize:none;" required></textarea>
					  <label for="floatingTextarea2">답변 작성</label>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<br>
					<input type="submit" class="btn btn-secondary btn-sm" value="답글 등록">
				</td>	
			</tr>
		</table>
		</form>
	</c:if>
	</c:if>
</center>
<%@ include file="../user/usbottom.jsp" %>