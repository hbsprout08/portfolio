<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;}
    
    
	p{	font-family: 'Pretendard-Regular', '나눔고딕';
		color:white;	display:inline-block;	text-weight: 900;	font-size: 18px;}
	#roomName{background-color: #E66E00; text-weight: }
	#text{margin-left:100px;}
	
</style>
<meta charset="UTF-8">
<title>스터디룸</title>
</head>
<% request.setCharacterEncoding("UTF-8");%>
<body>
	<div id="text">
		<p id="roomName">${studyVO.study_name}</p><p>&nbsp;에 오신걸 환영합니다.</p><br>
		<p>현재 참여 인원: ${num} 명</p>
	</div>
<%@ include file="chat.jsp" %>
</body>
</html>