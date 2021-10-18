<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Sacramento&display=swap');
    @font-face {
    font-family: 'ChosunSg';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunSg.woff') format('woff');
    font-weight: normal;
    font-style: normal;}
 	
@font-face {
    font-family: 'title';
    src: url("${pageContext.request.contextPath}/resources/MindFont.otf") format('opentype');
}
 	
 	*{font-family: 'ChosunSg';}


#findWrap{
	width:800px;
	 margin: 170px auto;
}

.findpw{
	width:300px;
	/* background-color:white; */
	background: transparent;
	padding:30px;
	box-shadow:  2px 5px 16px 0px, 5px 5px 15px 5px rgba(0,0,0,0);
	/*  border:none; */
	 border-bottom: 1px solid #ddd;
	  overflow: hidden;
	 border-radius:4px;
	 float:left;
	  border:1px solid #ddd;
	  
} 
.findid{
	width:300px;
	/* background-color:white; */
	background: transparent;
	padding:30px;
	box-shadow:  2px 5px 16px 0px, 5px 5px 15px 5px rgba(0,0,0,0);
	/*  border:none; */
	 border-bottom: 1px solid #ddd;
	  overflow: hidden;
	 border-radius:4px;
	 float:right;
	  border:1px solid #ddd;
	 
	  
} 

	.input{
		 border:none;
		 border-bottom: 1px solid #ddd; 
		 width:290px;
		 height:30px;
		    border: none;  background: transparent;
	
						color:white;
						font-size:14px;
			            border-bottom: 1px solid #ffffff; 
	}
	
	.btn{
		width:290px;
		height:30px;
		background-color:#FFFFFF;
		border:none;
		border-radius:4px;
		font-weight:bold;
		 color:#4C4C4C;
	}
	
	.btn1{
		width:290px;
		height:30px;
		margin-top:17px;
		background-color:#FFFFFF;
		border:none;
		border-radius:4px;
		font-weight:bold;
		 color:#4C4C4C;
	}
	
	.btn:hover{
		background-color:#E1E1E1;
	}
	.btn1:hover{
		background-color:#E1E1E1;
	}
		
	.welcome{
		text-align:center;
		color:#ffffff;
	}
	label{
		color:#ffffff;
	
	}
	
	.logo{
		 color:#ffffff;
		 text-align:center;
		  margin-bottom:70px;
	}
	
	.gongbooz {
            color:#ffffff;
            margin-bottom:70px;
            margin-top:40px;
            font-family: 'title', cursive;
            font-size:40px;
        }
</style>
<title>아이디/비밀번호 찾기</title>
</head>
<body>


<div id="findWrap">
		<div class="findpw" >
			
			<div class="logo">
	        <p class="gongbooz">GongBooZ</p> 
			</div>
			
			<div class="w3-center w3-large w3-margin-top">
				<p class="welcome">비밀번호 찾기</p>
			</div>
			<div>
				<p>
					<label>ID</label><br>
					<input class="input" type="text" id="id" name="userid" required>
				</p>
				<p>
					<label>Email</label><br>
					<input class="input" type="text" id="email" name="membermail" required>
				</p>
				<p class="w3-center">
					<button type="button" id=findpwBtn class="btn">find</button><br>
					<button type="button" onclick="history.go(-1);" class="btn1">Cancel</button>
				</p>
			</div>
		</div>
		<div class="findid" >
			<div class="logo">
	        <p class="gongbooz">GongBooZ</p> 
			</div>
			<form action="find_id.do" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<p class="welcome">아이디 찾기</p>
				</div>
				<div>
					
					<p>
						<label>Email</label><br>
						<input class="input" type="text" id="email" name="membermail" required>
					</p>
					<p class="w3-center">
						<button type="submit" id=findidBtn class="btn">find</button><br>
						<button type="button" onclick="history.go(-1);" class="btn1">Cancel</button>
					</p>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
	$(function(){
		$("#findpwBtn").click(function(){
			$.ajax({
				/* url : "../member/find_pw.do", */
				url : "find_pw.do",
				type : "POST",
				data : {
					userid : $("#id").val(),
					membermail : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
</html>
