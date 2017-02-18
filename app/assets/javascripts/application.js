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
//= require_tree .
$(function() {
  $('.close').first().click(function () {
    $(this).parent().remove();
  });
  // $('input[readonly="readonly"]').first().click(function(){
  //   var message_container = $('.flash-message').first();
  //   if(!message_container.children().length){
  //     message_container.append(Template.alert(WARNING_MUST_BE_LOGGED_IN));
  //     $('.close').first().click(function () {
  //       $(this).parent().remove();
  //     });
  //   }
  // });
});
