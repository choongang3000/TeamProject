<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../admin/adtop.jsp" %>

<!-- Custom styles for this template -->
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	function div_show(selectNum){
		var obj1 = document.getElementById("radio_v1");
		var obj2 = document.getElementById("radio_v2");
		var obj3 = document.getElementById("radio_v3");
		
		if(selectNum == "1") {
		    obj1.style.display = "block";    
		    obj2.style.display = "block";
		    obj3.style.display = "none";
		} 
		else if(selectNum == "2"){
			obj1.style.display = "none";    
		    obj2.style.display = "none";
		    obj3.style.display = "block";
		}
		else{
			obj1.style.display = "none";    
		    obj2.style.display = "none";
		    obj3.style.display = "none";
		}
	}
</script>
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
     <!-- cartArr 을 반복문 사용하여 구현 -->
     
      <div class="col-md-7 col-lg-8">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">구매상품</span>
          <span class="badge bg-primary rounded-pill">구매수량(${totalcount })</span>
        </h4>
        
        <ul class="list-group mb-3">
        <c:forEach var="cart" items="${cartArr }">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">${cart.coname }</h6>
              <small class="text-muted">${cart.coteacher }의 ${cart.cosubject }</small>
            </div>
            <span class="text-muted">${cart.coprice}원</span>
          </li>
        </c:forEach>  
          <!-- 
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
           -->
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
            <strong>${totalprice }원</strong>
          </li>
        </ul> 
      </div>
      
      <div class="col-md-7 col-lg-8">
       <hr class="my-4">
       <br>
        <form class="needs-validation" method="post" action="buycos.stu" novalidate> <!-- form여깃음 -->
          <h4 class="mb-3">결제수단 선택</h4> <!-- 미완성3:결제수단 어떤거 선택할건지? -->
         
          <div class="my-3">
          
            <div class="form-check">
              <input id="radio_p1" name="paymentMethod" type="radio" class="form-check-input" onclick="div_show('1');" required>
              <label class="form-check-label" for="payment1">신용카드</label>
            </div>
            
            
            <div class="form-check">
              <input id="radio_p2" name="paymentMethod" type="radio" class="form-check-input" onclick="div_show('2');" required>
              <label class="form-check-label" for="payment2">무통장입금</label>
            </div>
            
            
            <div class="form-check">
              <input id="radio_p3" name="paymentMethod" type="radio" class="form-check-input" onclick="div_show('3');" required>
              <label class="form-check-label" for="payment3">카카오페이</label>
            </div>
            
          </div>
          <br>
          
          <!-- 신용카드결제부분 -->
          <!-- <div class="col-md-5"> -->
		  <div id="radio_v1" style="display:none">
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
            <!-- <div class="col-md-5"> -->
            <div id="radio_v2" style="display:none">
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
          
		  <br>
		  
		  <div id="radio_v3" style="display:none">
		  <label for="country" class="form-label">은행명</label>
		   <select class="form-select" id="country" required>
                <option value="">은행선택</option>
                <option>기업</option>
                <option>국민</option>
                <option>수협</option>
                <option>농협</option>
                <option>우리</option>
                <option>대구</option>
                <option>부산</option>
                <option>경남</option>
                <option>우체국</option>
                <option>하나</option>
                <option>신한</option>
              </select>
          <br>
		  <label for="country" class="form-label">입금기한</label>
		  <input type="text" name="" value="2022.04.14" readonly>
		  <label for="country" class="form-label">입금자명</label>
		   <input type="text" name="" value="고객명" readonly>
		  <!-- 무통장입금부분 --> 
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