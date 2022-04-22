<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#Footer .container {
	position: relative;
	width: 100%;
	margin: 0 auto;
	padding: 14px 0 40px;
	z-index: 2;
}

.col{
	text-align : center;
}

.col-6 {
	text-align : right;
}

div {
	display: block;
}

address {
	color: #666;
	line-height: 15px;
	font-style: normal;
	display: block;
	line-height: 1.5em;
}

address .span {
	padding-left: 12px;
}

address .copyright {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	padding: 9px 0 0;
	color: #666;
	font-size: 10px;
	font-family: 'Verdana', 'Tahoma', 'Geneva', 'Arial', sans-serif;
	font-weight: normal;
}

.help {
	text-align: center;
}

</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<footer class="pt-4 my-md-5 pt-md-5 border-top">
	<div class="container">
		<div class="container">
			<div class="row">
				<div class="col">
					<img class="mb-2" onClick="location.href='home.us'" src="<%=request.getContextPath() %>/resources/images/icon/ON강_로고2.png"></a>
				</div>
				<div class="col-6">
					<address>
						<strong>10393</strong> "서울 마포구 신촌로 176 온강빌딩" <span>사업자등록번호 : 110-95-12345</span><br>
						<span> "통신판매번호 : 제 1234-서울마포-00001호"<br>"학원설립/운영 등록번호 : 제123456789호 온강"
						</span><br> 
						<strong class="copyright">Copyright ⓒ 2022 by ONGANG INSTITUTE, All Rights Reserved.</strong>
					</address>
				</div>
				<div class="col">
					<div class="help">
						<img alt="on강 고객센터 홈페이지" src="<%=request.getContextPath() %>/resources/images/icon/고객센터.png" onclick="location.href='list.ba'">
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
