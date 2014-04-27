$(document).ready(function() {
  
// FRONT END VALIDATIONS - RON  

// LOGIN - NOTIFY USER OF INCORRECT USERNAME/PASSWORD
  $('#login-button').on('click', function(event) {
    $('p.error-message').remove(); 
    event.preventDefault();
    $.ajax({
      type: 'POST',
      url: '/login',
      data: { email: $('form[action="/login"').find('input[name="email"]').val(), 
              password: $('form[action="/login"').find('input[name="password"]').val()
            },
      success: function(response) {
        if (response == "pass") {
          console.log("pass");
          location.href = "/dashboard";
        } else {
          console.log("fail");
          $('form[action="/login"').trigger("reset");
          $('div.container').append('<p class="error-message">Incorrect email or password</a>');
        }
      }
    });
  });

// SIGNUP - NOTIFY USER OF NON-MATCHING PASSWORDS, SHOW VALIDATION ERRORS
  $('#signup-button').on('click', function(event) {
    $('p.error-message').remove();
    event.preventDefault();
    $.ajax({
      type: 'POST',  
      url: '/signup',
      data: { user: 
              { first_name: $('form[action="/signup"]').find('input[name="user[first_name]"]').val(),
                last_name: $('form[action="/signup"]').find('input[name="user[last_name]"]').val(),
                email: $('form[action="/signup"]').find('input[name="user[email]"]').val(), 
                password: $('form[action="/signup"]').find('input[name="user[password]"]').val(),
              },
              verify_password: $('form[action="/signup"]').find('input[name="verify_password"]').val()
            },
      success: function(response) {
        console.log(response);
        if (response == "created") {
          // redirect to dashboard
          console.log("Created account");
          location.href = '/dashboard';
        } else if (response == "blankpassword") {
          // display blank password error
          console.log("password is blank)");
          $('div.container').append('<p class="error-message">Password cannot be blank</a>'); 
        } else if (response == "nomatch") {
          // display non matching password error
          $('div.container').append('<p class="error-message">Passwords do not match</a>');
        } else {
          // display validation errors
          var errors = JSON.parse(response);
          console.log(errors);
          for (var i=0;i<errors.length;i++) {
            var error = errors[i]
            $('div.container').append('<p class="error-message">'+error+'</a>');
          }
        }
      }
    });
  });

// HIDE LOGIN FORM
  $('#signup-toggle').hide();
  $('.login-form').hide();

// TOGGLE BETWEEN TOGGLE/SIGNUP FORMS
  $('#toggling-nav').on('click', function(event) {
    event.preventDefault();
    $('form[action="/signup"').trigger("reset");
    $('form[action="/login"').trigger("reset");
    $('p.error-message').remove();
    $('#login-toggle').toggle();
    $('#signup-toggle').toggle();
    $('.signup-form').toggle("medium");
    $('.login-form').toggle("medium");
  });
});
