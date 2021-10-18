<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

	
	<style>
	 
	 @import url('https://fonts.googleapis.com/css2?family=Sacramento&display=swap');
	 
	@font-face {
    font-family: 'ChosunSg';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunSg.woff') format('woff');
    font-weight: normal;
    font-style: normal;}
    
    @font-face {
    font-family: 'title';
    src: url("${pageContext.request.contextPath}/resources/MindFont.otf") format('opentype');}
	 
	 * {
			     margin: 0;		font-family: 'ChosunSg';
			     padding: 0;
		 }


		.gongbooz {
			           
			            color:#ffffff;
			            margin-bottom:70px;
			            margin-top:70px;
			            /* font-family: 'Ephesis', cursive; */
			            font-family: 'title', cursive;
			            font-size:57px;
			            text-align:center;
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
              text-align: center;
            
           
		} 
		
		.join{
			 margin: 0 auto;
			 width:700px;
			 box-shadow:  2px 5px 16px 0px, 5px 5px 15px 5px rgba(0,0,0,0);
	 		 border:1px solid #ddd; 
			  padding-top:30px;
            padding-bottom:70px;
             overflow: hidden;
              border-radius:4px;
              background: transparent;
			 
		}
		
		
		.welcome{
			margin-top:30px;
			margin-bottom:70px;
			color:#ffffff;
			font-size:24px;
		}
	
		
		 .btn {
			            /*가로너비*/
			            width: 520px;
			            /*세로높이*/
			            height: 30px;
			            /*글자크기*/
			            font-size: 14px;
			            /*글자색상*/
			            /*배경색상*/
			          /*   background-color: cornflowerblue; */
			            /*테두리없음*/
			            border: none;
			            border-radius:4px;
			             margin-top:20px; 
			            background-color:#FFFFFF;
		color:#4C4C4C;
		border:none;
		font-weight:bold;
			            
			} 
			
			   .btn:hover{
			        	background-color:#E1E1E1;
			        }
			        
			.form-control{
				 /*가로너비*/
			            width: 470px;
			            /*세로높이*/
			            height: 40px;
			            /*안쪽여백*/
			             padding-left: 20px;
			            padding-right: 20px; 
			            /*바깥쪽 여백*/
			           /*  margin-bottom: 20px; */
			           
			            /*테두리 스타일*/
			            border: none; background: transparent;
	
						color:white;
						font-size:14px;
			            border-bottom: 1px solid #ddd; 
			      
			
			}
			.form-control1{
				 /*가로너비*/
			            width: 400px;
			            /*세로높이*/
			            height: 40px;
			            /*안쪽여백*/
			            padding-left: 20px;
			            padding-right: 20px;
			            /*바깥쪽 여백*/
			          /*   margin-bottom: 20px; */
			           
			            /*테두리 스타일*/
			            border: none; background: transparent;
	
						color:white;
						font-size:14px;
			            border-bottom: 1px solid #ddd; 
			
			}
			
			  .form-control::placeholder{
			        	color:#ddd;
			        	font-weight:bold;
			        }
			  .form-control1::placeholder{
			        	color:#ddd;
			        	font-weight:bold;
			        } 
			 .idChk{
			 	  /*가로너비*/
			            width: 70px;
			            /*세로높이*/
			            height: 30px;
			            /*글자크기*/
			            font-size: 12px;
			            /*글자색상*/
			            color:#4C4C4C;
			            /*배경색상*/
			            background-color:#FFFFFF;
			            /*테두리없음*/
			            border: none;
			            border-radius:4px;
			            font-weight:bold;
			 }
			 
			   .idChk:hover{
			        	background-color:#E1E1E1;
			        }       
			       
.mail_wrap{
     margin-left:90px;
}

.mail_input{
	 width: 500px;
			            /*세로높이*/
			            height: 40px;
			            /*테두리 스타일*/
			            border: none; background: transparent;
	
						color:white;
						font-size:14px;
			            border-bottom: 1px solid #ddd; 
			            margin-right:170px;
			            padding-left: 20px;

}

.mail_input::placeholder{
	color:#ddd;
}
.mail_check_wrap{
	/* margin-top: 20px;	 */
	/* margin-left:10px; */
	border:1px solid #ddd;
	width:300px;
	 padding-top:20px; 
	 border-radius:4px;
	/*  margin-bottom:20px; */
	 padding-right:20px;
	 font-size:14px;
	 margin-bottom:40px;

}
.mail_check_input_box{

      					/*가로너비*/
			            width: 240px;
			            /*세로높이*/
			            height: 30px;
			           /*  /*안쪽여백*/
			            /*바깥쪽 여백*/
			          /*   margin-bottom: 20px; */
			              margin-top: 20px;  
			            /*테두리 스타일*/
			            border: none; background: transparent;
	
						color:white;
						font-size:14px;
			            border-bottom: 1px solid #ddd; 
			            margin-left:30px;
   
}
#mail_check_input_box_false{
	background-color:#808080;
	 opacity : 0.3;
}
 #mail_check_input_box_true{
	border: none; background: transparent;
} 
.mail_check_input{
	   width: 240px;
			            /*세로높이*/
			            height: 30px;
			           /*  /*안쪽여백*/
			            padding-left: 20px;
			            /*바깥쪽 여백*/ */
			          /*   margin-bottom: 20px; */
			               margin-top: 30px;  
			            /*테두리 스타일*/
			            border: none; background: transparent;
						color:white;
						font-size:12px;
			            border-bottom: 1px solid #ffffff; 
					
			            
}
.mail_check_button{

			            width: 170px;
			            /*세로높이*/
			            height: 20px;
			            /*글자크기*/
			            font-size: 12px;
			            /*글자색상*/
			            color:#4C4C4C;
			            /*배경색상*/
			            background-color:#ffffff;
			            /*테두리없음*/
			            border: none;
			            border-radius:4px;
			            /*  margin-top:10px;  */
			             padding-top:4px; 
			             margin-left:30px;
			             font-weight:bold;
}

.mail_check_button:hover{
	background-color:#E1E1E1;
}
/* .correct{
	color : #ddd;
	font-size:12px;
}
.incorrect{
	color : #ddd;
	font-size:12px;
} */

/* float 속성 해제 */
.clearfix{
	clear: both;
}

	
	
	 label{
		color:#ffffff;
	} 
	
	
				 
	</style>

</head>
<body>
	
<%-- 		 <c:if test="${member.userid != null}">
								<script>
									location.href="${pageContext.request.contextPath}/member/logout.do";
	
								</script>
		</c:if>  --%>
		 
		 
		 
		 <div class="joinWrap"> 
			
		<div class="join">
			<p class="gongbooz">GongBooZ</p> 
			<p class="welcome">가입을 시작합니다!</p>
		
		
		<!-- <section id="container"> -->
			<form action="register.do" method="post" id="regForm">
				
		<div class="mail_wrap" >
			<!-- 	<div class="mail_name">이메일</div>  -->
				<div class="mail_input_box">
					<label class="control-label"style="margin-right:570px;" >Email</label><br>
					<input class="mail_input" name="membermail" placeholder="이메일을 입력해 주세요" id="mail" autofocus required/>
				<span class="mail_input_box_warn" style="color:white;font-size:14px;margin-right:100px;"></span><br>
				<span id="email_check" style="color:#ddd;font-size:14px;margin-right:100px;"></span>
				</div>
				<div class="mail_check_wrap">
					<div class="mail_check_button" >
					
						<span style="text-align:center;">이메일 인증번호 전송</span>
					</div>
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled" style="	" placeholder="이메일 인증번호를 입력" id="confirm" required/>
						
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn" style="margin-right:7px; color:white"></span>
				</div>
			</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="userId" style="margin-right:500px;">ID</label><br>
					<input class="form-control1" type="text" id="userId" name="userid"  placeholder="아이디를 입력해주세요" />
					<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N" >중복확인</button>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass" style="margin-right:450px; ">Password</label><br>
					<input class="form-control" type="password" id="userPass" name="userpass" placeholder="비밀번호는 8자 이상으로 설정해야 합니다." onchange="check_pw()"/>
					<br><span style="font-size:14px;" id="check1"></span> 
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass" style="margin-right:390px;">Password Confirm</label><br>
					<input class="form-control" type="password" id="userPass2" name="userpass2" placeholder="비밀번호는 8자 이상으로 설정해야 합니다." onchange="check_pw()"/>
					<br><span style="font-size:14px;" id="check"></span> 
				</div> 
				<div class="form-group has-feedback">
					<label class="control-label" for="userName" style="margin-right:470px;">Name</label><br>
					<input class="form-control" type="text" id="userName" name="username" placeholder="이름을 입력해주세요" />
				</div>
				
			</form>
				<div class="form-group has-feedback" id="btns">
					<button class="btn btn-success" type="button" id="submit" class="btn">회원가입</button><br>
					<button class="cencle btn btn-danger" type="button" class="btn">취소</button>
				</div>
		<!-- </section> -->
		</div>
	 </div> 
	</body>
</body>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "login.do";
			})
		
			$("#submit").on("click", function(){
				
				if($("#mail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#mail").focus();
					return false;
				}
				
				
				if($("#confirm").val()==""){
					alert("이메일 인증번호를 입력해주세요.");
					$("#confirm").focus();
					return false;
				}
				
				
				
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				
				
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
					return false;
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
				
			
				
			});
			
			
			/*이메일중복체크  */
			$("#mail").keyup(function(){
				$.ajax({
					url : "check_email.do",
					type : "POST",
					data : {
						membermail : $("#mail").val()
					},
					success : function(result) {
						if (result == 1) {
							$("#email_check").html("중복된 이메일이 있습니다.");
						} else {
							$("#email_check").html("");
						}
					},
				})
			});
		
		})
			
			function fn_idChk(){
				$.ajax({
					url : "idChk.do",
					type : "post",
					dataType : "json",
					data : {"userid" : $("#userId").val()},
					success : function(data){
						if(data == 1){
							alert("중복된 아이디입니다.");
				
						}else if(data == 0){
							$("#idChk").attr("value", "Y");
							alert("사용가능한 아이디입니다.");
						}
					}
				})
			}
		
		function check_pw(){   
			var pw = document.getElementById('userPass').value;
			
			 if(!/^[a-zA-Z0-9]{8,20}$/.test(pw)){
				 document.getElementById('check1').innerHTML='비밀번호는 8자 이상으로 설정해야 합니다.';
	             document.getElementById('check1').style.color='#ddd';
			 }else{
				 document.getElementById('check1').innerHTML='사용가능 '
		         document.getElementById('check1').style.color='white';
			 }
			
			 if(document.getElementById('userPass').value !='' && document.getElementById('userPass2').value!=''){
	           if(document.getElementById('userPass').value==document.getElementById('userPass2').value){
	               document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
	               document.getElementById('check').style.color='white';
	           }
	           else{
	               document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
	               document.getElementById('check').style.color='#ddd';
	           }
	       } 
		}
		
					
		/* 인증번호 이메일 전송 */
		$(".mail_check_button").click(function(){
			
			var email = $(".mail_input").val();			// 입력한 이메일
			var cehckBox = $(".mail_check_input");		// 인증번호 입력란
			var boxWrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
			var warnMsg = $(".mail_input_box_warn");	// 이메일 입력 경고글
			
			/* 이메일 형식 유효성 검사 */
			if(mailFormCheck(email)){
				warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
				warnMsg.css("display", "inline-block");
			} else {
				warnMsg.html("올바르지 못한 이메일 형식입니다.");
				warnMsg.css("display", "inline-block");
				return false;
			}	
			
				//url:"${pageContext.request.contextPath}/member/mailCheck?email=" + email,
			$.ajax({
				
				type:"GET",
				url:"mailCheck?email=" + email,
				success:function(data){
					
					//console.log("data : " + data);
					cehckBox.attr("disabled",false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;
					
				}
						
			});
			
		});
		
		/* 인증번호 비교 */
		$(".mail_check_input").blur(function(){
			
			var inputCode = $(".mail_check_input").val();		// 입력코드	
			var checkResult = $("#mail_check_input_box_warn");	// 비교 결과 	
			
			if(inputCode == code){							// 일치할 경우
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("class", "correct");		
				mailnumCheck = true;
			} else {											// 일치하지 않을 경우
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
				mailnumCheck = false;
			}	
			
		});
		
		 /* 입력 이메일 형식 유효성 검사 */
		 function mailFormCheck(email){
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return form.test(email);
		}


</script>
</html>