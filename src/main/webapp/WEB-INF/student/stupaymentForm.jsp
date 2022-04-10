<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../admin/adtop.jsp" %>

<!-- Custom styles for this template -->
<style> /* 가운데정렬 다시 손봐야함!! */
	div{
		margin:auto;
	}
</style>


<link href="form-validation.css" rel="stylesheet">
<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>결제내역</h2>
      <p class="lead"></p>
    </div>

    <div class="row g-5">
    
     <!-- Your Cart(미완성1:구매상품 정보 넘기기...???? 이 폼을 사용해도 되는지? input으로 바꿔야하는지?) -->	
      <div class="col-md-7 col-lg-8">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">구매상품</span>
          <span class="badge bg-primary rounded-pill">구매수량(3)</span>
        </h4>
        
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">HTML 뿌시기 (초급)</h6>
              <small class="text-muted">A선생님의 HTML</small>
            </div>
            <span class="text-muted">70,000원</span>
          </li>
          
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">CSS 뿌시기(초급)</h6>
              <small class="text-muted">B선생님의 CSS</small>
            </div>
            <span class="text-muted">50,000원</span>
          </li>
          
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">JS 뿌시기(중급)</h6>
              <small class="text-muted">B선생님의 JS</small>
            </div>
            <span class="text-muted">100,000원</span>
          </li>
          <!-- 
          할인폼인데 이건 어떻게 적용할건지 고민해봐야함(미완성2)
          <li class="list-group-item d-flex justify-content-between bg-light">
            <div class="text-success">
              <h6 class="my-0">Promo code</h6>
              <small>EXAMPLECODE</small>
            </div>
            <span class="text-success">−$5</span>
          </li>
           -->
          <li class="list-group-item d-flex justify-content-between">
            <span>최종 결제금액</span>
            <strong>220,000원</strong>
          </li>
        </ul> 
      </div>
      
      <div class="col-md-7 col-lg-8">
       <hr class="my-4">
       <br>
        <form class="needs-validation" method="post" action="??????" novalidate>
          <h4 class="mb-3">결제수단 선택</h4> <!-- 미완성3:결제수단 어떤거 선택할건지? -->
         
          <div class="my-3">
          
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">신용카드</label>
            </div>
            
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="debit">무통장입금</label>
            </div>
            
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="paypal">카카오페이</label>
            </div>
            
          </div>
          <br>
          <!-- 결제수단==신용카드 (미완성4:IF문 연결해서 신용카드 선택하면 이 목록 나오게하기)-->
          <div class="col-md-5">
              <label for="country" class="form-label">카드종류</label>
              <select class="form-select" id="country" required>
                <option value="">카드선택</option>
                <option>BC카드</option>
                <option>하나카드</option>
                <option>우리카드</option>
                <option>신협카드</option>
                <option>전북카드</option>
                <option>씨티카드</option>
                <option>삼성카드</option>
                <option>신한카드</option>
                <option>카카오뱅크</option>
                <option>광주비자</option>
                <option>제주카드</option>
                <option>현대카드</option>
                <option>롯데카드</option>
                <option>KB카드</option>
                <option>NH카드</option>
                <option>외환카드</option>
              </select>
              <div class="invalid-feedback">
                Please select a valid country.
              </div>
            </div>
            <br>
            <div class="col-md-5">
              <label for="country" class="form-label">할부종류</label>
              <select class="form-select" id="country" required>
                <option value="">할부선택</option>
                <option>일시불</option>
                <option>2개월</option>
                <option>3개월</option>
                <option>4개월</option>
                <option>5개월</option>
                <option>6개월</option>
                <option>7개월</option>
                <option>8개월</option>
                <option>9개월</option>
                <option>10개월</option>
                <option>11개월</option>
                <option>12개월</option>
              </select>
              <div class="invalid-feedback">
                Please select a valid country.
              </div>
           </div>
          <br><br>
          <!-- <hr class="my-4"> -->
          <button class="w-100 btn btn-primary btn-lg" type="submit">결제하기</button>
        </form>
	 	<br><br>
      </div>
    </div>
  </main>
</div>


<%@ include file="../admin/adbottom.jsp" %>
<br>