<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="bttop.jsp"%><!-- 광고 이미지 붙인것 -->

<Main>
<style>

	a {
		text-decoration: none;
	}

	#b-update{
    	border-radius : 3px;
    	border : 1px solid blue;
    	background-color: blue;
    	color: white;
    	height: 32px;
    	width: 40px;
    }
    #b-delete{
    	border-radius : 3px;
    	border : 1px solid red;
    	background-color: red;
    	color: white;
    	height: 32px;
    	width: 40px;
    }
	
		
	#button1{ /* 검색 버튼 색상 설정 */
    	border : 1px solid #35BCAE;
	   	background-color:#35BCAE;
    }

</style>
<script src="<%= request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">

	function upd(){
		location.href= "update.bt?num=${bt.num }&pageNumber=${pageInfo.pageNumber}";
	}
	
	function del(){
		location.href= "delete.bt?num=${bt.num }&pageNumber=${pageInfo.pageNumber}";
	} 

	function getinsert(){
		location.href = "insert.bt"; 
	}//getinsert
	
	function update(num,pageNumber){
 		//alert(2);
 		location.href= "update.bt?num=${bt.num }&pageNumber=${pageInfo.pageNumber}";
	}
	
	function answer(result){
		alert(result);
		/* alert(${fn:length(Answer)}); Answer Array에 들어가있는 요소의 갯수 출력*/
	}
	
	//** 본문에 있는 체크박스
	function allRowCheck(allck){//allRowCheck함수 정의. checkbox종류가 넘어오고 있으니까 아무 변수 지정해서 받아줄것. 여기선 allck로 받음.
		//alert(1);
		var chkArr = document.getElementsByName("rowcheck"); //document 영역에 이름이 rowcheck인걸 가져와봐라.. myform을 쓰면 안뜸.
		//chkArry 레코드 갯수만큼(방 갯수만큼) 배열이 생성
		//allck의 checked상태가 지금 어떤지 한 번 출력해볼것.
		var acheck = allck.checked;
		//alert("acheck:" + acheck);//check:true, check해제 : false
		if(acheck == true){//allcheck 체크한것임
			for(var i=0;i<chkArr.length;i++){//rowcheck길이만큼 반복..
				chkArr[i].checked = true; //체크 상태 트루로 만들어라..	
			}
		}
		else{//allcheck 해제한것임
			for(var i=0;i<chkArr.length;i++){
				chkArr[i].checked = false; //체크 상태 false되게 만들어라..	
			}
		}
	}//allRowCheck
	
	function selectDelete(){
		var chkArr = document.getElementsByName("rowcheck");
		flag = false ; 
		for(var i=0;i<chkArr.length;i++){
			if(chkArr[i].checked ==true){
				flag = true;
				//getdelete();//getdelete함수 호출 => BTDeleteController로 이동
			}
		}
			if(flag == false){
				alert("삭제할 체크박스 하나라도 선택하세요");
				return; //돌아가라고 써줘서 아래에 document.myform.submit();을 못만나게 해줘야지만.. 체크를 안했을 때 action으로 넘어가지 않음.
			}
			//유효성 검사가 다 끝났으면 document.myform.submit(); 마치 submit 누른것처럼 동작해라. 실제로는 submit이 없지만.. button을 누르면 submit누른것처럼 action으로 갈 수 있음.
			document.myform.submit();			
	}//selectDelete

	
	/*(기존)
	function subElse(elsesubck){
	      var elseck1 = elsesubck.checked;//subElse를 체크한 결과를 elseck1에 담아라.
	      if(elseck1 == false){ //true가 아니라 false라면(전체선택말고 과목별로 선택을 했다면)
	         if(document.getElementsById("subchk_all")[0].checked == true){ //subchk_all[0]번 방 체크되어있는지 확인해서(전체선택이 체크되어있어서 true이면)
	            $("input[id=subchk_all]").removeAttr("checked");//input타입의 name이 subchk_all인 것의 특정 속성(체크한 것)을 제거해라
	         }
	      }
	      //전체선택을 먼저 클릭하게되면 elseck1 같이 클릭되는걸 막기위해 정의
	      else if(elseck1 == true){//과목별 체크를 하게되면
	            if(document.getElementsById("subchk_all")[0].checked == true){//전체선택이 체크되어있는지 확인해서
	               $("input[id=subchk_all]").removeAttr("checked");//전체선택을 풀어주고
	            }
	      }
	      
	   }//subElse
	   
	   function subAll(allsubck){ //전체 선택을 클릭하면 실행됨
	      $("input[id=subchk]").removeAttr("checked");//전체 선택을 클릭하면 과목별 체크를 풀어라

	   }
	*/

	
	//(변경)
	//기본적으로 전체 + 모든 과목 다 체크
	//전체를 클릭하게되면 모든 과목 다 해제
	function subAll(allsubck){ //전체 선택을 클릭하면 실행됨
		var suball = allsubck.checked; //true
		if(suball == false){ //클릭하면 false
	      $("input[id=subchk]").removeAttr("checked");//전체 선택을 클릭하면 과목별 체크를 풀어라
		}
		else{
		  $('input:checkbox[id="subchk"]').attr("checked", true);//true이면 subchk를 전체 체크해라
		}
	   }
	
	function subElse(elsesubck){
	    var elseck1 = elsesubck.checked; //subElse를 체크한 결과를 elseck1에 담아라. true
	    if(elseck1 == false){ //true가 아니라 false라면(전체선택말고 과목별로 선택을 했다면)
	       $("input[name=subjectall]").removeAttr("checked");//input타입의 name이 subjectall인 것의 특정 속성(체크한 것)을 제거해라
	      }
	    }

</script>

<div id="body">

<body>
<center>
	<%-- <br>
	<form id="myArea" action="list.bt">
		<table id="allselect" width="700" border="1" align="center" style="background-color:#EAEAEA">
			<tr height="80">
				<td align="right">과목</td>
				<!-- <div class="form-check form-check-inline"> -->
				<td align="center"><!-- 칼럼에는 subject이 있음 -->
					<input type="checkbox" value="${i }" name="subjectall" onClick="subAll(this)" checked>전체
					<c:forEach var="i" items="${Subjects }"> <!-- items sub가져와서.. i변수에 넣고.. jstl로 접근...-->
					<c:if test="${i != 'ETC'}"><!-- 참,거짓 판별할 때 EL안에다가 써줘야함 -->
					<input type="checkbox" value="${i }"  id="subchk" name="subject" onClick="subElse(this)" checked>${i } &nbsp;
					</c:if>
					</c:forEach>
					<input type="checkbox" value="ETC"  id="subchk" name="subject" onClick="subElse(this)" checked>IT종합 &nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" class="btn-check" name="options-outlined" id="success-outlined" autocomplete="off" checked><!-- onClick="allselect(this)" -->
					<label class="btn btn-outline-success" for="success-outlined">검색</label>
				</td>
			</tr>
		</table>
	</form>
	<br><br> --%>
	 
	<br>
	<form id="myArea" action="list.bt">
		<table id="allselect" width="700" align="center" style="background-color:#F6F6F6">
			<tr height="80" border="1">
				<td align="center">
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" value="${i }" name="subjectall" onClick="subAll(this)" checked>
					  <label class="form-check-label" for="inlineCheckbox1">전체</label>
					</div>
					<c:forEach var="i" items="${Subjects }">
					<c:if test="${i != 'ETC'}">
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" value="${i }" id="subchk" name="subject" onClick="subElse(this)" checked>
					  <label class="form-check-label" for="inlineCheckbox2">${i }</label>
					</div>
					</c:if>
					</c:forEach>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" value="ETC" id="subchk" name="subject" onClick="subElse(this)" checked>
					  <label class="form-check-label" for="inlineCheckbox3">IT종합&nbsp;</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn-check" name="options-outlined" id="success-outlined" autocomplete="off" checked><!-- onClick="allselect(this)" -->
					<label class="btn btn-outline-success" for="success-outlined">검색</label>
				</td>
			</tr>
			<tr height="30px">
				<td colspan="2"></td>
			</tr>
		</table>
	</form>
	<br><br>	
	
	<!-- 아래 div 확인용 - 확인 다하면 지우기 -->
	<div id='result'>
	
	</div>


<!-- **************************************** -->
<%-- <c:choose>
	<c:when test="${sessionScope.loginInfo != null}">
		<c:if test="${sessionScope.loginInfo.type eq 'admin' }">
			<table id="myform2" width="700" border="1" align="center">
				<tr>
					<td align="right" colspan="4">
						<form action="delete.bt?num=${bt.num }&pageNumber=${pageInfo.pageNumber}"><!--  action="delete.bt"?num=${bt.num }&pageNumber=${pageInfo.pageNumber} -->
							<a>체크박스로 삭제,수정 작동 구현 보류 / 현재 추가 버튼만 사용됨 ▶</a>
							<input type="submit" value="삭제" onClick="selectDelete()">
							<input type="button" value="수정" onClick="update('${bt.num}','${pageInfo.pageNumber}')">
							<input type="button" value="추가" onClick="getinsert()">
						</form>
					</td>
					<!-- insert.bt get요청 => B_T_InsertController -->
				</tr>
			</table>
		</c:if>
		<c:if test="${sessionScope.loginInfo.type != 'admin' }">	
		</c:if>
	</c:when>
</c:choose>		 --%>

	<%-- (  총 레코드 건수 - ((보여줄 페이지 넘버-1)*한 페이지에 보여줄 건수)  )
		  5개라고 가정 - ((2-1)*5) => 0페이지
		  
		  <c:set var="page" value="${(totalCount - ((pageInfo.pageNumber-1)*pageInfo.pageSize)) }" />
		  <c:forEach var="bt" items="${BTList }">
		  <td align="center">${page}</td>
				<c:set var="page" value="${page -1 }" />
	--%>	
	<table id="myform2" width="900" align="center" action="post">
	 <c:choose>	
		<c:when test="${sessionScope.loginInfo != null}">
			<c:if test="${sessionScope.loginInfo.type eq 'admin' }">
				<tr align="center">
					<!-- <th><input type="checkbox" name="allcheck" onClick="allRowCheck(this)"></th>-->
					<!-- allcheck를 눌렀을 때 allRowCheck()함수 호출. 지금 클릭한 바로 이거 this=이름이 allcheck인 checkbox를 넘긴다.-->
					<th></th>
					<th>이미지</th>
					<th>문제</th>
					<th>답</th>
					<!-- <th>수정|삭제</th>-->
				</tr>
			</c:if>
		</c:when>
	</c:choose>	
		<c:if test="${totalCount == 0 }">
			<tr>
				<td colspan=4 align="center">등록된 문제가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${totalCount != 0 }">		
		<c:forEach var="bt" items="${BTList }">
		<tr>
			<%--<c:choose>	
				<c:when test="${sessionScope.loginInfo != null}">
					<c:if test="${sessionScope.loginInfo.type eq 'admin' }">
						<td><input type="checkbox" name="rowcheck" value="${bt.num }"></td>
					</c:if>
				</c:when>
			</c:choose>
			--%>			
						<td><input type="hidden" value=${bt.num }></td>
						<td> 
							<!-- 처음에 암호화(?)시킨걸 저장하려는 images 폴더에 파일을 다 넣어두긴 해야함. -->
							<img src="<%=request.getContextPath()%>/resources/images/${bt.quizimg}" width=200 height=200>
						</td>
						<td>
							<c:choose>	
								<c:when test="${sessionScope.loginInfo != null}">
									<c:if test="${sessionScope.loginInfo.type eq 'admin' }">
										<a href="detail.bt?num=${bt.num }&pageNumber=${pageInfo.pageNumber}">
									</c:if>
								</c:when>
							</c:choose>		
											<img src="<%=request.getContextPath() %>/resources/images/${bt.examfile}" width=500 height=200>
										</a>
											
						</td>
						<td>
							<c:forEach var="ans" items="${Answer }">
								<c:if test="${ans.num == bt.num }">
									<c:set var="result" value="${ans.answer }"/>
								</c:if>
							</c:forEach>
							<img src="<%=request.getContextPath() %>/resources/images/${bt.movingimg}" width=200 height=200 onclick="answer('${result}')">
						</td>
				<c:choose>	
					<c:when test="${sessionScope.loginInfo != null}">
						<c:if test="${sessionScope.loginInfo.type eq 'admin' }">			
						<td width="5%">
<%--						<input id="b-update" type="button" value="수정" onClick="upd()">&nbsp;
							<input id="b-delete" type="button" value="삭제" onClick="del()"> --%>
							<a href="update.bt?num=${bt.num }&pageNumber=${pageInfo.pageNumber}"><input id="b-update" type="button" value="수정"></a>&nbsp;
							<a href="delete.bt?num=${bt.num }&pageNumber=${pageInfo.pageNumber}"><input id="b-delete" type="button" value="삭제"></a>
						</td>
						</c:if>
					</c:when>
				</c:choose>		
		</tr>	
		</c:forEach>
		</c:if>
	</table>
	<br>
	</center>
</body>	

</div>
	<!-- 페이지 번호 설정 -->
	<center>
	<c:if test="${BTList == null }">
	</c:if>
	<c:if test="${BTList != null }">
	${pageInfo.pagingHtml}
	</c:if>
	</center>
</center>
<br><br><br>

<%@include file="../user/usbottom.jsp"%>