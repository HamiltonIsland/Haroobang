$(".messages").animate({ scrollTop: $(document).height()+10000 }, "fast");

$("#profile-img").click(function() {
	$("#status-options").toggleClass("active");
});

$(".expand-button").click(function() {
  $("#profile").toggleClass("expanded");
	$("#contacts").toggleClass("expanded");
});

$("#status-options ul li").click(function() {
	$("#profile-img").removeClass();
	$("#status-online").removeClass("active");
	$("#status-away").removeClass("active");
	$("#status-busy").removeClass("active");
	$("#status-offline").removeClass("active");
	$(this).addClass("active");
	
	if($("#status-online").hasClass("active")) {
		$("#profile-img").addClass("online");
	} else if ($("#status-away").hasClass("active")) {
		$("#profile-img").addClass("away");
	} else if ($("#status-busy").hasClass("active")) {
		$("#profile-img").addClass("busy");
	} else if ($("#status-offline").hasClass("active")) {
		$("#profile-img").addClass("offline");
	} else {
		$("#profile-img").removeClass();
	};
	
	$("#status-options").removeClass("active");
}); 

function newMessage() {
	message = $(".message-input #text").val();
	if($.trim(message) == '') {
		return false;
	}
	$('<li class="replies"><p>' + message + '</p></li>').appendTo($('.messages ul'));
	$('.contact.active .preview').html('<span>You: </span>' + message);
	$(".messages").animate({ scrollTop: $(document).height()+10000 }, "fast");
	
	
};

$('.submit').click(function() {
	
  newMessage();
  var message = $(".message-input #text").val();
  var messageRoomNo = $(".message-input #messageRoomNo").val();
  var memberNo = $(".message-input #memberNo").val();
  $.ajax({
		url:"writeMessage.action",
		method:"post",
		data:{"memberNo":memberNo,"content":message,"messageRoomNo":messageRoomNo},
		success:function(data,status,xhr){	

			$('.message-input #text').val(null);
		}
	});
});

$(window).on('keydown', function(e) {
  if (e.which == 13) {
    newMessage();
    return false;
  }
});
