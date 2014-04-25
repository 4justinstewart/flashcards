$(document).ready(function() {
  $('#signup-toggle').hide();
  $('.login-form').hide();
  $('#toggling-nav').on('click', function(event) {
    event.preventDefault();
    $('#login-toggle').toggle();
    $('#signup-toggle').toggle();
    $('.signup-form').toggle("medium");
    $('.login-form').toggle("medium");
  });
});
