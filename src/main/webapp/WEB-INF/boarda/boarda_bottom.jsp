<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.helpdesk{
		max-height: 300px;
		text-align:right;
		height: auto;
		margin: 30px 300px;
	}
	
	hr{
		color: #747474;
		width:50%
		text-align: center;
	}
</style>
<div>
<hr>
<div class="helpdesk">
<p>혹시 해결이 안 되었다면? 상담원이 직접 도와주는 '1:1 문의'에 질문해 주세요!</p>
<!-- <button type="button" class="btn btn-secondary btn-lg" onClick="location.href='userlist.bod'">1:1 문의센터 바로가기</button> -->
<button type="button" class="btn btn-secondary btn-lg" onClick="location.href='list.bod?aname=${loginInfo.aname}'">1:1 문의센터 바로가기</button>
<br>
<strong>고객센터</strong>
<div class="time">
<p>월~금 8:00, 토 9:00~18:00</p>
<p>점심시간 12시~13시, 일요일 휴무</p>
</div>
XXXX-XXXX
</div>
<hr>
</div>
<%@include file="../user/usbottom.jsp"%>