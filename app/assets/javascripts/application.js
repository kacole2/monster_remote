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

$('#FlashModal').modal({
		"backdrop" : "static"
	});

$('#FlashModal').on('shownn.bs.modal', function (e) {
    sec = 15;
		
	timer = setInterval(function() {
	   	$("#mdtimer span").text(sec--);
	   	if (sec <= 0) {
			clearInterval("#mdtimer span");
			sec = 15;}
		},990);
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

