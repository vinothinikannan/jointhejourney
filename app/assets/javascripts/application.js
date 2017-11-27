// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require calendario
//= require calendar
//= require carouseller
//= require classie
//= require menu
//= require mobiscroll
//= require search
//= require forms
//= require entry
//= require iframeResizer
//= require_tree .
;
(function($) {

  $(document).ready(function() {
    smtp_mail_prop('.contactform');
  });

  // ===== Scroll to Top ==== 
  $(window).scroll(function() {
      if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
        $('.return-to-top').fadeIn(200);    // Fade in the arrow
      } else {
        $('.return-to-top').fadeOut(200);   // Else fade out the arrow
      }
  });

  $('.return-to-top').click(function() {      // When arrow is clicked
    $('body,html').animate({
      scrollTop : 0                       // Scroll to top of body
    }, 500);
  });
  
  $(".signup-menu").on('click',function(){
    $(".signup-popup").show();
  });
      
      
  $(".missout-rem-close").on('click', function() {
    var current = $(this);
    var parent = current.data('parent');
    var open = current.data('open');
    $(parent).hide();
    $(open).show();
  });

  $(".accordion-heading").on('click', function() {
    $(this).find('.accordion-icon').toggleClass("content-rotate")
  });

  $(document).ready(function () {
   $(window).scroll(function () {
      var threshold = 100; // number of pixels before bottom of page that you want to start fading
      var op = (($(document).height() - $(window).height() - 600) - $(window).scrollTop()) / threshold;
      if ($(this).scrollTop() > 100) {
        $('.float-icon').fadeIn();
      }else {
        $('.float-icon').fadeOut();
      }
      if( op <= 0 ){
        $(".float-icon ").hide();
      } else {
        $(".float-icon ").show();
      }
      $(".float-icon" ).css("opacity", op );
   });
  	   
  });

})(jQuery);