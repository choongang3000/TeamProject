<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp"%>
<style>
	body{
		width:70%;
		margin:auto;
	}
	
	#container{
		width:65%;
		margin:auto;
	}
	
	form{
		width:60%;
		margin:auto;
		margin-top:50px;
	}
	
	.form-control{
		width:50%;
	}
</style>

<div id="container">
	<div id="content">
		<h2>탈퇴 안내</h2>
		<p class="context"">회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해 주세요.</p>
	</div>
	<div id="section_delete">
		<h4 class="h_dropout">
			사용하고 계신 아이디(<em>${loginInfo.id }</em>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
		</h4>
		<p class="dropout_dsc">
			<em style="user-select: auto;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가
				불가하오니 신중하게 선택하시기 바랍니다.</em>
		</p>
		<h4 class="h_dropout">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h4>
		<p class="dropout_dsc">회원정보 및 강의 결제 내역, 1:1 문의 등 개인형 서비스 이용기록은 모두
			삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
	</div>

	<div class="row g-5">
		<div class="d-block mx-auto mb-6">
			<form:form  action="delete.mem" method="post" commandName="mbean">
 				<div class="mb-3">
 					<div id="emailHelp" class="form-text">탈퇴할 아이디와 비밀번호를 입력해 주세요.</div>
    				<label for="id" class="form-label">아이디</label>
    				<input type="text" class="form-control" id="id" name="id" aria-describedby="emailHelp" value="${loginInfo.id }" readonly required>
  				</div>
  				<div class="mb-3">
   					<label for="pw" class="form-label">비밀번호</label>
    				<input type="password" class="form-control" id="pw" name="pw" required>
  				</div>
  				<div class="d-grid gap-2 col-6 mx-auto">
  					<div id="emailHelp" class="form-text">정말 탈퇴하시겠습니까?</div>
 					<button class="btn btn-primary" type="submit">탈퇴</button>
				</div>
			</form:form>
		</div>
	</div>
</div>