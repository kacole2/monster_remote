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

$(document).ready(function(){	
	window.setInterval(function () {
        $("#FlashModal").modal("hide");
    }, 15000); 
	
	jQuery(document).ready(function() {
		sec = 15;
		timer = setInterval(function() {
	   	$("#mdtimer span").text(sec--);
	   	if (sec <= 0) {
			clearInterval("#mdtimer span");
			sec = 15;}
		},990);
	}); 
	
});

function adjustModalMaxHeightAndPosition(){
  $('.modal').each(function(){
    if($(this).hasClass('in') === false){
      $(this).show();
    }
    var contentHeight = $(window).height() - 60;
    var headerHeight = $(this).find('.modal-header').outerHeight() || 2;
    var footerHeight = $(this).find('.modal-footer').outerHeight() || 2;

    $(this).find('.modal-content').css({
      'max-height': function () {
        return contentHeight;
      }
    });

    $(this).find('.modal-body').css({
      'max-height': function () {
        return contentHeight - (headerHeight + footerHeight);
      }
    });

    $(this).find('.modal-dialog').addClass('modal-dialog-center').css({
      'margin-top': function () {
        return -($(this).outerHeight() / 2);
      },
      'margin-left': function () {
        return -($(this).outerWidth() / 2);
      }
    });
    if($(this).hasClass('in') === false){
      $(this).hide();
    }
  });
}
if ($(window).height() >= 320){
  $(window).resize(adjustModalMaxHeightAndPosition).trigger("resize");
}

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

