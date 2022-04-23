<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@ include file="../user/ustop.jsp"%>
<!--  회원정보<br> -->
<style>
main {
	width: 1200px;
	margin: auto;
}

#numberdiv{
	text-align: left;
	align:left;
}
</style>
<link href="form-validation.css" rel="stylesheet">
</head>
	<br>
	<main>
		<div class="py-5 text-center">
			<h2><b>내 정보 확인</b></h2>
		</div>
		
		<div class="row g-5">
			<div class="d-block mx-auto mb-6">
				<h4 class="mb-3">내 정보</h4>
					<div class="row g-3">

						<input type="hidden" name="anum" value="${mbean.anum }"> 
						<input type="hidden" name="type" value="student">

						<div class="col-4">
							<label for="id" class="form-label">아이디</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" value="${mbean.id }" disabled="disabled">
							</div>
						</div>

						<div class="col-3"></div>

						<div class="col-5"></div>

						<div class="col-4">
							<label for="pw" class="form-label">비밀번호</label>
							<div class="input-group has-validation">
								<input type="password" class="form-control" value="${mbean.pw }" disabled="disabled">
							</div>
						</div>

						<div class="col-8"></div>
						<div class="col-4"></div>
						<div class="col-8"></div>

						<div class="col-4">
							<label for="aname" class="form-label">이름*</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" value="${mbean.aname }" disabled="disabled">
							</div>
						</div>

						<div class="col-1"></div>

						<div class="col-6" id="numberdiv">
							<label for="aname" class="form-label" id="number">주민등록번호</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" value="${mbean.rrn1 }" disabled="disabled">&nbsp;<b>-</b>&nbsp; 
								<input type="password" class="form-control" value="${mbean.rrn2 }" disabled="disabled">
							</div>
						</div>
						
						<div class="col-12">
							<label for="aname" class="form-label">지역정보</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" value="${fn:split(mbean.addr,'|')[1] } ${fn:split(mbean.addr,'|')[2] } (우편번호:${fn:split(mbean.addr,'|')[0] })" disabled>
							</div>
						</div>

						<div class="col-12">
							<label for="email" class="form-label">E-mail*</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" value="${mbean.email }" disabled="disabled">
							</div>
						</div>

						<div class="col-12">
							<label for="phone" class="form-label">핸드폰 번호*</label>
							<div class="input-group has-validation">
								<!-- <span class="input-group-text">@</span> -->
								<input type="text" class="form-control" value="0${mbean.phone1 }" disabled="disabled"> &nbsp;<b>-</b>&nbsp; 
								<input type="text" class="form-control" value="${mbean.phone2 }" disabled="disabled"></a> &nbsp;<b>-</b>&nbsp; 
								<input type="text" class="form-control" value="${mbean.phone3 }" disabled="disabled"></a>
							</div>
						</div>

						<div class="col-4"></div>

						<div class="col-8"></div>

						<div class="col-4">
							<label for="id" class="form-label">회원가입일</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" value="${mbean.joindate }" disabled="disabled"></a>
							</div>
						</div>
						
						<div class="col-12"></div>
						<br>
						<div class="d-grid gap-2 col-6 mx-auto">
  							<button class="btn btn-secondary" type="button" onClick="history.back()">뒤로가기</button>
  							<button class="btn btn-primary" type="button" onClick="location.href='update.mem?anum=${loginInfo.anum}'">내 정보 수정</button>
						</div>
					</div>
			</div>
		</div>
	</main>
	<br>
	<br>

<%@ include file="../user/usbottom.jsp"%>