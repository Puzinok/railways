$(document).on('turbolinks:load', function() {

  var toggle = $('#nav-toggle');
  var menu = $('#nav-menu');

  toggle.click(function() {
    $(this).toggleClass('is-active');
    menu.toggleClass('is-active');
  });

  $('button.delete').on('click', function(){
    $(this).parent().fadeOut('slow');
  });
});