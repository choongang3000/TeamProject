<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String[] phoneArr = {"010","011"};
%>
<style>
.wrap {
		width:500px;
		margin:auto;
}
.item-order {
		width:500px;
}
.btn-order {
            width: 100px;
            margin: auto;
            display: block;
        }
</style>
<%@ include file="../common/common.jsp"%>
<%@ include file="../fix/ad_top.jsp"%>
<form:form commandName="ac"  action="accounts.ac" method="post">
<input type="hidden" name="anum" value="${ac.anum}">
	<div class="wrap">
		<div class=item-order">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text" for="inputGroupSelect01">구분</label>
				</div>
				<select name="type" class="form-select" aria-label="Default select example">
				
				</select>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">아이디</span>
				</div>
				<input type="text" class="form-control" aria-describedby="basic-addon1" name="id" value="${ac.id}" readonly="readonly">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">비밀번호</span>
				</div>
				<input type="password" class="form-control" aria-describedby="basic-addon1" name="pw"> 영문 소문자/숫자 조합 3~8자
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">이름</span>
				</div>
				<input type="text" class="form-control" aria-describedby="basic-addon1" name="aname" value="${ac.id}" readonly="readonly">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">주민 등록 번호</span>
				</div>
				<input type="text" class="form-control" aria-describedby="basic-addon1" name="rrn1" value="${ac.rrn1}" readonly="readonly">-
				<input type="text" class="form-control" aria-describedby="basic-addon1" name="rrn2" value="${ac.rrn2}" readonly="readonly">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1"> E-Mail </span>
				</div>
				<input type="text" class="form-control" aria-describedby="basic-addon1" name="email" value="${ac.rrn1}" >
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">휴대폰 번호</span>
				</div>
				<select name="phoneArr" class="form-select" aria-label="Default select example">
				<c:forEach var="phone1" items="${phone1 }">
					<option value="${phone1}" <c:if test="${ac.phone1 == phone1}">selected</c:if>>${phone1}
				</c:forEach>
				</select>-
				<input type="text" class="form-control" aria-describedby="basic-addon1" name="phone2" size="4" maxlength="4" value="${ac.phone2}">-
				<input type="text" class="form-control" aria-describedby="basic-addon1" name="phone3 " size="4" maxlength="4" value="${ac.phone3}">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">주소</span>
				</div>
				<input type="text" class="form-control" aria-describedby="basic-addon1" name="addr" value="${ac.addr}">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">아이디</span>
				</div>
				<input type="text" class="form-control" aria-describedby="basic-addon1" name="joindate" value="${ac.joindate}" readonly="readonly">
			</div>
		</div>
		<button type="submit" class="btn btn-primary btn-order">정보 수정</button>
		<button type="reset" class="btn btn-primary btn-order">취소</button>
	</div>
	</div>
</form:form>