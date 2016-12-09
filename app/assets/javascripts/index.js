$(document).ready(function() {
  $('.contact-button').click(function() {
    if($(".contact-form").is(":visible")) {
      $(".contact-form").hide();
    } else {
      $(".contact-form").slideDown();
    }
  });
});
