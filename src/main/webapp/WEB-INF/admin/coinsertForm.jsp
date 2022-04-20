<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../admin/adtop.jsp" %>
<!-- coinsertForm.jsp<br> -->
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
      <img class="d-block mx-auto mb-4" src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
      <h2>강의 등록</h2>
      <p class="lead">강의를 등록해주세요.</p>
    </div>
	
    <div class="row g-5">
      <div class="d-block mx-auto mb-6">
        <h4 class="mb-3">강의 정보</h4>
        <form:form commandName="CoBean" class="needs-validation" method="post" action="coinsert.ad" enctype="multipart/form-data">
          <div class="row g-3">
            
            <!-- 강의명 -->
            <div class="col-4">
              <label for="coname" class="form-label">강의명</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="coname" class="form-control" required>
              <div class="invalid-feedback">
                  강의명을 작성해주세요.
                </div>
              </div>
            </div>

            <!-- 담당선생님 -->
            <div class="col-sm-4">
              <label for="coteacher" class="form-label">담당 선생님</label>
              <!-- <input type="text" name="coteacher" class="form-control" required> -->
              <select name="coteacher" class="form-control" id="floatingInput" required>
			  <option value="">선생님선택</option>
					<c:forEach var="telist" items="${telist }">
						<option value="${telist.tname }">${telist.tname }</option>
					</c:forEach>
			  </select>
			  <form:errors cssClass="err" path="coteacher"/>
              <div class="invalid-feedback">
              	담당 선생님 성명을 작성해주세요.
              </div>
            </div>
           
			<!-- 강의과목 -->
			<div class="col-md-4">
              <label for="cosubject" class="form-label">과목</label>
              <select class="form-select" name="cosubject" required>
                <option value="">과목선택</option>
				<c:forEach var="list" items="${sublist }">
	               <option>${list.subname }</option>
	            </c:forEach>
              </select>
              <div class="invalid-feedback">
                과목을 선택해주세요.
              </div>
            </div>
            
			<!-- 강의이미지 -->
            <div class="col-12">
              <label for="coimage" class="form-label">강의 이미지 <span class="text-muted">(Optional)</span></label>
              <input type="file" class="form-control" name="upimage" required>
              <div class="invalid-feedback">
                강의 이미지를 넣어주세요.
              </div>
            </div>
            
            <!-- 강의영상 -->
            <div class="col-12">
              <label for="covideo" class="form-label">강의 영상<span class="text-muted"></span></label>
              <input type="file" class="form-control" name="upvideo" accept="video/mp4,video/mkv, video/x-m4v,video/*" required>
              <div class="invalid-feedback">
                강의 영상을 넣어주세요.
              </div>
            </div>
			
			<!-- 강의소개 -->
            <div class="col-12">
              <label for="cocontent" class="form-label">강의소개</label>
              <input type="text" class="form-control" name="cocontent" required>
              <div class="invalid-feedback">
                강의 소개를 작성해주세요.
              </div>
            </div>
			
			<!-- 강의가격 -->
            <div class="col-3">
              <label for="coprice" class="form-label">판매가격<span class="text-muted"></span></label>
              <input type="text" class="form-control" name="coprice" required>
              <div class="invalid-feedback">
                강의금액을 입력해주세요.
              </div>
            </div>
            
          <hr class="my-4">
			
          <button class="w-50 btn btn-secondary btn-mg" type="button" onClick="history.back()">강의목록으로 돌아가기</button>
          <button class="w-50 btn btn-primary btn-mg" type="submit">새로운 강의 등록</button>
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