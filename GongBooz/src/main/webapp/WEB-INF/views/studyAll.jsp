<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<link href="${path}/resources/css/studyroomMain.css" rel="stylesheet"/>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>GongBooz-online study</title>

</head> 
<body>

<div class="outer">
<div class="inner">
	<h1>스터디 모집 게시판</h1>
	<hr style="border:2px color=gray;"width="100%">

<!--검색 창  -->
<section class="sc-search">
	<form action="search-controller.do" method="post">
		<select name="filter" id="filter">
			<option value="study_name">스터디명</option>
			<option value="study_tag">태그</option>
			<option value="region">오프라인 지역</option>
		</select>	
		<input type="text" name="search" placeholder="필터에 맞춰 검색해보세요" style="width:300px">
		<input type="submit" value="검색" id="search_btn">
	</form>
	<p></p>
	<div id="searched">${whatSearched} 검색결과✔</div>
</section>

<section class ="sc-insert">
	<hr style="border:2px color=gray;"width="100%">
	<div id="create_btn">
	<!-- 버튼 누를 시 새로운 버튼형태로 스터디 목록을 볼 수 있다.  -->
	<!-- <form action="studyInsertForm.do" method="post"> -->
		스터디 목록&nbsp;&nbsp;<button data-toggle="modal" id= "study_create" data-target="#modal">➕</button>	
	<!--  </form> -->
	</div>
	
	<div class="modal fade" id="modal">
	<div class="modal-dialog">
	<div class="modal-content">
		<%@ include file="studyInsertForm.jsp" %>
	</div>
	</div>
	</div>
</section>

<section class ="sc_result">

		


<!--표로 보기  -->
	<table border="2">
		<thead> <tr><th>이름</th> <th>태그</th><th>장소</th><th>정원</th><th>참여</th></tr></thead>
		<tbody>
			<c:forEach var="imsi" items="${alist}" varStatus="status">			
				<tr>
				
				<!-- <button data-toggle="modal" id= "study_create" data-target="#modal">➕</button>	 -->
					<%-- <a href="getTelinfo.do?name=${imsi.name }">${imsi.name } --%>
					<td>
					<form action="studyAlert.do" method="post"> 
					<div class="alert_modal">						
					<button id="alert" data-toggle="modal" data-id= "study_alert" data-target="#modal2" value="${imsi.study_name}"
					type="submit" name="study_name"> 
					<%-- <button id="alert" onclick="fnModuleInfo('${imsi.study_name}')" data-target="#modal2" type="submit"> --%>
					<b>${imsi.study_name}</b></button>
									 
					</div>
					</form>
					</td>
					<td>${imsi.study_tag }</td>
					<td>${imsi.region }</td>
					<td>${imsi.max_number}</td> <!--스터디 가입하기 버튼 누르면 0/max_number->1/max_number 순으로 들어가야 한다.  -->
					<td>${imsi.max_number-imsi.cur_number}</td>
			</tr>			
			</c:forEach>
		</tbody>
		</table>
		
		<!--click 함수 영역  -->
		
				
<%-- 		<!--진짜 참여를 묻는 modal  -->
		<div class="modal fade" id="modal2">				
		<div class="modal-dialog" role="document">
		<div class="modal-content">
			<%@ include file="studyAlert.jsp" %>
			<!--header title  -->
		</div>
		</div>
		</div>		 --%>

		
</section>


<br></br>


</div>
</div>



</body>
</html>