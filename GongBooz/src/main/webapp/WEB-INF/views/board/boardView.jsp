<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>게시글 보기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	
	<style>
	
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;}

			*{	font-family: 'Pretendard-Regular', '나눔고딕';
				margin:0;
				padding:0;
			}
			
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
				 background-color:#F7F7F7;
				 margin-top:50px;
				margin-left:50px;
				/* margin:300px auto; */
				/* color:black; */
				border:1px solid #ffffff;
				/* margin-left:30px; */
		
			      border-radius:4px;
				 margin: 0 auto; 
				  box-shadow:  2px 5px 16px -5px, 5px 5px 15px -5px rgba(0,0,0,0);
				
			}  
			
			header{
			  margin-bottom:10px;
			}
			
			ul, li{
				list-style:none;
			}
			
			.board_view{
				width:700px;
				border-top:2px solid #000;
			}
			
			.board_view .title{
			   padding: 7px 15px;
			   border-bottom: 1px dashed #ddd;
			   font-size:15px;
			   font-weight:bold;
			}
			
			.board_view .info{
				padding: 7px 15px;
				border-bottom: 1px solid #999;
				font-size:0;/*????  */
			}
			
			.board_view .info dl{
				position:relative;
				display: inline-block;
				padding: 0 20px;
			}
			
			.board_view .info dl:first-child{
				padding-left:0;
			}
			
			.board_view .info dl::before{
				content:"";
				position:absolute;
				top:4px;
				left:0;
				display:block;
				width:1px;
				height:10px;
				background:#ddd;
			}
			
			.board_view .info dl:first-child::before{
				display:none;
			}
			
			.board_view .info dl dt,
			.board_view .info dl dd{
				display:inline-block;
				font-size:12px;
			}
			.board_view .info dl dt{
				
			}
			.board_view .info dl dd{
				margin-left:10px;
				color:#777;
			}
			
			.board_view .cont{
				padding:15px;
				 border-bottom: 2px solid #000;
				line-height: 160%;
				font-size:14px;
			}
			
			.modify_btn{
				background-color:#3c3a3a;
				 color:white;
				  /*테두리없음*/
			     border: none;
			     width:40px;
			     height:24px;
			     border-radius:2px;
			}
			.delete_btn{
				background-color:#3c3a3a;
				 color:white;
				  /*테두리없음*/
			     border: none;
			     width:40px;
			     height:24px;
			     border-radius:2px;
			}
			.list_btn{
				background-color:#3c3a3a;
				 color:white;
				  /*테두리없음*/
			     border: none;
			     width:40px;
			     height:24px;
			     border-radius:2px;
			}
			
			.btns{
				margin-top:7px;
				text-align:right;
				margin-bottom:17px;
				
			}
			
			
			.replyWrite{
				border-top:1px solid #ddd; 
				border-bottom:1px solid #ddd; 
				margin-top:3px;
				margin-bottom:3px;
				border-left:1px solid #ddd;
				border-right:1px solid #ddd; 
				border-radius:2px;
			}
			
			.replyWrite .reply_writer{
				padding:4px 15px;
				/* border-bottom:1px solid #999; */
				border-bottom: 1px dashed #ddd;
			}
			
			.replyWrite .reply_writer dt,
			.replyWrite .reply_writer dd{
				 display: inline-block;
				 vertical-align:middle;
				 font-size:12px;
			}
			.replyWrite .reply_writer dt{
				width:100px;
			}
			
			.replyWrite .reply_writer input[type="text"]{
				width:300px;
				padding:4px;
				box-sizing:border-box;
				font-size:10px;
				border:none;
				
				background-color:#F7F7F7;
			}
			
			.replyWrite .reply_content{
				/*  border-bottom:1px solid #000;  */
				
			}
			
	
			.replyWrite .reply_content textarea{
				display:block;
				width:100%;
				height:66px;
				padding:14px;
				box-sizing:border-box;
				border:0;
				resizing:vertical;
				font-size:12px;
				background-color:#F7F7F7;
				
				
			}
			.replyWriteBtn{
				background-color:#3c3a3a;
				 color:white;
				  /*테두리없음*/
			     border: none;
			     width:70px;
			     height:24px;
			     border-radius:2px;
			}
			
			.replyWbtn{
				 text-align:right;
				 margin-top:7px;
				 margin-bottom:17px;
			}
			
			.replyWbtn1{
				margin-left:170px;
			}
			
			.replyViewWrap{
				 margin-top:4px;

				  border-top:1px solid #ddd; 
				 border-radius:2px;
			}
			
			.replyView{
				/* border-bottom:1px solid #999; */
				 border-bottom:1px solid #ddd;
			}
			
			.replyView .info{
				padding-top:10px;
				padding-bottom:7px;
				padding-left:7px;
				
				/* padding:7px; */
				/* border-bottom: 1px dashed #ddd; */
				font-size:0;
			}
			
			.replyView .info dl{
				 padding-left:0;
				position:relative;
				display:inline-block;
				vertical-align:middle; 
				padding: 0 30px;
			}
			
			.replyView .info dl:first-child{
				padding-left:0;
			}

			.replyView .info dl:first-child::before{
				display:none;
			}
			
			.replyView .info dt,
			.replyView .info dd{
				display:inline-block;
				font-size:12px;
				
			}
			
			.replyView .info dl dd{
				margin-left:30px;
				color:#777;
			}
			
			.replyView .replyViewContent{
				padding-left:37px;
				padding-bottom:20px;
				padding-top:7px;
				/* padding:20px; */
				line-height:60%;
				font-size:12px;
				color:#777;
				font-weight:bold;
			}
			
			 .replyUpdateBtn{
				  background-color:#eee;  
				  /*테두리없음*/
			       border: none;   
			     width:30px;
			     height:20px;
			      border-radius:2px; 
			     font-size:10px;
			    
			     
			     
			}
			
			.replyDeleteBtn{
				
			  	background-color:#eee;   
				  /*테두리없음*/
			       border: none; 
			     width:30px;
			     height:20px;
			     border-radius:2px; 
			     font-size:10px;
			     
			     
			}
			
			
			
			
			.btn_btn-light{
				
				background-color:#ddd;  margin-left:7px;width:40px; border-radius:20px;
				
			/* 	float:left;
				box-shadow:3px 3px 3px black;
				transition-duration:0.3; */
				
				
			}
			
			.btn_btn-light:active{
				margin-left:5px;
				margin-top:5px;
				box-shadow:none;
			}
			
			
			
			.btn_btn-light:hover{
				background-color:white;


			}
			
			.btn_btn-danger{
			
			background-color:#E4F7BA;  margin-left:7px; width:70px; border-radius:20px;
			}
			.btn_btn-danger:active{
				margin-left:5px;
				margin-top:5px;
				box-shadow:none;
			}
			
			.btn_btn-danger:hover{
				background-color:white;
			}
			
	</style>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 			<c:if test="${member.userid == null}">
								<!-- <p>로그인 후에 작성하실 수 있습니다.</p> -->
								<script>
									location.href="${pageContext.request.contextPath}/member/login.do";
	
								</script>
			</c:if>


	
	 			<c:if test="${member == null}"><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></c:if> 
			<c:if test="${member != null}">
			<a href="${pageContext.request.contextPath}/member/logout.do" style="color:white;">로그아웃</a>
			<a href="${pageContext.request.contextPath}/member/myinfo.do" style="color:white;">마이페이지</a>
			<p style="color:white;">${member.userid}님 안녕하세요.</p>
			<span style="color:white;">${member.userid}님 안녕하세요.</span>	
			</c:if> --%>
	
	<div class="board_wrap">
			
			<header>
				<h3>Q&A</h3>
				<h5>자유로운 의견 교환장소 입니다.</h5>
			</header>
			
			<div id="board_write">
				<form name="readForm" role="form" method="post">
				  <input type="hidden" id="bno" name="bno" value="${boardView.bno}" />
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				  <input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
				</form>
		
				<div class="board_view_wrap">
					<div class="board_view">
						<div class="title">
							${boardView.title}
						</div>
						
						<div class="info">
							<dl>
								<dt>번호</dt>
								<dd>${boardView.bno}</dd>
							</dl>
							<dl>
								<dt>글쓴이</dt>
								<dd>${boardView.writer}</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd><fmt:formatDate value="${boardView.regdate}" pattern="yyyy-MM-dd" /></dd>
							</dl>
							<dl>
								<dt>조회수</dt>
								<dd>${boardView.hit}</dd>
							</dl>
					
							
						</div>
						<div class="form-group" style="font-size:13px;border-bottom: 1px solid #999; padding: 4px 15px;">
							첨부파일
						<c:forEach var="file" items="${file}">
							 <a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
						</c:forEach>
						</div>
						<div class="cont">
								${boardView.content}
						</div>
					
							
					</div>			
				
					<div class="btns">
						<c:if test="${member.userid == boardView.writer}">
							<!--  <button type="submit" class="modify_btn">수정</button> -->
							<button type="submit" class="delete_btn">삭제</button>
							
						</c:if>
						<button type="submit" class="list_btn">목록</button>	
					</div>
				
				</div>
				<!--board_view_wrap  -->
				
				
				<form name="replyForm" method="post">
				  <input type="hidden" id="bno" name="bno" value="${boardView.bno}" />
				   <input type="hidden" id="userid" name="userid" value="${member.userid}" />  
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				
					<p style="font-size:14px;font-weight:bold;">댓글&nbsp;<span style="color:red;">${boardView.recnt}</span></p>
					
					<div class="replyWrite">
					   	<div class="reply_writer">
					   			<dl>
					   				<dt style="font-weight:bold;color:#777;">글쓴이</dt>
					   				<dd>
					   				<input type="hidden" id="writer" name="writer" placeholder="글쓴이를 입력해 주세요" value="${member.userid}" />
					   				${member.userid}
					   				</dd>
					   			</dl>
					   			
					   	</div>

					    <div class="reply_content">
					    	<textarea id="content" name="content" placeholder="여러분의 소중한 댓글을 남겨주세요" title="내용을 입력하세요."></textarea>
					    
					    </div>
				  </div>
				 
				 <div class="replyWbtn">
				 	 <button type="button" class="replyWriteBtn">댓글등록</button>
				  </div> 
					
					
					
					<p style="font-size:14px; font-weight:bold;margin-top:17px;"><span style="color:red;">${boardView.recnt}</span> Comment(s)</p>
					<!-- 댓글 -->
					<div class="replyViewWrap">
					 
					    <c:forEach items="${replyList}" var="replyList">
					      <div class="replyView">
					     					 
		       				<div class="info">
		       				 	<dl>
		       				 		 <!-- <dt>작성자</dt>  -->
		       				 		 <dt></dt>
		       				 		<dd style="color:black;font-weight:bold;font-size:13px;">${replyList.writer}</dd>
		       				 		
		       				 	</dl> 
		       				 	<dl>
		       				 		<!-- <dt>작성일</dt> -->
		       				 		<dt></dt>
		       				 		<dd><fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></dd>
		       				 	</dl> 				         
		       
		       				 		<dt></dt>
		       				 		<dd>	
			       				 		<div class="replyView_btn">
										  <c:if test="${member.userid == replyList.writer}">
										  <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}" >수정</button>
										  <button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}" >삭제</button>
											</c:if>
										</div>
									</dd>
		       				 	</dl> 				         
		       				 					         
		       					
		       				</div>
					        <div class="replyViewContent">					   
							
							   ${replyList.content}
						       
							</div>
							
							   
					     </div>
					    </c:forEach>   
					  
					</div>
					

				</form>
			</div>
			
		</div>
</body>
</html>

<script type="text/javascript">
		
		


/*-----------------------------  */
		
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".modify_btn").on("click", function(){
				formObj.attr("action", "modifyView.do");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니가?");
				if(deleteYN == true){
				
				formObj.attr("action", "boardDelete.do");
				formObj.attr("method", "post");
				formObj.submit();
				
				}
			})
			
			// 목록
			$(".list_btn").on("click", function(){
		
			location.href = "boardList.do?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			//댓글
			$(".replyWriteBtn").on("click", function(){
				  var formObj = $("form[name='replyForm']");
				  formObj.attr("action", "replyWrite.do");
				  formObj.submit();
			});
			
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "replyUpdateView.do?bno=${boardView.bno}"								
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
					
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "replyDeleteView.do?bno=${boardView.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});		
		})
		
		function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "fileDown.do");
			formObj.submit();
		}
		
		
	</script>