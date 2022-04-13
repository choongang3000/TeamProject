<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp"%>
<script type="text/javascript">
	function list(){
		location.href = "list.cos";
	}
</script>
<style>
.course-detail {
	max-width: 1200px;
	height: auto;
	margin: 0 auto;
}
.course-detail-box {
	margin-bottom: 40px;
	padding: 50px 15px;
	height: auto;
	display: flex;
}

.course-box-info {
	margin-bottom: 40px;
}

.swiper-container {
	width: 600px;
	height: auto;
}

.swiper-container img {
	width: 580px;
	height: auto;
	padding: 10px;
	margin: 0 auto;
}

.course-info-desciption {
	padding-left: 25px;
	float: left;
	font-size: 14px;
	font-weight: 500;
}

.course-box-detail {
	width: 600px;
	height: auto;
	padding: 10px 10px;
	margin: auto auto;
}

.course-box-detail div {
	line-height: 36px;
}

.course-box-detail-company-color {
	color: #1E1E1E;
	font-size: 34px;
}

.course-box-detail-company>a {
	text-decoration: none;
}

.course-box-detail-company i {
	align-content: center;
}

.course-box-detail-price {
	margin-top: 10px;
}

.course-box-detail-name>span {
	font-size: 24px;
}

.course-box-detail-price-figure {
	font-size: 27px;
	font-weight: 800;
}

.course-btm-e1e1e1 {
	padding: 7px 0px;
	border-bottom: 1px solid #E1E1E1;
}

.course-box-detail-soldCount-figure {
	font-size: 14px;
}

.course-box-detail-postInfo-title {
	color: #777777;
	font-size: 14px;
	margin-right: 15px;
}

.course-box-detail-postInfo-content {
	font-size: 14px;
}

.course-box-detail-realInfo-title {
	color: #777777;
	font-size: 14px;
	margin-right: 15px;
}

.course-box-detail-realInfo-content {
	font-size: 14px;
}

.course-box-detail-realInfo-popover {
	color: black;
	font-size: 20px;
	text-decoration: none;
	float: right;
	margin-right: 70px;
	cursor: pointer;
}

#realInfo-box {
	background-color: #F7F7F7;
	width: 100%;
	height: auto;
	text-align: center;
}

.course-box-detail-allPrice {
	height: 80px;
	margin-top: 30px;
}

.course-box-detail-allPrice-title {
	font-size: 15px;
	font-weight: 700;
}

.course-box-detail-allPrice-figure {
	font-size: 28px;
	color: red;
	font-weight: 700;
	float: right;
	font-style: italic;
	margin-right: 70px;
}

.buy-btn {
	width: 60%;
	height: 60px;
	padding: 16px 4px;
	margin: 0 4px;
	margin-right: 15px;
	border: none;
	background-color: #1e1e1e;
	border-radius: 6px;
	color: white;
	font-size: 17px;
	font-weight: 500;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
}

.cart-btn {
	margin: 0 auto;
	width: 10%;
	height: 60px;
	border: 0px;
	background-color: white;
}

.fav-btn {
	width: 10%;
	height: 60px;
	padding: 16px 4px;
	background-color: white;
	border: 1px solid #E3E5E8;
	border-radius: 6px;
	vertical-align: middle;
}

.wrap-detail-info {
	position: relative;
	padding-top: 0px;
}

.tab-detail-info {
	max-width: 1230px;
	height: 80px;
	position: sticky;
	top: 0px;
	bottom: auto;
}

.tab {
	text-decoration: none;
	list-style: none;
	display: flex;
	margin: 0px;
	padding: 0px;
	background-color: white;
}

.tab>li {
	width: 25%;
	height: 80px;
	text-align: center;
	padding: 19px 4px 22px;
	font-size: 20px;
	border-bottom: 4px solid #f2f2f2;
}

.tab>li>a {
	font-weight: 500;
	color: #9a9a9e;
	text-decoration: none;
}

#detail-img-text-box {
	height: auto;
	margin: 150px 0px;
	text-align: center;
}

#detail-review-box {
	min-height: 360px;
	border-bottom: 1px solid #A4A4A8;
}

.detail-review-header {
	margin-top: 140px;
	height: 54px;
	padding-bottom: 16px;
	border-bottom: 1px solid #1e1e1e;
	font-weight: 500;
	font-size: 26px;
}

#detail-qna-box {
	min-height: 360px;
	border-bottom: 1px solid #A4A4A8;
}

.detail-qna-header {
	margin-top: 140px;
	height: 54px;
	padding-bottom: 16px;
	border-bottom: 1px solid #1e1e1e;
	font-weight: 500;
	font-size: 26px;
}

#detail-purchaseInfo-box {
	min-height: 360px;
	border-bottom: 1px solid #A4A4A8;
}

.detail-purchaseInfo-header {
	margin-top: 140px;
	height: 54px;
	padding-bottom: 16px;
	border-bottom: 1px solid #1e1e1e;
	font-weight: 500;
	font-size: 26px;
}

#addressInfo-box {
	background-color: #F7F7F7;
	width: 100%;
	height: auto;
	text-align: left;
	padding: 40px 0 30px 40px;
	margin-bottom: 100px;
	line-height: 3;
}

.product-insert-table {
	height: 200px;
}

.product-insert-table>tr {
	height: 30px;
}

.rank-font {
	color: blue;
	font-size: 12px;
	position: absolute;
	width: 3%;
	height: 3%;
}

.detail-sticky-go-to-top-btn-box {
	width: 20px;
	height: 20px;
	position: sticky;
	float: right;
	top: 95%;
}

.detail-sticky-go-to-top-btn-img {
	width: 100%;
	height: 100%;
}

</style>

<div class="course-detail">
	<!-- 상단 박스 시작 -->
	<div class="course-detail-box">
		<div class="course-box-info">
			<!-- 이미지  -->
			<div class="course-info-image swiper-container">
				<div class="row"
					style="float: left; text-align: center; width: 35%;">
					<img alt="강의 이미지" src="<%=request.getContextPath()%>/resources/images/${bean.coimage}" width="150%">
				</div>
			</div>
		</div>
		<div class="course-box-detail">
			<div class="course-box-detail-company">
				<a href="#"> <span class="course-box-detail-cosubject-color">${bean.cosubject}</span>
				</a>
			</div>
			<div class="courses-box-detail-name">
				<!-- 상품명 -->
				<span>${bean.coname}</span>
			</div>
			<div class="course-box-detail-price">
				<!-- 가격 -->
				<span class="course-box-detail-price-figure">${bean.coprice}</span>
				<span>원</span>
			</div>
			<div class="course-box-detail-allPrice">
				<span class="course-box-detail-allPrice-title">상품 금액</span> <span
					class="course-box-detail-allPrice-figure"> <fmt:formatNumber value="${bean.coprice}" type="number" />
				</span>
			</div>
			<!-- 버튼 시작 -->
			<button type="button" class="buy-btn" onclick="#">주문하기</button>
			<button type="button" class="cart-btn" onclick="list()"><img src="<%=request.getContextPath() %>/resources/images/baseline_list_black_24dp.png" /></button>
			<!-- 버튼 끝 -->
		</div>
	</div>

	<div class="wrap-detail-info">
		<!-- 상품정보/주문정보 시작 -->
		<div class="tab-detail-info">
			<ul class="tab">
				<li class="active" id="tab-img-text"><a href="#detail-img-text-box" id="tab-img-text-a">상품정보</a></li>
			</ul>
		</div>
		<div id="detail-img-text-box">${bean.cocontent}</div>


	</div>
</div>

<%@ include file="../user/usbottom.jsp"%>
