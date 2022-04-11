<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
<!-- coupdateForm.jsp<br> -->
<style>
	body{
		width:60%;
		margin:auto;
	}
</style>

<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>강의 정보 수정</h2>
      <p class="lead">등록된 강의를 수정해주세요.</p>
    </div>
	
    <div class="row g-5">
      <div class="d-block mx-auto mb-6">
        <h4 class="mb-3">강의 정보</h4>
        <form class="needs-validation" method="post" action="coupdate.ad" enctype="multipart/form-data">
          <div class="row g-3">
            
           	<!-- 강의번호 -->
            <input type="hidden" name="conum" value="${cobean.conum }">
            
            <!-- 강의명 -->
            <div class="col-4">
              <label for="coname" class="form-label">강의명</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="coname" class="form-control" value="${cobean.coname }" required>
              <div class="invalid-feedback">
                  수정할 강의명을 작성해주세요.
                </div>
              </div>
            </div>
            
            <!-- 담당선생님 -->
            <div class="col-sm-4">
              <label for="coteacher" class="form-label">담당 선생님</label>
              <input type="text" name="coteacher" class="form-control" value="${cobean.coteacher }" required>
              <div class="invalid-feedback">
              	수정할 담당 선생님 성명을 작성해주세요.
              </div>
            </div>
           
			<!-- 강의과목 -->
			<div class="col-md-4">
              <label for="cosubject" class="form-label">과목</label>
              <select class="form-select" name="cosubject" required>
                <option value="">과목선택</option>
				<c:forEach var="list" items="${sublist }">
	               <option value="${list.subname }" <c:if test="${list.subname == cobean.cosubject }">selected</c:if>>${list.subname }</option>
	            </c:forEach>
              </select>
              <div class="invalid-feedback">
                수정할 과목을 선택해주세요.
              </div>
            </div>
            
			<!-- 강의이미지 => 어떻게 가져올건지? --> 
            <div class="col-12">
              <label for="coimage" class="form-label">강의 이미지 <span class="text-muted">(Optional)</span></label>
			  <c:if test='${imageName != null }'>
			 	 <br> 기존 강의영상 이름 : ${imageName }
			  </c:if>
			  <c:if test='${imageName == null }'>
				<br> 기존 강의영상 이름 : 기존 영상 없음
			 </c:if>
              <input type="file" class="form-control" name="upimage" value="<%=request.getContextPath()%>/resources/${imageName}">
              <div class="invalid-feedback">
                강의 이미지를 넣어주세요.
              </div>
            </div>
            
            <!-- 강의영상 => 어떻게 가져올건지? -->
            <div class="col-12">
              <label for="covideo" class="form-label">강의 영상<span class="text-muted"></span></label>
              <br> 기존 강의영상 이름 : ${videoName }
              <input type="file" class="form-control" name="upvideo" value="<%=request.getContextPath()%>/resources/${videoName}" required>
              <div class="invalid-feedback">
                강의 영상을 넣어주세요.
              </div>
            </div>
			
			<!-- 강의소개 -->
            <div class="col-12">
              <label for="cocontent" class="form-label">강의소개</label>
              <input type="text" class="form-control" name="cocontent" value="${cobean.cocontent }" required>
              <div class="invalid-feedback">
                강의 소개를 작성해주세요.
              </div>
            </div>
			
			<!-- 강의가격 -->
            <div class="col-3">
              <label for="coprice" class="form-label">판매가격<span class="text-muted"></span></label>
              <input type="text" class="form-control" name="coprice" value="${cobean.coprice }" required>
              <div class="invalid-feedback">
                강의금액을 입력해주세요.
              </div>
            </div>
            
            <%--
			<!-- 업로드날짜(년) -->
            <div class="col-md-3">
              <label for="coupload_date" class="form-label">업로드 날짜</label>
              <select class="form-select" id="state" required>
                <option value="">연도 선택</option>
                <option>California</option>
              </select>
              <div class="invalid-feedback">
                업로드할 날짜(년도)를 선택해주세요.
              </div>
            </div>
            
            <!-- 업로드날짜(월) -->
            <div class="col-md-3">
              <label for="coupload_date" class="form-label"> </label>
              <select class="form-select" id="state" required>
                <option value="">월 선택</option>
                <option>California</option>
              </select>
              <div class="invalid-feedback">
                업로드할 날짜(월)를 선택해주세요.
              </div>
            </div>
           
            <!-- 업로드날짜(일) -->
            <div class="col-md-3">
              <label for="coupload_date" class="form-label"> </label>
              <select class="form-select" id="state" required>
                <option value="">일 선택</option>
                <option>California</option>
              </select>
              <div class="invalid-feedback">
                업로드할 날짜(일)를 선택해주세요.
              </div>
            </div>
			 --%>
			 
          <hr class="my-4">
			
          <button class="w-50 btn btn-secondary btn-mg" type="button" onClick="history.back()">강의목록으로 돌아가기</button>
          <button class="w-50 btn btn-primary btn-mg" type="submit">등록된 강의 수정</button>
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

</div>

<%@ include file="../admin/adbottom.jsp" %> 