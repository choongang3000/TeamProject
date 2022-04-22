<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="ustop.jsp"%>

<style>

	.card{
			margin-left: 100px;
			margin-top: 30px;
	}
</style>

<!-- 강좌 광고 -->
<%-- <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner" >
  	<div class="carousel-item active">
      <img src="<%=request.getContextPath() %>/resources/images/메인광고1.png" class="d-block w-100" alt="..." width=1500 height=400>
      <div class="carousel-caption d-none d-md-block">
<!--         <h5>ON강 사용 방법</h5>
        <p>ON강을 더 잘 사용할 수 있는 방법?</p>
        <p><a href="#" class="btn btn-primary">보러가기</a><p> -->
      </div>
    </div>
  	<c:forEach var="cos" items="${cosList }">
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/resources/images/${cos.coimage}" class="d-block w-100" alt="..."  width=1500 height=400>
      <img src="<%=request.getContextPath()%>/resources/images/메인광고2.png" class="d-block w-100" alt="..."  width=1500 height=400>
      <div class="carousel-caption d-none d-md-block">
      	
        <h5>${cos.coname}</h5>
        <p>${cos.cocontent}</p>
        <p><a href="detail.cos?conum=${cos.conum }&pageNumber=${pageInfo.pageNumber }" class="btn btn-primary">보러가기</a><p>
      </div>
    </div>
  </c:forEach>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div> --%>

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="list.cos"><img src="<%=request.getContextPath()%>/resources/images/메인광고1.png" class="d-block w-100" alt="강의이동" width=1500 height=400></a>
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/resources/images/메인광고2.png" class="d-block w-100" alt="..." width=1500 height=400>
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/resources/images/메인광고3.png" class="d-block w-100" alt="..." width=1500 height=400>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


<!-- 선생님 보여주기 -->
	<div class="album py-3 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3"> <!--  row-cols-md-4 row-cols-md-5 g-3 -->
				<c:forEach var="te" items="${teList }">
					<div class="card" style="width: 18rem;">
						<img src="<%=request.getContextPath()%>/resources/images/${te.t_image}" class="card-img-top" alt="이미지 삽입해 주세용">
						<div class="card-body">
							<h5 class="card-text">${te.subject }</h5>
							<h3 class="card-title">${te.tname }</h3>
							<a href="sublist.te?tname=${te.tname}" class="btn btn-primary">보러가기</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- <!-- FOOTER -->
	<footer class="container">
		<p class="float-end">
			<a href="#">Back to top</a>
		</p>
		<p>
			&copy; 2017–2021 Company, Inc. &middot; <a href="#">Privacy</a>
			&middot; <a href="#">Terms</a>
		</p>
	</footer> -->



<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

</body>
</html>


<%@include file="usbottom.jsp"%>
