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
      <h2>강사 계정 생성</h2>
    </div>
    
    <div class="row g-5">
      <div class="d-block mx-auto mb-6">
		<form class="needs-validation" action="insert.tc" method="post" enctype="multipart/form-data">
          <div class="row g-3">	
          
			<input type="hidden" name="type" value="teacher">
	
			<div class="col-4">
              <label for="id" class="form-label">아이디*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="id" class="form-control" value="${tbean.id }">
              </div>
            </div>
            
            <div class="col-8">
            </div>
            
            <div class="col-4">
              <label for="pw" class="form-label">비밀번호*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="pw" class="form-control" value="${tbean.pw }">
              </div>
            </div>
	
			 <div class="col-8">
            </div>
			
            <div class="col-4">
              <label for="pw_re" class="form-label">비밀번호확인</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="pw_re" class="form-control">
                <div class="invalid-feedback">
                  비밀번호 확인을 작성해주세요.
                </div>
              </div>
            </div>
            
             <div class="col-8">
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
              <label for="aname" class="form-label">주민등록번호*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="rrn1" class="form-control" value="${tbean.rrn1 }">
                &nbsp;<b>-</b>&nbsp;
           		<input type="text" name="rrn2" class="form-control" value="${tbean.rrn2 }">
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
              <label for="upload" class="form-label">강사 사진</label>
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
			
            <button class="w-50 btn btn-secondary btn-mg" type="button" onClick="history.back()">강사 목록으로 돌아가기</button>
            <button class="w-50 btn btn-primary btn-mg" type="submit">강사계정 생성</button>
            
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

















<%-- <%@ include file="bottom.jsp"%> --%>