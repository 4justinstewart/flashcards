$(document).ready(function() {
  
// HIDE LOGIN FORM
  $('#signup-toggle').hide();
  $('.login-form').hide();

// TOGGLE BETWEEN TOGGLE/SIGNUP FORMS
  $('#toggling-nav').on('click', function(event) {
    event.preventDefault();
    $('p#error-message').text("");
    $('#login-toggle').toggle();
    $('#signup-toggle').toggle();
    $('.signup-form').toggle("medium");
    $('.login-form').toggle("medium");
  });

// NOTIFY USER OF INCORRECT USERNAME/PASSWORD
  $('#login-button').on('click', function(event) {
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: '/login',
      data: {email: $('form[action="/login"').find('input[name="email"]').val(), password: $('form[action="/login"').find('input[name="password"]').val()},
      success: function(response) {
        if (response == "pass") {
          console.log("pass");
          location.href = "/dashboard";
        } else {
          console.log("fail");
          $('p#error-message').text("Incorrect email or password.");
        }
      }
    });
  });

});
