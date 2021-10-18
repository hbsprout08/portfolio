<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Link Swiper's CSS -->
    <link	rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"	/>
<script type="text/javascript">
	$(document).ready(function(){
	/* 	$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		}) */
		
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="${pageContext.request.contextPath}/member/memberUpdateView.do";
		})
		
	})
</script>
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

*{				font-family: 'ChosunSg';
				margin:0;
				padding:0;
			}
			

	.myinfoWrap{
			  width: 640px;  
			
             /*높이만큼 늘어남*/
            overflow: hidden;

            padding-bottom: 100px; 
            
            /*글자의 정렬*/
             text-align: center;/*box안에 인라인 요소들 가운데 정렬?  */ 
              
            
	}
	
	.myinfo{
		 margin: 0 auto;
			 width:600px;
			  padding-top:30px;
            padding-bottom:70px;
             overflow: hidden;
             box-shadow:  2px 5px 16px 0px, 5px 5px 15px 5px rgba(0,0,0,0);
			  border:1px solid #ddd; 
	border-radius:4px;
			
	} 
	
	.modifyTable{
		margin-left:40px;
	}
	
	.modifyTable th, .modifyTable td{
				padding:10px;
				box-sizing:border-box;/*box-sizing : border-box; 는 테두리를 포함하여 박스의 크기를 지정하는 것이다.  */
				border-bottom:1px solid #ddd;
				font-size:14px;
				
				color:#ffffff;
				
			}
			
			.modifyTable th{
				text-align:center;
				/*  background-color:#eee;  */
				width:100px;
				font-weight:bold;
				color:white;
				border-right:1px solid #ddd;
				border-left:1px solid #ddd;
			
			}
			
			.modifyTable td{
				width:400px;
				border-right:1px solid #ddd;
				
			}
			
			.modifyTable .first{/* joinTable 속성을 가진 태그 내부의 first 속성에 대한 스타일이다. */
				border-top:1px solid #eee;
			}
			.modifyTable .last{/* joinTable 속성을 가진 태그 내부의 first 속성에 대한 스타일이다. */
				border-bottom:1px solid eee;
			}
			
			
			label{font-size:14px;}
			a{
				text-decoration : none;
				font-size:16px;
			}
			
			.welcome{
			font-size:21px;
			color:#ffffff;
			margin-top:30px;
			margin-bottom:30px;
			
		}
		
		.myinfobottom{
			margin-top:40px;
			font-size:14px;
			 color:#ffffff; 
		}

      #wrap{
      	margin:70px auto;
      	width:1400px;
      	/* color:#000; */
      }
      
      aside{
      	 float:left;
      	 margin-bottom:100px;
      }	
      
      section{
      	float:right;
      	margin-bottom:100px;
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
	            /* font-family: 'Ephesis', cursive; */
	            font-family: 'title', cursive;
	            font-size:44px;
	        } 
	        
	        
	  /*swiper  */
	     .swiper {
       /*  width: 100%; */
       width:1000px;
        padding-top: 50px;
        padding-bottom: 50px;
        margin-top:100px;
      }

      .swiper-slide {
        background-position: center;
         background-size: cover; 
     /*    width: 300px;
        height: 300px; */
        width: 200px;
        height: 200px;
      }

      .swiper-slide img {
         display: block;
         width: 100%; 
      }
</style>


</head>
<body  >
<%-- 			<c:if test="${member.userid == null}">
								<!-- <p>로그인 후에 작성하실 수 있습니다.</p> -->
								<script>
									location.href="${pageContext.request.contextPath}/member/login.do";
	
								</script>
		</c:if>
		<c:if test="${member != null}">
			
			<a href="logout.do" style="color:white">로그아웃</a>
			
			<a href="${pageContext.request.contextPath}/board/boardList.do" style="color:white">자유 게시판</a>
		</c:if>	 --%>
		<!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="${pageContext.request.contextPath}/resources/img/swiper_1.png" />
        </div>
        <div class="swiper-slide">
          <img src="${pageContext.request.contextPath}/resources/img/swiper_2.png" />
        </div>
        <div class="swiper-slide">
          <img src="${pageContext.request.contextPath}/resources/img/swiper_3.png" />
        </div>
        <div class="swiper-slide">
          <img src="${pageContext.request.contextPath}/resources/img/swiper_4.png" />
        </div>
        <div class="swiper-slide">
          <img src="${pageContext.request.contextPath}/resources/img/swiper_1.png" />
        </div>
        <div class="swiper-slide">
          <img src="${pageContext.request.contextPath}/resources/img/swiper_2.png" />
        </div>
        <div class="swiper-slide">
          <img src="${pageContext.request.contextPath}/resources/img/swiper_3.png" />
        </div>
        <div class="swiper-slide">
          <img src="${pageContext.request.contextPath}/resources/img/swiper_4.png" />
        </div>

      </div>
      <div class="swiper-pagination"></div>
    </div>


			
		
		<c:if test="${member != null}">

		<div id="wrap">
		<aside >
			 <%@ include file="./calendar.jsp" %>	 
		</aside>	
		
		<section>
				<div class="myinfoWrap">
				
				<div class="myinfo">
					<div class="logo">
				        <p class="gongbooz">GongBooZ</p> 
					</div>
				
				<p class="welcome">${member.userid}님 안녕하세요.</p>
			
				
				<table class="modifyTable">
		      
		        
		        <tr>
		            <th class="first"><label for="id">아이디</label></th>
		            <td class="first">
		            ${member.userid}
		        	</td>
		        </tr>
		        <tr>
		            <th><label for="pw">비밀번호</label></th>
		            <td> ********
		            </td>
		        </tr>
		        <tr>
		            <th><label for="name">이름</label></th>
		            <td>
		           	${member.username}
		            </td>
		        </tr>
		        <tr>
		            <th><label for="date">가입날짜</label></th>
		            <td>
		            	<fmt:formatDate value="${member.regdate}" pattern="yyyy-MM-dd"/>
		            	
		        	 </td>
		        </tr>
		        <tr>
		            <th class="last"><label for="phone1" >이메일</label></th>
		            <td class="last">
		            	${member.membermail}
		        	 </td>
		        </tr>
				
				</table>
			<div class="myinfobottom">
			<a href="${pageContext.request.contextPath}/member/memberUpdateView.do" style="color:#ffffff;">회원정보수정 </a>/
			<a href="${pageContext.request.contextPath}/member/memberDeleteView.do" style="color:#ffffff;">회원탈퇴</a>
			</div>
				</div>
			</div>
			
			
		 </section>         
		</div>
		</c:if>
		   
			
			

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        effect: "coverflow",
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: "auto",
        coverflowEffect: {
          rotate: 50,
          stretch: 0,
          depth: 100,
          modifier: 1,
          slideShadows: true,
        },
        pagination: {
          el: ".swiper-pagination",
        },
      });
    </script>

</body>
</html>