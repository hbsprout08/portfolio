<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "boardView.do?bno=${replyUpdate.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
</script>
<style>

  	 @font-face {
    font-family: 'ChosunSg';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunSg.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

			*{	font-family: 'ChosunSg';
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
				/* margin-top:100px; */
				/* margin-left:50px;	 */
				border:1px solid #ffffff;
				/* margin-left:30px; */
		
				 box-shadow:  2px 5px 16px -5px, 5px 5px 15px -5px rgba(0,0,0,0);
			      border-radius:4px;
				 margin: 50px auto;
			}
	
	.replyWrite{
				border-top:2px solid #000;
				margin-top:3px;
				margin-bottom:3px;
			}
			
			.replyWrite .reply_writer{
				padding:4px 15px;
				border-bottom:1px solid #000;
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
			

			
			.replyWrite .reply_content{
				 border-bottom:1px solid #000;
				 
			}
			
			
			
			
			.replyWrite .reply_content textarea{
				display:block;
				width:100%;
				height:70px;
				padding:15px;
				box-sizing:border-box;
				border:0;
				resizing:vertical;
				font-size:12px;
				background-color:#F7F7F7; 
				
			}
			
			.update_btn{
				background-color:#3c3a3a;
				 color:white;
				  /*테두리없음*/
			     border: none;
			     width:35px;
			     height:24px;
			      border-radius:2px; 
			}
			
			.cancel_btn{
				background-color:#3c3a3a;
				 color:white;
				  /*테두리없음*/
			     border: none;
			     width:35px;
			     height:24px;
			      border-radius:2px; 
			}
			
		
			
		.bt_wrap a{
			min-width:40px; 
			 padding:4px;  
		 	border:1px solid #3c3a3a;
			font-size:14px;
			background: #3c3a3a;
			color:white;
			 border-radius:2px; 
		}
			
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 			<c:if test="${member == null}"><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></c:if> 
			<c:if test="${member != null}">
			<a href="${pageContext.request.contextPath}/member/logout.do" style="color:white;">로그아웃</a>
			<a href="${pageContext.request.contextPath}/member/myinfo.do" style="color:white;">마이페이지</a>
			<p style="color:white;">${member.userid}님 안녕하세요.</p>
			<span style="color:white;">${member.userid}님 안녕하세요.</span>	
			</c:if>
	 --%>
		
		
		<div class="board_wrap">
			<header>
				<h3>Q&A</h3>
				<h5>댓글수정 창입니다.</h5>
			</header>
		
			<section id="container">
				<form name="updateForm" role="form" method="post" action="replyUpdate.do">
					<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
					 <input type="hidden" id="userid" name="userid" value="${member.userid}" />  
					<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					
				<div class="replyWrite">
				   	<div class="reply_writer">
				   			<dl>
				   				<dt style="font-weight:bold;color:#777;">글쓴이</dt>
				   				<dd>${replyUpdate.writer}</dd>
				   			</dl>
				   	</div>
				    <div class="reply_content">
				    	<textarea id="content" name="content"  title="내용을 입력하세요.">${replyUpdate.content}</textarea>
				    
				    </div>
				 </div>
	
					<div class="bt_wrap">
						<button type="submit" class="update_btn">저장</button>
						<button type="button" class="cancel_btn">취소</button>
						<a class="btn1" href="boardList.do" class="on">목록</a>
					</div>
				</form>
			</section>
		</div>
</body>
</html>