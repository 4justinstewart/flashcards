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

  // AJAX plz work
  $('#login-button').on('click', function(event) {
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: '/login',
      data: {email: $('form[action="/login"').find('input[name="email"]').val(), password: $('form[action="/login"').find('input[name="password"]').val()},
      success: function(response) {
        if (response == "pass") {
          console.log("pass");
          $.get('/dashboard');
        } else {
          console.log("fail");
        }
      }
    });
  });
  // -------------

});
