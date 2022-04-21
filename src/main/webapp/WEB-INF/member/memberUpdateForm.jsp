<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../user/ustop.jsp"%>
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script> 
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 				
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 				
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
 				
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            }
        }).open();
    }

    var checked = false;
    var check_res = false;
    var check_pw = false;
    
    $(function(){
    	$("input[name=pw]").keydown(function(){
    		check_pw = false;
    	})
    })	
    
    function pw_check(){
    	
    	var pw = $("input[name=pw]").val();
    	
    	var regexp = /^[a-z0-9]{3,12}$/;
    	var chk_num =  pw.search(/^[0-9]{3,12}$/);	
    	var chk_eng =  pw.search(/^[a-z]{3,12}$/);
    	

    	if(pw.search(regexp) == -1){
    		alert("3~12자리의 영소문자/숫자를 조합해 주세요");
    		return false;
    	}
    	if(chk_num == 0 || chk_eng == 0){
    		alert("3~12자리의 영소문자/숫자를 조합해 주세요");
    		return false;
    	}
    	
    	check_pw = true; 
    }


    function repw_check(){
    	if($("input[name=pw]").val() == $("input[name=repw]").val()){
    		$("#pwspan").html("<font style='font-size:small'>비밀번호가 일치 합니다</font>");
    	}
    	else{
    		$("#pwspan").html("<font color='red' style='font-size:small'>비밀번호가 일치 하지 않습니다</font>");
    	}
    }
    
function check(){
    	
    	if(check_pw == false){
    		alert("잘못된 비밀번호 형식입니다.");
    		return false;
    	}
    	
    }
    
    
</script>

<style>
main {
	width: 60%;
	margin: auto;
}
</style>
<link href="form-validation.css" rel="stylesheet">
</head>

	<main>
		<div class="py-5 text-center">
			<h2><b>내 정보 수정</b></h2>
		</div>

		<div class="row g-5">
			<div class="d-block mx-auto mb-6">
				<h4 class="mb-3">내 정보</h4>
				<form:form class="needs-validation" action="update.mem" method="post" commandName="mbean">
					<div class="row g-3">

						<input type="hidden" name="anum" value="${mbean.anum }"> 
						<input type="hidden" name="type" value="student">

						<div class="col-4">
							<label for="id" class="form-label">아이디</label>
							<div class="input-group has-validation">
								<!-- <span class="input-group-text">@</span> -->
								<input type="text" name="id" class="form-control" value="${mbean.id }" readonly>
							</div>
						</div>

						<div class="col-3"></div>

						<div class="col-5"></div>

						<div class="col-4">
							<label for="pw" class="form-label">비밀번호*</label>
							<div class="input-group has-validation">
								<!-- <span class="input-group-text">@</span> -->
								<input type="password" name="pw" class="form-control" onBlur="return pw_check()" value="${membean.pw }" required>
							</div>
						</div>

						<div class="col-8"></div>

						<div class="col-4">
							<label for="pw_re" class="form-label">비밀번호확인</label>
							<div class="input-group has-validation">
								<!-- <span class="input-group-text">@</span> -->
								<input type="password" name="repw" onkeyup="repw_check()" class="form-control" required>
								<div class="invalid-feedback">비밀번호 확인을 작성해주세요.</div>
							</div>
						</div>

						<div class="col-8">
							<label for="pw_re" class="form-label"><br></label>
							<div class="input-group has-validation">
								<span id="pwspan" style="font-size: 20px; font-weight: bold;"></span>
							</div>
						</div>

						<div class="col-4">
							<label for="aname" class="form-label">이름*</label>
							<div class="input-group has-validation">
								<!-- <span class="input-group-text">@</span> -->
								<input type="text" name="aname" class="form-control" value="${mbean.aname }">
								<div class="invalid-feedback">이름을 작성해주세요.</div>
							</div>
						</div>

						<div class="col-1"></div>

						<div class="col-6">
							<label for="aname" class="form-label">주민등록번호</label>
							<div class="input-group has-validation">
								<!-- <span class="input-group-text">@</span> -->
								<input type="text" name="rrn1" class="form-control" value="${mbean.rrn1 }" readonly> &nbsp;<b>-</b>&nbsp; 
								<input type="text" name="rrn2" class="form-control" value="${mbean.rrn2 }" readonly>
							</div>
						</div>

						<div class="col-12">
							<label for="email" class="form-label">E-mail*</label>
							<div class="input-group has-validation">
								<!-- <span class="input-group-text">@</span> -->
								<input type="text" name="email" class="form-control" value="${mbean.email }">
								<div class="invalid-feedback">E-mail을 작성해주세요.</div>
							</div>
						</div>

						<div class="col-12">
							<label for="phone" class="form-label">핸드폰 번호*</label>
							<div class="input-group has-validation">
								<!-- <span class="input-group-text">@</span> -->
								<input type="text" name="phone1" class="form-control" value="${mbean.phone1 }"> &nbsp;<b>-</b>&nbsp; 
								<input type="text" name="phone2" class="form-control" value="${mbean.phone2 }"> &nbsp;<b>-</b>&nbsp; 
								<input type="text" name="phone3" class="form-control" value="${mbean.phone3 }">
								<div class="invalid-feedback">전화번호를 입력해주세요.</div>
							</div>
						</div>

						<div class="col-4">
							<label for="addr" class="form-label">주소</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="sample4_postcode" name="addr_num" placeholder="우편번호" value="${fn:split(mbean.addr,'|')[0] }"> &nbsp;&nbsp; 
								<input type="button" class="btn btn-secondary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <span id="guide" style="color: #999"></span>
								<!-- <span class="input-group-text">@</span> -->
								<div class="invalid-feedback">주소를 작성해주세요.</div>
							</div>
						</div>

						<div class="col-8">
							<label for="addr_first" class="form-label"> <br></label>
							<div class="input-group has-validation">
								<!-- <span class="input-group-text">@</span> -->
								<input type="text" class="form-control" id="sample4_roadAddress" name="addr_first" placeholder="도로명주소" value="${fn:split(mbean.addr,'|')[1] }">
							</div>
						</div>

						<div class="col-12">
							<div class="input-group has-validation">
								<!-- <span class="input-group-text">@</span> -->
								<input type="text" class="form-control" name="addr_last" placeholder="나머지 주소 작성" value="${fn:split(mbean.addr,'|')[2] }">
							</div>
						</div>
						<div style="height: 20px;"></div>
						<div class="d-grid gap-2 col-6 mx-auto">
  							<button class="btn btn-primary" type="submit" onClick="return check()">수정하기</button>
  							<button class="btn btn-outline-danger" type="button" onClick="location.href='delete.mem?anum=${loginInfo.anum}'">회원 탈퇴</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</main>
	<br><br>
	<%@ include file="../user/usbottom.jsp"%>