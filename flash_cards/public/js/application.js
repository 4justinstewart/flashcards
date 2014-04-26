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

  $('#login-button').click( function(event) {
    event.preventDefault();
    $.ajax({
      url: '/login',
      type: 'POST', 
      data: { email: $('input[name="email"]').value(), password: $('input[name="password"]').value() },
      success: function(response) {
        console.log("callback firing");
        console.log(response);
      }
    });
  });

});
