<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adtop.jsp" %>
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

    $(function(){

    	$("input[name=id]").keydown(function(){
    		$("#idspan").css("display","none");
    		checked = false;
    		check_res = false;
    	})
    	
    	$("input[name=id_check]").click(function(){	
    		
    		$.ajax({
    			url : "check_id.ad",
    			data : ({
    				input_id : $("input[name=id]").val(),
    			}),
    			success : function(data){
    				checked = true;
    				if($.trim(data) == "impossible"){
    					$("#idspan").html("<font color='red' style='font-size:small'>중복된 ID입니다</font>");
    					$("#idspan").show();
    					$("input[name=id]").select();
    				}
    				else{
    					$("#idspan").html("<font color='red' style='font-size:small'>사용 가능한 ID입니다</font>");	
    					$("#idspan").show();
    					check_res = true;
    				}
    			}
    			
    		})//ajax	
    	})//id_check click */
    })//ready

    function pw_check(){
    	
    	var pw = $("input[name=pw]").val();
    	
    	var regexp = /^[a-z0-9]{3,12}$/;
    	var chk_num =  pw.search(/^[0-9]{3,12}$/);	
    	var chk_eng =  pw.search(/^[a-z]{3,12}$/);
    	

    	if(pw.search(regexp) == -1){
    		alert("3~12자리의 영소문자/숫자를 조합해 주세요");
    	}
    	if(chk_num == 0 || chk_eng == 0){
    		alert("3~12자리의 영소문자/숫자를 조합해 주세요");
    		return false;
    	}
    	
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
    	
    	if($("input[name=id]").val() == ""){
    		alert("ID를 입력해 주세요");
    		$("input[name=id]").focus();
    		return false;
    	}
    	
    	if(checked == false){
    		alert("ID 중복확인을 해주세요");
    		return false;
    	}
    	
    	if(check_res == false){
    		alert("중복된 ID 입니다");
    		$("input[name=id]").select();
    		return false;
    	}
    	
    }
    
    
</script>



<style>
	body{
		width:60%;
		margin:auto;
	}
</style>
<link href="form-validation.css" rel="stylesheet">
</head>

<body class="bg-light">
	<main>
	<div class="py-5 text-center">
      <h2>강사 계정 생성</h2>
    </div>
    
    <div class="row g-5">
      <div class="d-block mx-auto mb-6">
		<form class="needs-validation" action="tcinsert.ad" method="post" enctype="multipart/form-data">
          <div class="row g-3">	
          
			<input type="hidden" name="type" value="teacher">
	
			<div class="col-4">
              <label for="id" class="form-label">아이디*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="id" class="form-control" value="${tbean.id }">
              </div>
            </div>
            
            <div class="col-3">
	            <label for="id" class="form-label"><br></label>
	              <div class="input-group has-validation">
	                <!-- <span class="input-group-text">@</span> -->
	                <input type="button" name="id_check" class="btn btn-secondary" value="아이디 중복 확인">
	              </div>
            </div>
            
            <div class="col-5">
            	<label for="id" class="form-label"><br></label>
	              <div>
					<span id="idspan" style="font-size:20px; font-weight:bold;"></span>
	              </div>
            </div>
            
            <div class="col-4">
              <label for="pw" class="form-label">비밀번호*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="pw" class="form-control" onBlur="return pw_check()" value="${tbean.pw }">
              </div>
            </div>
	
			 <div class="col-8">
            </div>
			
            <div class="col-4">
              <label for="pw_re" class="form-label">비밀번호확인</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="repw" onkeyup="repw_check()" class="form-control">
                <div class="invalid-feedback">
                  비밀번호 확인을 작성해주세요.
                </div>
              </div>
            </div>
            
            <div class="col-8">
            	<label for="pw_re" class="form-label"><br></label>
              <div class="input-group has-validation">
				<span id="pwspan" style="font-size:20px; font-weight:bold;"></span>
              </div> 
            </div>
            
             <div class="col-4">
              <label for="aname" class="form-label">이름*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="aname" class="form-control" value="${tbean.aname }">
              <div class="invalid-feedback">
                  이름을 작성해주세요.
                </div>
              </div>
            </div>
            
            <div class="col-1">
            </div>
            
            <div class="col-6">
              <label for="aname" class="form-label">주민등록번호*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="rrn1" class="form-control" value="${tbean.rrn1 }">
                &nbsp;<b>-</b>&nbsp;
           		<input type="text" name="rrn2" class="form-control" value="${tbean.rrn2 }">
              </div>
            </div>
            
            <div class="col-12">
              <label for="email" class="form-label">E-mail*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="email" class="form-control" value="${tbean.email }">
              <div class="invalid-feedback">
                  E-mail을 작성해주세요.
                </div>
              </div>
            </div>
            
            <div class="col-12">
              <label for="phone" class="form-label">핸드폰 번호*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="phone1" class="form-control" value="${tbean.phone1 }">
                &nbsp;<b>-</b>&nbsp;
                <input type="text" name="phone2" class="form-control" value="${tbean.phone2 }">
                &nbsp;<b>-</b>&nbsp;
                <input type="text" name="phone3" class="form-control" value="${tbean.phone3 }">
              <div class="invalid-feedback">
                  전화번호를 입력해주세요.
                </div>
              </div>
            </div>
            <!-- &nbsp;&nbsp; -->
            <div class="col-4">
              <label for="addr" class="form-label">주소</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="sample4_postcode" name="addr_num" placeholder="우편번호">
				&nbsp;&nbsp;
				<input type="button" class="btn btn-secondary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				<span id="guide" style="color:#999"></span>
                <!-- <span class="input-group-text">@</span> -->
                <div class="invalid-feedback">
	               주소를 작성해주세요.
	            </div>
              </div>
            </div>
             
            <div class="col-8">
            	<label for="addr_first" class="form-label"> <br></label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
              	<input type="text" class="form-control" id="sample4_roadAddress" name="addr_first" placeholder="도로명주소">   
              </div>
            </div>

            <div class="col-12">
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
              	<input type="text" class="form-control" name="addr_last" placeholder="나머지 주소 작성">   
              </div>
            </div>
			

            <div class="col-12">
              <label for="upload" class="form-label">강사 사진</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
              	<input type="file" class="form-control" name="upload">   
              </div>
            </div>

            <div class="col-12"></div>
            
            <div class="col-12">
              <label for="subject" class="form-label">과목*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach var="i" begin="0" end="${fn:length(subArr)-1}" >
					${subArr[i] }&nbsp;<input  type="checkbox" name="subject" value="${subArr[i] }" <c:if test="${fn:contains(tbean.subject,subArr[i]) }">checked</c:if> >&nbsp;&nbsp;&nbsp;
				</c:forEach>
	            <div class="invalid-feedback">
	               과목을 선택해주세요.
	            </div>
              </div>
            </div>
			
			<div class="col-12"></div>
			
			<div class="col-12">
              <label for="tterm" class="form-label">계약기간*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <fmt:parseDate var="dateString" value="${tbean.tterm }" pattern="yyyy-MM-dd"></fmt:parseDate>	
				<input type="date" name="tterm" value="<fmt:formatDate value="${dateString }" type="both" pattern="yyyy-MM-dd"/>">
	            <div class="invalid-feedback">
	               계약기간을 선택해주세요.
	            </div>
              </div>
            </div>
            
            <div class="col-12"></div>
            
            <div class="col-12">
              <label for="tterm" class="form-label">강사소개</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <textarea class="form-control" name="introduction" style="height: 100px; resize: none;">${tbean.introduction }</textarea>
	            <div class="invalid-feedback">
	               강사소개를 입력해주세요.
	            </div>
              </div>
            </div>
            
            <div class="col-12">
              <label for="twageratio" class="form-label">강사 임금 비율*</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="twageratio" class="form-control" value="${tbean.twageratio }">
	            <div class="invalid-feedback">
	               임금 비율을 작성해주세요.
	            </div>
              </div>
            </div>
            
            <div class="col-12">
              <label for="visa" class="form-label">Visa</label>
              <div class="input-group">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="visa" class="form-control" value="${tbean.visa }">
              </div>
            </div>
            
            <hr class="my-4">
			
            <button class="w-50 btn btn-secondary btn-mg" type="button" onClick="history.back()">강사 목록으로 돌아가기</button>
            <button class="w-50 btn btn-primary btn-mg" type="submit" onClick="return check()">강사계정 생성</button>
            
		</div>
        </form>
      </div>
    </div>
  </main>
  
  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2021 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
<%@ include file="adbottom.jsp" %>

















<%-- <%@ include file="bottom.jsp"%> --%>