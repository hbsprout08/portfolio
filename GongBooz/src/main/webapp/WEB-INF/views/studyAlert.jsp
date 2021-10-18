<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="${path}/resources/css/studyroomMain.css" rel="stylesheet"/>
<meta charset="UTF-8">
<%@ page import="java.net.URLEncoder" %>
<title>스터디 입장</title>
</head>
<style>
	#insertModalLabel, #name{color: white;}
	#insertModalLabel{margin-left: 45%;}
	#name{margin-left: 40%}
	#button{display: inline-block; padding-left: 35%;}

</style>
<body>

 <script>
		$(document).on("click", "#alert",function(){
			var study_name= $(this).val();
			console.log("스터디 이름"+study_name);
			/* $("#name").val() = study_name; */
			$('#name').append(study_name+" 에 참여하시겠습니까?");
			/* $('#name').val(study_name); */
			
		});
</script>



<!--header title  -->
	<div class="modal-header">
		<h5 class="modal-title" id="insertModalLabel">스터디 참가</h5>
		<button class="close" type="button" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">✖</span>
		</button>
	</div>
	
	<div class="modal-body">
		
			<div id="name">									
			"${study_name}"에 참가하시겠습니까? 			
			</div>
		
		<form id="button" action="studyRoom.do" method="post"> 
		<a href="studyRoom.do">
		<!-- <form action="studyRoom.do" method="post"> -->
		<input type="submit" value="참여하기" id="plus" style="margin-left:100px;"> <!--id가 plus인 버튼의 css가 만들어져있다.  -->
		<input type="hidden" value="${study_name}" name="study_name">
		</a>
		</form>
		
		<form action="studyAll.do" method="post">			
			<input type="submit" value="돌아가기" id="plus" style="margin-left:625px; ">
		</form>	
		<%-- </form>  --%>
		
	</div>

</body>
</html>