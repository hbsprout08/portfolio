<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>로그인</title>
</head>
 <style>
			 
@import url('https://fonts.googleapis.com/css2?family=Sacramento&display=swap');
      
    @font-face {
    font-family: 'ChosunSg';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunSg.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'title';
    src: url("${pageContext.request.contextPath}/resources/MindFont.otf") format('opentype');
}

	* {   margin: 0; padding: 0; font-family: 'ChosunSg';}
			        
	#login { margin: 140px auto; /*가로너비*/
			 width: 400px; /*높이만큼 늘어남*/
			 overflow: hidden; /*배경색상*/
			/*안쪽여백*/
			padding: 30px;	padding-top: 50px;	padding-bottom: 50px;
			/*글자의 정렬*/
			text-align: center;/*box안에 인라인 요소들 가운데 정렬?  */
			border:1px solid #ddd;
			border-radius:4px;
             box-shadow:  2px 5px 16px 0px, 5px 5px 15px 5px rgba(0,0,0,0); }
			        
	#login .gongbooz { color:#ffffff;	margin-bottom:70px;	margin-top:40px;
			            font-family: 'title', cursive;	font-size:44px;	} 
		
			
			        
	label {display: none;}
			        
	.box { /*가로너비*/	width:270px;
			/*세로높이*/	height: 40px;
			/*안쪽여백*/	padding-left: 20px;	padding-right: 20px;
			/*바깥쪽 여백*/	margin-bottom: 20px;
			/*테두리 스타일*/ border: none;
			background: transparent;	color:white;	font-size:14px;	border-bottom: 1px solid #ffffff; }
			       
	 .box::placeholder{color:#ddd;		font-weight:bold;}
			        
	.btn:hover{ background-color:#E1E1E1; }	        
			       
			        
	.btn {/*가로너비*/		width: 300px;
		/*세로높이*/		height: 44px;
		/*글자크기*/		font-size: 15px;
		/*글자색상*/		color:#4C4C4C;
		/*배경색상*/		background-color:#FFFFFF;
		/*테두리없음*/		border: none;		border-radius:4px;	margin-top:30px;	font-weight:bold;}
					
	hr{margin-top:17px;		margin-bottom:17px;		width:300px;
		border:dotted 1px #eee;	 margin-left:47px;}
				

	a{color:white;		text-decoration:none;	font-size:14px;	 margin-top:20px;}
					
	p{font-size:14px;	margin-top:30px;}
					
	.join{ margin-top:17px;}
							    
			    	
</style>
<body>
<%-- 		<c:if test="${member.userid != null}">
								<!-- <p>로그인 후에 작성하실 수 있습니다.</p> -->
								<script>
									location.href="${pageContext.request.contextPath}/member/myinfo.do";
	
								</script>
		</c:if>
 --%>
<div id="login">
	<form name='homeForm' method="post" action="loginOk.do">
		<c:if test="${member == null}">
			<div class="logo">
	        <p class="gongbooz">GongBooZ</p> 
			</div>
			
			<div>
				<label for="userId"></label>
				<input type="text" id="userId" name="userid" class="box">
			</div>
			<div>
				<label for="userPass"></label>
				<input type="password" id="userPass" name="userpass" class="box">
			</div>
			<div>
				<button type="submit" class="btn">로그인</button>
			</div>
			<c:if test="${msg == false}">
			<p style="color: white;"> 아이디와 비밀번호 확인해주세요.</p>
		</c:if> 
		
		<hr>

		<div class="join">
			<a href="findPw.do">아이디 / 비밀번호 찾기</a>  
		</div>
		<div class="join">
			<a href="join.do">회원가입</a>  
		</div>
		</c:if>
 	 	<c:if test="${member != null }">
			<div>
				<p>${member.userid}님 환영 합니다.</p>
			</div>
		</c:if> 
	</form>
</div>
</body>
</html>
