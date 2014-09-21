// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap.min
//= require jquery_ujs
//= require turbolinks
//= require_tree .
	
$(function(){
	$('#FlashModal').modal({
		"backdrop" : "static"
	});

	$('#FlashModal').on('show.bs.modal', function (e) {
		var count=15;
		var counter=setInterval(timer, 1000); //1000 will  run it every 1 second
		
		function timer(){
		  count=count-1;
		  if (count <= 0)
		  {
		     clearInterval(counter);
		     return;
		  }
		 document.getElementById("timer").innerHTML=count;
		 if (count = 0)
		 {
		 	$("#FlashModal").modal("hide");
		 }
		}
	});
	
	$('#FlashModal').on('hidden.bs.modal', function () {
    	window.location = window.location.pathname;
	});

});	

$(document).ready(function(){	
	
	window.setTimeout(function() {
		$("#notice").fadeTo(500, 0).slideUp(500, function(){
		$(this).remove(); 
		 });
		}, 2000);
		
	window.setTimeout(function() {
		$("#alert").fadeTo(500, 0).slideUp(500, function(){
		$(this).remove(); 
		 });
		}, 2000);
		
});

