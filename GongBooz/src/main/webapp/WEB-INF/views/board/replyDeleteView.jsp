<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

  	 @font-face {
    font-family: 'ChosunSg';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunSg.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	*{			font-family: 'ChosunSg';
				margin:0;
				padding:0;
			}
			
			a{
				text-decoration : none;
				color: inherit;
			}

	#root{
		padding: 50px;
				width:700px;
				background-color:#F7F7F7;
				margin-top:50px;
				/* margin-left:50px; */
				font-size:14px;
				
				border:1px solid #ffffff;
				/* margin-left:30px; */
		
				 box-shadow:  2px 5px 16px -5px, 5px 5px 15px -5px rgba(0,0,0,0);
			      border-radius:4px;
				 margin: 50px auto;
	
	}
	
	button{
			background-color:#3c3a3a;
				 color:white;
				  /*테두리없음*/
			     border: none;
			     width:40px;
			     height:28px;
			      border-radius:2px; 
	}

</style>
<script type="text/javascript">
		
		$(document).ready(function(){
			
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "boardView.do?bno=${replyDelete.bno}"
						+ "&userid=${member.userid}"
						+ "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
	<c:if test="${member == null}"><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></c:if> 
			<c:if test="${member != null}">
			<a href="${pageContext.request.contextPath}/member/logout.do" style="color:white;">로그아웃</a>
			<a href="${pageContext.request.contextPath}/member/myinfo.do" style="color:white;">마이페이지</a>
			<p style="color:white;">${member.userid}님 안녕하세요.</p>
			<span style="color:white;">${member.userid}님 안녕하세요.</span>	
			</c:if> --%>
	
<div id="root">
			<%-- <header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr /> --%>
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="replyDelete.do">
					<input type="hidden" name="bno" value="${replyDelete.bno}" readonly="readonly"/>
					<input type="hidden" id="userid" name="userid" value="${member.userid}" /> 
					<input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
						
					<div>
						<p>삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn">삭제</button>
						<button type="button" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
			
</div>
</body>
</html>