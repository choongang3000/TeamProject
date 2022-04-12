<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
start.jsp <br><br><br>

<%
	String viewMember = request.getContextPath()+"/MemInfo.info";

	String viewOrder = request.getContextPath()+"/order.mall"; // 선생님 강의판매내역
%>

<a href="<%=viewMember%>">회원 정보 보기</a> <br><br>

<a href="<%=viewOrder%>">강의 판매 내역</a> <br><br>

