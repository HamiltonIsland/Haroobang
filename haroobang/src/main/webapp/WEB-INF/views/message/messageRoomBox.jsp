<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content">
	<div class="contact-profile">
		<img src="/haroobang/resources/upload/${picture}"
			alt="" />
		<p>${name}</p>
		<div class="social-media">
			<i class="fa fa-facebook" aria-hidden="true"></i> <i
				class="fa fa-twitter" aria-hidden="true"></i> <i
				class="fa fa-instagram" aria-hidden="true"></i>
		</div>
	</div>
	<div class="messages" >
		<ul>
			<c:forEach var="list" items="${messageList}">
			<c:choose>
			<c:when test="${list.memberNo == login.memberNo}">			
			<li class="replies"><img 
				src="/haroobang/resources/upload/${login.savedFileName}" alt="" />
				<p>${list.content }</p></li>
			</c:when>
			<c:otherwise>
			<li class="sent"><img
				src="/haroobang/resources/upload/${picture}" alt="" />
				<p>${list.content}</p></li> 
			</c:otherwise>
			</c:choose>
			</c:forEach>
		</ul>
	</div>
	<div class="message-input">
		<div class="wrap">
		<form id="messagesForm">
		<input type="hidden" name="messageRoomNo" value="${messageRoomNo }">
		<input type="hidden" name="memberNo" value="${login.memberNo }">
			<input type="text" name = "content" style="width: 80%; margin:0 auto" 
				placeholder="Write your message..." />
		</form>
			<button class="submitbtn">
				<i class="fa fa-paper-plane" aria-hidden="true"></i>
			</button>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		$(function(){
			
			$(".content").on("click",".submitbtn",function(e){
				var data = $("#messagesForm").serialize();
				
				var roomNo = ${messageRoomNo};
				var name = ${name};
				var picture = ${picture};
				$.ajax({
					url:"writeMessage.action",
					method:"post",
					data:data,
					success:function(data,status,xhr){
						$(".content").load("messageRoomBox.action",{"roomNo":roomNo,"name":name,"picture":picture});
					}
				});
				
			});
			
			
		});
	</script>