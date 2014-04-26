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
    console.log('user presses submitted login form');
    $.ajax({
      type: "POST",
      url: '/login',
      data: {email: "newguy@example.com", password: "password"},
      // dataType: "json",
      success: function(response) {
        console.log(response);
      }
    });
  });
  // -------------

});
