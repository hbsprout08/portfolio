<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "boardWrite.do");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
		
		
		
	
	</script>
	<!--섬머노트  -->
  <script>
    $(document).ready(function() {
        $('#content').summernote({
        		  placeholder: '내용을 넣어주세요',
        	        tabsize: 2,
        	        height: 300	,
        	       
        	    	
        });
    });
  </script>
  
  <style>
  
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  
  
 		*{	font-family: 'Pretendard-Regular', '나눔고딕';
			margin:0;
			padding:0;
		}
		
		body{background-color: transparent;}
		
		a{
			text-decoration : none;
			color: inherit;
		}
				/* a 태그에  마우스 올렸을 때   */
		
		A:link {text-decoration:none; color:#000080}
		A:visited {text-decoration:none; color:#000080}
		A:active {text-decoration:none; color:#000080}
		A:hover {text-decoration:none; color:#529CFF} 

  		.board_wrap{
				padding: 50px;
				width:700px;
			
				margin-top:50px;
				margin-left:50px;
				background-color:#F7F7F7;  
				/* margin:300px auto; */
				/* color:black; */
				border:1px solid #ffffff;
				/* margin-left:30px; */
			 box-shadow:  2px 5px 16px -5px, 5px 5px 15px -5px rgba(0,0,0,0);
			      border-radius:4px;
				 margin: 0 auto;
		}
		
		.board_write{
			border-top: 2px solid #000;
		}
		
		.board_write .title,
		.board_write .fileup,
		.board_write .write{
			padding: 0 15px;
			padding-top:17px;
			
		}
		
		.board_write .write{
			border-top:1px dashed #ddd;
			border-bottom:1px dashed #ddd;
		}
		.board_write .fileup{
			
			border-bottom:1px solid #000;
		}
		
		.board_write .title dt,
		.board_write .title dd,
		.board_write .fileup dt,
		.board_write .fileup dd,
		.board_write .write dt,
		.board_write .write dd{
			display:inline-block;
			vertical-align: middle;
			font-size:14px;
		}
		
		.board_write .title dt,
		.board_write .fileup dt,
		.board_write .write dt{
			width:100px;
		}
		
		.board_write .title dl{
			font-size:0;
		}
		.board_write .title dd{
			width:calc(100%-100px);
		}
		
		.board_write .title input[type="text"],
		.board_write .write input[type="text"]
		{
			width:400px;
			font-size:12px;
			box-sizing:border-box;
			padding:4px;
			background-color:#F7F7F7;
			/* border:none ;*/
			border-radius:4px;
			
		}
		
		.bt_wrap{
			
			text-align:center;
		}
		
		.bt_wrap a{
			display:inline-block;
			min-width:40px;
			padding:4px;
			border:1px solid #000;
			border-radius:2px;
			font-size:14px;
			background: #3c3a3a;
			color:white;
		}
		
		button{
			background:#3c3a3a;
			color:white;
			padding:5px;
			border:none;
			border-radius:2px;
		}
		
		
		
		
	
  </style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="board_wrap">
			<header>
				<h3>Q&A</h3>
				<h5>자유로운 의견 교환장소 입니다.</h5>
			</header>
<%-- 			<c:if test="${member.userid == null}">
								<!-- <p>로그인 후에 작성하실 수 있습니다.</p> -->
								<script>
									location.href="${pageContext.request.contextPath}/member/login.do";
	
								</script>
			</c:if>
			 --%>
			
				<form name="writeForm" method="post" action="boardWrite.do" enctype="multipart/form-data">
					<%-- <c:if test="${member.userid != null}"> --%>
						<div class="board_write_wrap">
							<div class="board_write">
							
								 <div class="title">
										
										<dl>
											<dt>제목</dt>
											<dd><input  type="text" id="title" name="title" class="chk" title="제목을 입력하세요." placeholder="제목을 입력하세요."/></dd>
										</dl>
										
								 </div>
								 <div class="write">
										<dl>
											<dt>작성자</dt>
											<dd>
											${member.userid}
											<input type="hidden" id="writer" name="writer"class="chk" value="${member.userid}" />  
											
											</dd>
										</dl>
																
								 </div>
								 <div class="fileup">
										
										<dl>
											<dt>첨부파일</dt>
											<dd><input type="file" name="file" ></dd>
										</dl>						
								 </div>
						
								
								<div class="cont">
										<textarea id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
								</div>
								
							 <!-- 	<tr>
										<td id="fileIndex">
										</td>
								</tr>  -->
								<div class="bt_wrap">
										<a class="btn1" href="boardList.do" class="on">목록</a>
										<a class="btn2" href="boardInsert.do">취소</a>
										<button class="write_btn" type="submit">작성</button>
										<!--  <button class="fileAdd_btn" type="button">파일추가</button>  -->
								</div>							
									
											
							</div>			
						</div>
					<%-- </c:if> --%>
					
				
				
				</form>
		
				
								
				
			
		</div>
			
	
		
</body>
</html>