<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원탈퇴</title>
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

      
       * {		font-family: 'ChosunSg';
			     margin: 0;
			     padding: 0;
		 }
		
		 a{
      	color:#ffffff;
      
      	text-decoration:none;
      } 
		
		 h1{
			color:#ffffff;
			margin-bottom:40px;
			 font-family: 'Ephesis', cursive;
			 font-size:40px;
		}
		
	 	.joinWrap{
			 margin: 100px auto;
			            /*가로너비*/
			 width: 730px; 
             /*높이만큼 늘어남*/
            overflow: hidden;
          
             /*  border:1px solid #ddd;    */
            padding-top: 50px;
            padding-bottom: 100px; 
            
            /*글자의 정렬*/
             text-align: center;/*box안에 인라인 요소들 가운데 정렬?  */ 
             
            
           
		} 
		
		.join{
			 margin: 0 auto;
			 width:700px;
			  border:1px solid #ddd; 
			  padding-top:30px;
            padding-bottom:70px;
             overflow: hidden;
			  border-radius:4px;
             box-shadow:  2px 5px 16px 0px, 5px 5px 15px 5px rgba(0,0,0,0);
		}
		
		.bye{
			font-size:21px;
			color:#ffffff;
			margin-top:30px;
			margin-bottom:17px;
		
		}
		
		.btn{
			  /*가로너비*/
			            width: 170px;
			            /*세로높이*/
			            height: 30px;
			            /*글자크기*/
			            font-size: 14px;
			            /*글자색상*/
			            color:black;;
			            /*배경색상*/
			            background-color:#FFFFFF;
			            /*테두리없음*/
			            border: none;
			            border-radius:4px;
			            margin-top:30px;
			            font-weight:bold;
			            
		
		}
		
		.btn:hover{
	background-color:#E1E1E1;
}
		
		.form-control{
			 /*가로너비*/
			            width: 200px;
			            /*세로높이*/
			            height: 30px;
			            /*안쪽여백*/
			            padding-left: 20px;
			            padding-right: 20px;
			            /*바깥쪽 여백*/
			           /*  margin-bottom: 20px; */
			             margin-top: 20px; 
			            /*테두리 스타일*/
			            border: none; background: transparent;
	
						color:white;
						font-size:12px;
			            border-bottom: 1px solid #ffffff; 
		
		}
		
		.control-label{
			color:white;
			font-size:14px;
		
		}
		.form-control::placeholder{
			color:#ddd;
		
		}
		
		.gongbooz {
            color:#ffffff;
            margin-bottom:40px;
            /* margin-top:70px; */
            /* font-family: 'Ephesis', cursive; */
            font-family: 'title', cursive;
            font-size:57px;
            text-align:center;
        } 
		
      
</style>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$("#cancel").on("click", function(){
				
				location.href = "kajainfo.do";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}	
			
				$.ajax({
					/* url : "/member/passChk", */
					url : "passChk.do",
					type : "POST",
					dataType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						
						 if(data==0){
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							if(confirm("회원탈퇴하시겠습니까?")){
								$("#delForm").submit();
							}
							
						} 
						/* if(data==true){
							if(confirm("회원탈퇴하시겠습니까?")){
								$("#delForm").submit();
							}
						}else{
							alert("패스워드가 틀렸습니다.");
							return;
							
						} */
					}
				})
			
			
			
			
			});
			
				
			
		})
	</script>

<body>
<%-- 	<c:if test="${member.userid == null}">
								<!-- <p>로그인 후에 작성하실 수 있습니다.</p> -->
								<script>
									location.href="${pageContext.request.contextPath}/member/login.do";
	
								</script>
			</c:if> 

	
	 <c:if test="${member == null}"><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></c:if> 
	<c:if test="${member != null}">
			<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
			<a href="${pageContext.request.contextPath}/member/myinfo.do">마이페이지</a>
			<p style="color:white;">${member.userid}님 안녕하세요.</p>
			<span style="color:white;">${member.userid}님 안녕하세요.</span>
			
	</c:if>	 --%>
	<div class="joinWrap"> 
	<p class="gongbooz">GongBooZ</p> 
			
		<div class="join">
			
			<p class="bye">회원탈퇴/비밀번호를 입력하세요<p>
		<!-- <section id="container"> -->
			<form action="memberDelete.do" method="post" id="delForm">
				
				
				 <div class="form-group has-feedback">
					<label class="control-label" for="userId">ID</label>
					<input class="form-control" type="text" id="userId" name="userid" value="${member.userid}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">Password</label>
					<input class="form-control" type="password" id="userPass" name="userpass" placeholder="비밀번호를 입력하세요" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">Name</label>
					<input class="form-control" type="text" id="userName" name="username" value="${member.username}" readonly="readonly"/>
				</div> 
				
			
			</form>
			<div class="form-group has-feedback">
				<!-- <button class="btn btn-success" type="button" id="submit">회원탈퇴</button> -->
				<button class="btn" type="button" id="submit">회원탈퇴</button>
				<!-- <button class="cencle btn btn-danger" type="button">취소</button> -->
				<button class="btn" type="button" id="cancel">취소</button>
			</div>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		<!-- </section> -->
	</div>
	 </div> 
</body>
</html>