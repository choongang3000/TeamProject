<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../admin/adtop.jsp" %>
<style>
	body{
		width:60%;
		margin:auto;
	}
</style>
<link href="form-validation.css" rel="stylesheet">
</head>

<body class="bg-light">
	<main>
	<div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
      <h2>강사 정보 수정</h2>
    </div>
    
    <div class="row g-5">
      <div class="d-block mx-auto mb-6">
        <h4 class="mb-3">강사 정보</h4>
		<form class="needs-validation" action="update.tc" method="post" enctype="multipart/form-data">
          <div class="row g-3">	
          
			<input type="hidden" name="anum" value="${tbean.anum }">
			<input type="hidden" name="tnum" value="${tbean.tnum }">
			<input type="hidden" name="type" value="teacher">
	
			<div class="col-4">
              <label for="id" class="form-label">ID</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="id" class="form-control" value="${tbean.id }" disabled="disabled">
              </div>
            </div>
            
            <div class="col-1">
            </div>
            
            <div class="col-4">
              <label for="pw" class="form-label">PW</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="pw" class="form-control" value="${tbean.pw }" disabled="disabled">
              </div>
            </div>
            
            <div class="col-3">
            </div>
            
             <div class="col-4">
              <label for="aname" class="form-label">이름*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="aname" class="form-control" value="${tbean.aname }">
              <div class="invalid-feedback">
                  이름을 작성해주세요.
                </div>
              </div>
            </div>
            
            <div class="col-1">
            </div>
            
            <div class="col-6">
              <label for="aname" class="form-label">주민등록번호</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="rrn1" class="form-control" value="${tbean.rrn1 }" disabled>
                &nbsp;<b>-</b>&nbsp;
           		<input type="text" name="rrn2" class="form-control" value="${tbean.rrn2 }" disabled>
              </div>
            </div>
            
            <div class="col-12">
              <label for="email" class="form-label">E-mail*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="email" class="form-control" value="${tbean.email }">
              <div class="invalid-feedback">
                  E-mail을 작성해주세요.
                </div>
              </div>
            </div>
            
            <div class="col-12">
              <label for="phone" class="form-label">핸드폰 번호*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="phone1" class="form-control" value="${tbean.phone1 }">
                &nbsp;<b>-</b>&nbsp;
                <input type="text" name="phone2" class="form-control" value="${tbean.phone2 }">
                &nbsp;<b>-</b>&nbsp;
                <input type="text" name="phone3" class="form-control" value="${tbean.phone3 }">
              <div class="invalid-feedback">
                  전화번호를 입력해주세요.
                </div>
              </div>
            </div>
            
            <div class="col-12">
              <label for="addr" class="form-label">주소</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="addr" class="form-control" value="${tbean.addr }">
	            <div class="invalid-feedback">
	               주소를 작성해주세요.
	            </div>
              </div>
            </div>
            
            <div class="col-12">
              <label for="addr" class="form-label">강사 사진</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <img src="<%=request.getContextPath() %>/resources/${tbean.t_image}" width=150 height=180> 
				&nbsp;
				<c:set var="lenstr" value="${fn:length(tbean.t_image) }"/> 
				${fn:substring(tbean.t_image,37,lenstr)}
              </div>
            </div>
            
             <div class="col-12">
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="file" class="form-control" name="upload">                
              </div>
            </div>
            
            <div class="col-12"></div>
            
            <div class="col-12">
              <label for="subject" class="form-label">과목*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach var="i" begin="0" end="${fn:length(subArr)-1}" >
					${subArr[i] }&nbsp;<input  type="checkbox" name="subject" value="${subArr[i] }" <c:if test="${fn:contains(tbean.subject,subArr[i]) }">checked</c:if> >&nbsp;&nbsp;&nbsp;
				</c:forEach>
	            <div class="invalid-feedback">
	               과목을 선택해주세요.
	            </div>
              </div>
            </div>
			
			<div class="col-12"></div>
			
			<div class="col-12">
              <label for="tterm" class="form-label">계약기간*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <fmt:parseDate var="dateString" value="${tbean.tterm }" pattern="yyyy-MM-dd"></fmt:parseDate>	
				<input type="date" name="tterm" value="<fmt:formatDate value="${dateString }" type="both" pattern="yyyy-MM-dd"/>">
	            <div class="invalid-feedback">
	               계약기간을 선택해주세요.
	            </div>
              </div>
            </div>
            
            <div class="col-12"></div>
            
            <div class="col-12">
              <label for="tterm" class="form-label">강사소개</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <textarea class="form-control" name="introduction" style="height: 100px; resize: none;">${tbean.introduction }</textarea>
	            <div class="invalid-feedback">
	               강사소개를 입력해주세요.
	            </div>
              </div>
            </div>
            
            <div class="col-12">
              <label for="twageratio" class="form-label">강사 임금 비율*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="twageratio" class="form-control" value="${tbean.twageratio }">
	            <div class="invalid-feedback">
	               임금 비율을 작성해주세요.
	            </div>
              </div>
            </div>
            
            <div class="col-12">
              <label for="visa" class="form-label">Visa</label>
              <div class="input-group">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="visa" class="form-control" value="${tbean.visa }">
              </div>
            </div>
            
            <hr class="my-4">
			
            <button class="w-50 btn btn-secondary btn-mg" type="button" onClick="history.back()">강사 상세보기로 돌아가기</button>
            <button class="w-50 btn btn-primary btn-mg" type="submit">강사계정 수정완료</button>
            
		</div>
        </form>
      </div>
    </div>
  </main>
  
  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2021 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
<%@ include file="../admin/adbottom.jsp" %>

<%-- <table class="table" style="width:700px">
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">성함</th>
		<td><input type="text" name="aname" value="${tbean.aname }"></td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">주민등록번호</th>
		<td>
			<input type="text" name="rrn1" value="${tbean.rrn1 }" class="form-control form-control-sm" style="width:120px; display:inline;" disabled>
			 - 
			<input type="text" name="rrn2" value="${tbean.rrn2 }" class="form-control form-control-sm" style="width:120px; display:inline;" disabled>
		</td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">E-mail</th>
		<td><input type="email" name="email" value="${tbean.email }"></td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">전화번호</th>
		<td><input type="text" name="phone1" value="${tbean.phone1 }">-<input type="text" name="phone2" value="${tbean.phone2 }">-<input type="text" name="phone3" value="${tbean.phone3 }"></td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">주소</th>
		<td><input type="text" name="addr" value="${tbean.addr }"></td>
	</tr>
	<tr>
		<th colspan=3 class="table-active" style="text-align: center">◈ 계약 관련 ◈</th>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">강사 사진</th>
		<td>
			<img src="<%=request.getContextPath() %>/resources/${tbean.t_image}" width=130 height=180> 
			<br>
			<font style="font-weight: bold;">현재 사진 :</font> 
			<c:set var="lenstr" value="${fn:length(tbean.t_image) }"/> 
			${fn:substring(tbean.t_image,37,lenstr)}
			<br>
			<input type="file" name="upload">	
		</td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">과목</th>
		<td align=center>
			<c:forEach var="i" begin="0" end="${fn:length(subArr)-1}" >
				<c:if test="${i%5 == 0 and i != 0 }">
					<br>
				</c:if>
				${subArr[i] }<input type="checkbox" name="subject" value="${subArr[i] }" <c:if test="${fn:contains(tbean.subject,subArr[i]) }">checked</c:if> >&nbsp;&nbsp;
			</c:forEach>
		</td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">계약기간</th>
		<td>
			<fmt:parseDate var="dateString" value="${tbean.tterm }" pattern="yyyy-MM-dd"></fmt:parseDate>	
			<input type="date" name="tterm" value="<fmt:formatDate value="${dateString }" type="both" pattern="yyyy-MM-dd"/>">
		</td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">강사 소개</th>
		<td><textarea name="introduction" style="width:550px; height:100px; resize: none;">${tbean.introduction }</textarea></td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">강사 임금 비율</th>
		<td><input type="text" name="twageratio" value="${tbean.twageratio }"></td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">Visa</th>
		<td><input type="text" name="visa" value="${tbean.visa }"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="submit" value="수정 완료">
		</td>
	</tr>
</table> --%>