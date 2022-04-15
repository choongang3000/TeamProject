<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<style>
.content {
	position: relative;
	padding: 32px 5px 95px;
}

.container {
	position: relative;
	z-index: 20;
	max-width: 954px;
	margin: 0 auto;
}

div {
	display: block;
}
</style>
<div id="container" style="height: 1606px; user-select: auto;">
	<div id="content">
		<h2>탈퇴 안내</h2>
		<p class="context"">회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해 주세요.</p>
	</div>
	<div id="section_delete">
		<h3 class="h_dropout">
			사용하고 계신 아이디(<em>${loginInfo.id }</em>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
		</h3>
		<p class="dropout_dsc">
			<em style="user-select: auto;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가
				불가하오니 신중하게 선택하시기 바랍니다.</em>
		</p>
		<h3 class="h_dropout">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h3>
		<p class="dropout_dsc">회원정보 및 강의 결제 내역, 1:1 문의 등 개인형 서비스 이용기록은 모두
			삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
	</div>

	<div class="row g-5">
		<div class="d-block mx-auto mb-6">
			<form:form class="needs-validation" action="memberdelete.mem" method="post" commandName="membean">
				<div class="row g-3">
					<div class="col-4">
						<label for="pw" class="form-label">비밀번호를 입력하세요</label>
						<div class="input-group has-validation">
							<input type="password" name="pw" class="form-control" required>
						</div>
					</div>
				</div>
				<button class="w-50 btn btn-primary btn-mg" type="submit">수정하기</button>
				<button class="w-50 btn btn-secondary btn-mg" type="button" onClick="mypage.mem">마이페이지로 돌아가기</button>
			</form:form>
		</div>
	</div>
</div>

<c:if test="${msg==false}">
	<p>비밀번호가 다릅니다.</p>
</c:if>