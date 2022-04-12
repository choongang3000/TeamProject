<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adtop.jsp" %>
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
      <h2>강사 정보 수정</h2>
    </div>
    
    <div class="row g-5">
      <div class="d-block mx-auto mb-6">
        <h4 class="mb-3">강사 정보</h4>
		<form class="needs-validation" action="tcupdate.ad" method="post" enctype="multipart/form-data">
          <div class="row g-3">	
          
			<input type="hidden" name="anum" value="${tbean.anum }">
			<input type="hidden" name="tnum" value="${tbean.tnum }">
			<input type="hidden" name="type" value="teacher">
	
			<div class="col-4">
              <label for="id" class="form-label">ID</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="id" class="form-control" value="${tbean.id }" disabled="disabled">
              </div>
            </div>
            
            <div class="col-1">
            </div>
            
            <div class="col-4">
              <label for="pw" class="form-label">PW</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="pw" class="form-control" value="${tbean.pw }" disabled="disabled">
              </div>
            </div>
            
            <div class="col-3">
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
              <label for="aname" class="form-label">주민등록번호</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="rrn1" class="form-control" value="${tbean.rrn1 }" disabled>
                &nbsp;<b>-</b>&nbsp;
           		<input type="text" name="rrn2" class="form-control" value="${tbean.rrn2 }" disabled>
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
            
            <div class="col-4">
              <label for="addr" class="form-label">주소</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="sample4_postcode" name="addr_num" placeholder="우편번호" value="${fn:split(tbean.addr,'|')[0] }">
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
              	<input type="text" class="form-control" id="sample4_roadAddress" name="addr_first" placeholder="도로명주소" value="${fn:split(tbean.addr,'|')[1] }">   
              </div>
            </div>

            <div class="col-12">
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
              	<input type="text" class="form-control" name="addr_last" placeholder="나머지 주소 작성" value="${fn:split(tbean.addr,'|')[2] }">   
              </div>
            </div>
            <%-- 
            <div class="col-12">
              <label for="addr" class="form-label">주소</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <input type="text" name="addr" class="form-control" value="${tbean.addr }">
	            <div class="invalid-feedback">
	               주소를 작성해주세요.
	            </div>
              </div>
            </div>
             --%>
            <div class="col-12">
              <label for="addr" class="form-label">강사 사진</label>
              <div class="input-group has-validation">
                <!-- <span class="input-group-text">@</span> -->
                <img src="<%=request.getContextPath() %>/resources/${tbean.t_image}" width=150 height=180> 
				&nbsp;
				<c:set var="lenstr" value="${fn:length(tbean.t_image) }"/> 
				${fn:substring(tbean.t_image,37,lenstr)}
              </div>
            </div>
            
             <div class="col-12">
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
			
            <button class="w-50 btn btn-secondary btn-mg" type="button" onClick="history.back()">강사 상세보기로 돌아가기</button>
            <button class="w-50 btn btn-primary btn-mg" type="submit">강사계정 수정완료</button>
            
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

<%-- <table class="table" style="width:700px">
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">성함</th>
		<td><input type="text" name="aname" value="${tbean.aname }"></td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">주민등록번호</th>
		<td>
			<input type="text" name="rrn1" value="${tbean.rrn1 }" class="form-control form-control-sm" style="width:120px; display:inline;" disabled>
			 - 
			<input type="text" name="rrn2" value="${tbean.rrn2 }" class="form-control form-control-sm" style="width:120px; display:inline;" disabled>
		</td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">E-mail</th>
		<td><input type="email" name="email" value="${tbean.email }"></td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">전화번호</th>
		<td><input type="text" name="phone1" value="${tbean.phone1 }">-<input type="text" name="phone2" value="${tbean.phone2 }">-<input type="text" name="phone3" value="${tbean.phone3 }"></td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">주소</th>
		<td><input type="text" name="addr" value="${tbean.addr }"></td>
	</tr>
	<tr>
		<th colspan=3 class="table-active" style="text-align: center">◈ 계약 관련 ◈</th>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">강사 사진</th>
		<td>
			<img src="<%=request.getContextPath() %>/resources/${tbean.t_image}" width=130 height=180> 
			<br>
			<font style="font-weight: bold;">현재 사진 :</font> 
			<c:set var="lenstr" value="${fn:length(tbean.t_image) }"/> 
			${fn:substring(tbean.t_image,37,lenstr)}
			<br>
			<input type="file" name="upload">	
		</td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">과목</th>
		<td align=center>
			<c:forEach var="i" begin="0" end="${fn:length(subArr)-1}" >
				<c:if test="${i%5 == 0 and i != 0 }">
					<br>
				</c:if>
				${subArr[i] }<input type="checkbox" name="subject" value="${subArr[i] }" <c:if test="${fn:contains(tbean.subject,subArr[i]) }">checked</c:if> >&nbsp;&nbsp;
			</c:forEach>
		</td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">계약기간</th>
		<td>
			<fmt:parseDate var="dateString" value="${tbean.tterm }" pattern="yyyy-MM-dd"></fmt:parseDate>	
			<input type="date" name="tterm" value="<fmt:formatDate value="${dateString }" type="both" pattern="yyyy-MM-dd"/>">
		</td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">강사 소개</th>
		<td><textarea name="introduction" style="width:550px; height:100px; resize: none;">${tbean.introduction }</textarea></td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">강사 임금 비율</th>
		<td><input type="text" name="twageratio" value="${tbean.twageratio }"></td>
	</tr>
	<tr style="border-bottom:1px solid gray">
		<th class="table-active" style="text-align:center; width:150px; border-right: 1px solid gray;">Visa</th>
		<td><input type="text" name="visa" value="${tbean.visa }"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="submit" value="수정 완료">
		</td>
	</tr>
</table> --%>