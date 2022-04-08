<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
	<center>
    <table>
    	<tr>
    		<td align=right><input type="button" value="선생님 계정 생성" class="btn btn-primary btn-sm" onClick="location.href='tcinsert.ad'"><br></td>
    	</tr>
    	<tr height=15px>
    		<td></td>
    	</tr>
    	<tr>
    		<td align=right>
			    <div class="dropdown">
				  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
				    테이블 정렬 설정
				  </a>
				
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				    <li>
					    <form action="tclist.ad" method="post" >
					    	<select name="whatColumn" class="form-select form-select-sm" aria-label=".form-select-sm example" style="width:120px; display:inline;">
					    		<option value="">칼럼 선택</option>
					    		<option value="tname">이름</option>
					    		<option value="id">아이디</option>
					    		<option value="tterm">계약만료일</option>
					    	</select>
					    	<select name="ascdesc" class="form-select form-select-sm" aria-label=".form-select-sm example" style="width:120px; display:inline;">
					    		<option value="">차순 선택</option>
					    		<option value="asc">오름차순</option>
					    		<option value="desc">내림차순</option>
					    	</select>
					    	<input type="submit" value="정렬" class="btn btn-secondary btn-sm">
						</form>
						<br>
				    </li>
				    <li>
				    	<form action="tclist.ad" method="post" >
					    	<select name="whatColumn" class="form-select form-select-sm" aria-label=".form-select-sm example" style="width:120px; display:inline;">
					    		<option value="">칼럼 선택</option>
					    		<option value="subject">과목</option>
					    		<option value="tname">이름</option>
					    		<option value="id">아이디</option>
					    		<option value="email">이메일</option>
					    	</select>
					    	<input type="text" name="keyword" class="form-control form-control-sm" aria-label=".form-control-sm example" style="width:120px; display:inline;">
					    	<input type="submit" value="조회" class="btn btn-secondary btn-sm">
				    	</form>
				    </li>
				  </ul>
				</div>
			</td>
		</tr>
		<tr>
			<td>
			    <table class="table table-striped">
			    	<tr style="border-bottom: 2px solid black; text-align: center">
			    		<th>NO</th>
			    		<th>과목</th>
			    		<th>이름</th>
			    		<th>아이디</th>
			    		<th>이메일</th>
			    		<th>전화번호</th>
			    		<th>계약만료일</th>
			    		<th>상세보기</th>
			    	</tr>
			    	<c:set var="teacherCount" value="${(totalcount - ((pageInfo.pageNumber-1)*pageInfo.pageSize)) }"/>
			    	<c:forEach var="tc" items="${TeacherArr}">
			    	<tr style="text-align: center">
			    		<th>${teacherCount }</th>
			    		<c:set var="teacherCount" value="${teacherCount -1 }"/>
			    		<td>${tc.subject }</td>
			    		<td>${tc.aname }</td>
			    		<td>${tc.id }</td>
			    		<td>${tc.email }</td>
			    		<td>${tc.phone1 }-${tc.phone2 }-${tc.phone3 }</td>
			    		<td>${fn:substring(tc.tterm,0,11) }</td>
			    		<td>
			    			<button type="button" class="btn btn-outline-primary btn-sm" onClick="location.href='tcdetail.ad?anum=${tc.anum }'">상세보기</button>
			    		</td>
			    	</tr>
			    	</c:forEach>
			    </table>
		    </td>
	    </tr>
    </table>
	</center>    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<%@ include file="../admin/adbottom.jsp" %>    
