<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/gbMusic.css"></link> <!-- css -->
<link rel="shortcut icon" href="#"> <!-- favicon 오류용 -->
<style>
	.musicIcon{border-color: transparent;     background-color: transparent;
				position: relative;}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>
		function sendMusic(data){
			window.parent.postMessage(data,'*');
		}
</script>

<script>
	
	$(document).ready(function () 
	{	$(".musicIcon").hover(function(){
	        $(this).animate({bottom:"+=20px"}, 250, "easeOutQuad");
	    	}, function() {
	        $(this).animate({bottom:"-=20px"}, 250, "easeOutQuad");
	    });
	});
		//음악을 선택했을때 기능
		function selectMusic(data){
		   var selectedName= data;
		   
		   $.ajax({
		      url : 'selectedMusic.do',
		      type : 'post',
		      data : {selectedName : selectedName},
		      async : false,
		      success : function(data){
		         sendMusic(data);
		         $(parent.document).find('body').removeClass('rain fire maemi cafe').addClass(selectedName);
		         
		      },//success-end
		      error:function(request, status, error){
		         console.log("에러");
		
		         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		
		      }
		   });//-end ajax
		
		}//-end selectMusic
</script>
</head>
<body>
	<br><br><br><br><br><br><br>
	<table class="musicbutton" border="0">
		<tr>
		<td>
			<button class="musicIcon" onclick="selectMusic('rain')"><svg xmlns="http://www.w3.org/2000/svg" width="180" height="180" viewBox="0 0 24 24" id="rain">
				<path d="M5.582 23l-1.41-1.41 3.59-3.59 1.41 1.41-3.59 3.59zm8.543-3.59l-1.41-1.41-3.59 3.59 1.41 1.41 
				3.59-3.59zm4.875 0l-1.41-1.41-3.59 3.59 1.41 1.41 3.59-3.59zm5-6.688c0 2.362-1.949 4.278-4.355 4.278h-10.291c-1.55 
				0-2.902-.802-3.674-2h-1.326c-2.405 0-4.354-1.916-4.354-4.278 0-2.101 1.545-3.846 3.578-4.206.168-3.073 2.75-5.516 
				5.922-5.516 1.797 0 3.403.785 4.49 2.024 3.4-.286 6.254 2.258 6.432 5.492 2.033.359 3.578 2.105 3.578 4.206zm-15.422-4.206c.116-2.126 
				1.389-3.95 3.212-4.872-.576-.394-1.323-.644-2.29-.644-3.875 0-4.062 3.854-4.012 5.209-1.384-.084-3.488.395-3.488 2.513 0 1.256 1.057 2.278 
				2.354 2.278h.674c-.147-2.357 1.528-4.126 3.55-4.484z"/>
			</svg></button><br>
			<p id="iconName">빗소리</p>
		</td>
		<td id="marginspace"></td>
		<td>
			<button class="musicIcon" onclick="selectMusic('fire')"><svg xmlns="http://www.w3.org/2000/svg" width="180" height="180" viewBox="0 0 24 24" id="fire" name="fire">
				<path d="M19 24h-14v-2h14v2zm-8.625-19.713c1.371 2.338 1.406 6.65.344 8.447 2.562-.312 5.115-2.838 5.674-4.533 1.043 
				1.439 1.607 3.144 1.607 4.966 0 1.554-.862 3.961-3.219 5.162-.219-1.391-1.125-2.906-2.638-3.766-1.44.844-2.497 2.688-2.784 
				3.938-1.234-.548-3.359-2.22-3.359-4.501 0-3.281 2.709-4.585 4.375-9.713zm-1.375-4.287c.542 6.292-5 8.458-5 14 0 3.764 
				3.49 6.42 7 7.005-.172-1.458.297-2.864 1.166-3.692.85.766 1.24 2.469.834 3.688 3.868-.75 7-3.858 7-7.833 
				0-3.626-1.833-7.043-5.291-9.168.604 2.312-.177 3.906-1.271 4.896.063-2.922-1.157-6.834-4.438-8.896z"/>
			</svg></button><br>
			<p id="iconName">모닥불</p>
		</td>
		<td id="marginspace"></td>
		<td>
			<button class="musicIcon" onclick="selectMusic('maemi')"><svg width="165" height="180" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="maemi" name="maemi">
				<path d="M12.297 5.574l-.005-.005s1.703-1.754 2.388-2.259c1.181-.871 2.743-.339 2.743-.339s.021 1.465-.936 
				2.06c-.913.568-1.788.333-1.882.307.355-.5.853-1.165 1.521-1.498-.493-.028-1.09.246-1.557.681-.38.353-1.26 1.257-1.57 
				1.576v3.1c1.068-.86 3.035-2.439 3.603-2.877 1.568-1.212 3.691-.522 3.691-.522s.028 1.963-1.254 
				2.76c-1.223.76-2.753.298-2.878.263.605-.668 1.563-1.277 2.457-1.722-.898-.122-1.614.157-2.749 1.06-.789.629-2.491 
				2.013-2.87 2.321v3.201c1.229-.929 3.753-2.811 4.9-3.452 2.85-1.593 5.101-.284 5.101-.284s-.263 2.57-2.061 
				3.417c-1.714.808-3.837-.076-3.996-.14.893-.782 2.197-1.467 3.585-1.816-1.316-.209-2.626-.195-4.415 1.213-.95.747-2.665 
				1.997-3.114 2.323l.001 9.08h-2l-.001-9.08c-.45-.328-2.162-1.576-3.112-2.323-1.789-1.408-3.099-1.422-4.415-1.213 1.388.349 
				2.692 1.034 3.585 1.816-.159.064-2.282.948-3.996.14-1.798-.847-2.061-3.417-2.061-3.417s2.251-1.309 5.101.284c1.146.641 
				3.67 2.521 4.898 3.452v-3.198c-.37-.301-2.081-1.693-2.874-2.324-1.135-.903-1.851-1.182-2.749-1.06.895.445 1.853 1.054 
				2.457 1.722-.125.035-1.655.497-2.877-.263-1.282-.797-1.254-2.76-1.254-2.76s2.122-.69 3.691.522c.568.439 2.539 2.021 
				3.606 2.88v-3.105c-.311-.321-1.189-1.222-1.568-1.574-.467-.435-1.064-.709-1.557-.681.668.333 1.166.998 1.521 
				1.498-.094.026-.969.261-1.882-.307-.957-.595-.936-2.06-.936-2.06s1.562-.532 2.743.339c.685.505 2.388 2.259 
				2.388 2.259l-.006.007.297.276.298-.278zm2.895 9.386c.389-.138 2.022-.636 3.583.12 1.788.866 2.037 3.461 2.037 
				3.461s-2.178 1.42-3.978.549c-1.717-.831-2.297-2.637-2.347-2.801 1.177.203 2.363.618 3.494 
				1.305-.847-1.062-1.783-1.926-2.789-2.634zm-6.384 0c-.389-.138-2.022-.636-3.583.12-1.788.866-2.037 3.461-2.037 
				3.461s2.178 1.42 3.978.549c1.717-.831 2.297-2.637 2.347-2.801-1.177.203-2.363.618-3.494 1.305.847-1.062 1.783-1.926 
				2.789-2.634zm3.664-10.973c.175-.175.866-.929.861-1.969-.005-1.19-1.344-1.996-1.344-1.996s-1.332.811-1.326 2.009c.006 
				1.143.832 1.924.908 1.993.194-.689.276-1.437.198-2.227.355.734.58 1.463.703 2.19z"/>
			</svg></button><br>
			<p id="iconName">매미소리</p>
		</td>
		<td id="marginspace"></td>
		<td>
			<button class="musicIcon" onclick="selectMusic('cafe')"><svg xmlns="http://www.w3.org/2000/svg" width="160" height="180" viewBox="-1 0 24 24" id="cafe" name="cafe">
				<path d="M14.911 10c-.308 3.325-1.398 5.712-2.949 8h-4.925c-1.373-2.009-2.612-4.372-2.948-8h10.822zm2.089-2h-15c0 
				5.716 1.826 8.996 4 12h7c2.12-2.911 4-6.333 4-12zm1.119 2c-.057.701-.141 1.367-.252 2h1.55c-.449 1.29-1.5 2.478-2.299 
				2.914-.358 1.038-.787 1.981-1.26 2.852 3.274-1.143 5.846-4.509 6.142-7.766h-3.881zm-7.745-3.001c4.737-4.27-.98-4.044.117-6.999-3.783 
				3.817 1.409 3.902-.117 6.999zm-2.78.001c3.154-2.825-.664-3.102.087-5.099-2.642 2.787.95 2.859-.087 5.099zm9.406 15h-15v2h15v-2z"/>
			</svg></button><br>
			<p id="iconName">카페</p>
		</td>
	</table>
</body>
</html>