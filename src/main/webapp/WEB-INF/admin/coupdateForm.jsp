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
        <form:form commandName="CoBean" class="needs-validation" method="post" action="coupdate.ad" enctype="multipart/form-data">
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
              <%-- <input type="text" name="coteacher" class="form-control" value="${cobean.coteacher }" required> --%>
              <select name="coteacher" class="form-select" id="floatingInput" required>
			   <option value="">선생님선택</option>
				<c:forEach var="telist" items="${telist }">
					<option value="${telist.tname }" <c:if test="${telist.tname == cobean.coteacher }">selected</c:if>>${telist.tname }</option>
				</c:forEach>
			  </select>
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
            
            <!-- 강의이미지 -->
            <div class="col-12">
              <label for="coimage" class="form-label">강의 이미지 <span class="text-muted">(Optional)</span></label><br>
              <img src="<%=request.getContextPath() %>/resources/${cobean.coimage}" width="500" height="400"><br>
              <br> 
              기존 강의 이미지명 : ${cobean.coimage }
              	
                <c:set var="lenimg" value="${fn:length(cobean.coimage) }"/>
	            <c:set var="img" value="${fn:substring(cobean.coimage,37,lenimg)}"/>
	            ${fn:substring(cobean.coimage,37,lenimg)}
	           <br>
	         
              <input type="file" class="form-control" name="upimage" value="<%=request.getContextPath()%>/resources/${cobean.coimage}" required>
              <br>
              <div class="invalid-feedback">
                강의 이미지를 넣어주세요.
              </div>
            </div>
            
            <!-- 강의영상(용량은 어떻게 할건지) -->
            <div class="col-12">
              <label for="covideo" class="form-label">강의 영상<span class="text-muted"></span></label><br>
              <video
				    src="<%=request.getContextPath() %>/resources/${cobean.covideo}"
					poster="<%=request.getContextPath()%>/resources/${cobean.covideo}"
					width="500"
					controls autoplay>
			  </video>
              <br> 기존 강의명 : ${cobean.covideo }
				<c:set var="lenvid" value="${fn:length(cobean.covideo) }"/>
            	<c:set var="vid" value="${fn:substring(cobean.covideo,37,lenvid)}"/>
            	<c:out value="${fn:substring(cobean.covideo,37,lenvid)}"/>
            	<br>
              <input type="file" class="form-control" name="upvideo" value="<%=request.getContextPath()%>/resources/${cobean.covideo}" accept="video/mp4,video/mkv, video/x-m4v,video/*" required>
              <br>
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
            <div class="col-4">
              <label for="coprice" class="form-label">판매가격<span class="text-muted"></span></label>
              <input type="text" class="form-control" name="coprice" value="${cobean.coprice }" required>
              <div class="invalid-feedback">
                강의금액을 입력해주세요.
              </div>
            </div>
           
           <div class="col-4">
              <label for="coprice" class="form-label">업로드시간<span class="text-muted"></span></label>
              <input type="text" class="form-control" name="coupload_date" value="${cobean.coupload_date }" readonly>
            </div> 
          <hr class="my-4">
			
          <button class="w-50 btn btn-secondary btn-mg" type="button" onClick="history.back()">강의목록으로 돌아가기</button>
          <button class="w-50 btn btn-primary btn-mg" type="submit">등록된 강의 수정</button>
        </div>
        </form:form>
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