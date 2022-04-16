<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../admin/adtop.jsp" %>

<!-- Custom styles for this template -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function do1(){
	var res = document.forms[0].paymentMethod.value;
	alert(res);
}
/* 카드결제 */
function kg(){
	  //class가 btn_payment인 태그를 선택했을 때 작동한다.
		var IMP = window.IMP;
	  	IMP.init('imp61700942');/*'가맹점 식별코드'*/
	  	//결제시 전달되는 정보
		IMP.request_pay({
				    pg : 'inicis', 
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명:결제테스트'/*상품명*/,
				    amount :  ${totalprice } /*상품 가격*/, 
				    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
				    buyer_name : '구매자이름',
				    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
				    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
				    buyer_postcode : '123-456'/*구매자 우편번호*/
				}, function(rsp) {
					var result = '';
				    if(rsp.success) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        result ='0';
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        result ='1';
				    }
				    if(result=='0') {
				    	location.href= "shlistdetail.stu";
				    }
				    alert(msg);
				});
};

/* 가상계좌 */
function danal(){
	  //class가 btn_payment인 태그를 선택했을 때 작동한다.
		var IMP = window.IMP;
	  	IMP.init('imp61700942');/*'가맹점 식별코드'*/
	  	//결제시 전달되는 정보
		IMP.request_pay({
				    pg : 'danal', 
				    pay_method : 'vbank',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명:결제테스트'/*상품명*/,
				    amount :  ${totalprice } /*상품 가격*/, 
				    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
				    buyer_name : '구매자이름',
				    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
				    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
				    buyer_postcode : '123-456'/*구매자 우편번호*/
				}, function(rsp) {
					var result = '';
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        result ='0';
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        result ='1';
				    }
				    if(result=='0') {
				    	location.href="shlistdetail.stu";
				    }
				    alert(msg);
				});
};

/* 카카오페이 */
function kakao(){

        //class가 btn_payment인 태그를 선택했을 때 작동한다.
		var IMP = window.IMP;
	  	IMP.init('imp61700942');/*'가맹점 식별코드'*/
	  	//결제시 전달되는 정보
		IMP.request_pay({
				    pg : 'kakaopay', 
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명:결제테스트'/*상품명*/,
				    amount :  ${totalprice } /*상품 가격*/, 
				    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
				    buyer_name : '구매자이름',
				    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
				    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
				    buyer_postcode : '123-456'/*구매자 우편번호*/
				}, function(rsp) {
					var result = '';
				    if(rsp.success) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        result ='0';
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        result ='1';
				    }
				    if(result=='0') {
				    	location.href= "shlistdetail.stu";
				    }
				    alert(msg);
				});
};

/* 	
결제수단 선택하면 결제수단 관련내용 출력되게하기
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
} //div_show
 */
 
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
            <span class="text-muted">
            <fmt:formatNumber value="${cart.coprice}" pattern="#,###,###"/>원
            <%-- ${cart.coprice}원 --%>
            </span>
          </li>
        </c:forEach>  
          <li class="list-group-item d-flex justify-content-between">
            <span>최종 결제금액</span>
            <strong>
            <fmt:formatNumber value="${totalprice }" pattern="#,###,###"/>원
            <%-- ${totalprice }원 --%>
            </strong>
          </li>
        </ul> 
      </div>
      
      <div class="col-md-7 col-lg-8">
      <form class="needs-validation" method="post" action="buycos.stu" novalidate> <!-- form여깃음 -->
       <hr class="my-4">
       <br>
          <h4 class="mb-3">결제수단 선택</h4> <!-- 미완성3:결제수단 어떤거 선택할건지? -->
         
          <div class="my-3">
          
            <div class="form-check">
              <!-- <input id="radio_p1" name="paymentMethod" type="radio" class="form-check-input" onclick="div_show('1');" required> -->
              <input id="radio_p1" name="paymentMethod" type="radio" class="form-check-input" value="kg" required>
              <label class="form-check-label" for="payment1">신용카드</label>
            </div>
            
            
            <div class="form-check">
              <!-- <input id="radio_p2" name="paymentMethod" type="radio" class="form-check-input" onclick="div_show('2');" required> -->
              <input id="radio_p1" name="paymentMethod" type="radio" class="form-check-input" value="danal" required>
              <label class="form-check-label" for="payment2">무통장입금</label>
            </div>
            
            
            <div class="form-check">
              <!-- <input id="radio_p3" name="paymentMethod" type="radio" class="form-check-input" onclick="div_show('3');" required> -->
              <input id="radio_p1" name="paymentMethod" type="radio" class="form-check-input" value="kakao" required>
              <label class="form-check-label" for="payment3">카카오페이</label>
            </div>
            
          </div>
          <br>
          
          <!-- 
          신용카드결제부분
          <div class="col-md-5">
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
            <div class="col-md-5">
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
		  <input type="text" name="" value="sysdate+1" readonly>
		  <label for="country" class="form-label">입금자명</label>
		   <input type="text" name="" value="고객명" readonly>
		  무통장입금부분 
		  </div>
		   -->
		  
          <br><br>
          <!-- <hr class="my-4"> -->
          <button class="w-100 btn btn-primary btn-lg" onclick="do1()" type="button">결제하기</button>
        </form>
	 	<br><br>
      </div>
    </div>
  </main>
</div>


<%@ include file="../admin/adbottom.jsp" %>
<br>

<!-- 
<script>
$("#check_module").click(function () {
var IMP = window.IMP; // 생략가능
IMP.init('가맹점식별코드를 넣어주세요');
// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
IMP.request_pay({
pg: 'inicis', // version 1.1.0부터 지원.
/*
'kakao':카카오페이,
html5_inicis':이니시스(웹표준결제)
'nice':나이스페이
'jtnet':제이티넷
'uplus':LG유플러스
'danal':다날
'payco':페이코
'syrup':시럽페이
'paypal':페이팔
*/
pay_method: 'card',
/*
'samsung':삼성페이,
'card':신용카드,
'trans':실시간계좌이체,
'vbank':가상계좌,
'phone':휴대폰소액결제
*/
merchant_uid: 'merchant_' + new Date().getTime(),
/*
merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
참고하세요.
나중에 포스팅 해볼게요.
*/
name: '주문명:결제테스트',
//결제창에서 보여질 이름
amount: 1000,
//가격
buyer_email: 'iamport@siot.do',
buyer_name: '구매자이름',
buyer_tel: '010-1234-5678',
buyer_addr: '서울특별시 강남구 삼성동',
buyer_postcode: '123-456',
m_redirect_url: 'https://www.yourdomain.com/payments/complete'
/*
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
var msg = '결제가 완료되었습니다.';
msg += '고유ID : ' + rsp.imp_uid;
msg += '상점 거래ID : ' + rsp.merchant_uid;
msg += '결제 금액 : ' + rsp.paid_amount;
msg += '카드 승인번호 : ' + rsp.apply_num;
} else {
var msg = '결제에 실패하였습니다.';
msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
});
});
</script>


출처: https://minaminaworld.tistory.com/78 [미나미 블로그] 
-->