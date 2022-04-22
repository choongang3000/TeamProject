<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp"%>

<style type="text/css">
#container {
	width: 80%;
	margin: auto;
}

.col-sm-5 {
	margin-top: 10px;
	margin-bottom: 20px;
}

#bt {
 float: right;
}
</style>
<br><br>
<div id="container">
	<div class="row justify-content-center">
		<div class="col-sm-5">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">내 정보 관리</h5>
					<p class="card-text">내 정보 확인, 수정, 탈퇴</p>
					<a href="memdetail.mem?anum=${loginInfo.anum}" id="bt" class="btn btn-primary">내 정보 관리</a>
				</div>
			</div>
		</div>
		<div class="col-sm-5">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">내 게시물 관리</h5>
					<p class="card-text">내 질문, 댓글 관리</p>
					<div class="btn-group" id="bt" role="group" aria-label="Basic example">
						<button type="button" onClick="location.href='list.bst'" class="btn btn-primary">수업 질문</button>
						<button type="button" onClick="location.href='list.bod?aname=${loginInfo.aname}'" class="btn btn-primary">1:1 문의</button>
					</div>
				</div>
			</div>
		</div>
	<div class="col-sm-5">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">내 수강 목록</h5>
				<p class="card-text">수강 목록</p>
				<a href="stucolist.mem" id="bt" class="btn btn-primary">내 강의 목록</a>
			</div>
		</div>
	</div>
	<div class="col-sm-5">
	</div>
	<!-- <div class="col-sm-5">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">ㅇㅅㅇ</h5>
				<p class="card-text">ㅇㅅㅇ</p>
				<a href="#" id="bt" class="btn btn-primary">ㅇㅅㅇ</a>
			</div>
		</div>
	</div> -->
</div>
</div>
<%@ include file="../user/usbottom.jsp"%>