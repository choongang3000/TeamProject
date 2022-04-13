<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp"%>
<script>
	function list() {
		location.href = "list.cos?pageNumber=${pageNumber }";
	}
</script>
<body>
	<form method="get" action="payment.stu">
	<div class="container" style="width: 70%">
		<div class="row">
			<h1 class="page-header"
				style="text-align: center; margin-bottom: 50px;">${bean.coname}</h1>
			<input type="hidden" value="${bean.conum}" id="num">
		</div>
		<div class="row" style="float: left; text-align: center; width: 35%;">
			<img alt="productPhoto" src="/resources/upload${bean.coimage}"
				width="150%"">
		</div>

		<div class="row productInfo" style="width: 40%; float: right;">
			<div class="form-group" style="text-align: center;">
				<h3 class="page-header">
					<span>${bean.coname}</span><br>
					<small>${bean.cosubject}</small>
				</h3>
			</div>
			<div class="form-group" style="text-align: left;">
				<label>가격 : </label><span>&nbsp;<fmt:formatNumber
						value="${bean.coprice}" type="number" /></span><span>&nbsp;원</span> <input
					type="hidden" value="${bean.coprice}" id="price">
			</div>
			<hr>

			<div class="row">
				<div class="selected_option" style="text-align: right;"></div>
				<div style="text-align: center;">
					<input type="hidden" name="num" value="${bean.conum}" /> 
					<input type="submit" class="btn btn-default" value="주문하기" />
					<input type="button" calss="btn btn-default" value="장바구니" onClick=""/> 
					<input type="button" class="btn btn-default" value="상품더보기" onClick="history.back();" />
				</div>
			</div>
			<hr>
			<div class="row nav">
				<nav id="middle_nav">
					<ul class="nav nav-tabs nav-justified">
						<li id="about">상품상세</li>
						<li id="review">리뷰</li>
						<li id="qna">상품문의</li>
					</ul>
				</nav>
			</div>

			<div class="row" style="margin: 50px 0;">
				<h1 class="jumbotron">
					<div class="container">
						<h1>Hello world</h1>
						<small>This is product page.</small>
					</div>
				</h1>
			</div>
			</div>
		</div>
		</form>
</body>
<%@ include file="../user/usbottom.jsp"%>
