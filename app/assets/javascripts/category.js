$(function() {

  $('.category__root_btn').on('click', function() {
    var speed = 400;
    var target_id = $(this).parent().attr("href");
    var position = $(target_id).offset().top;
    $('body, html').animate({scrollTop:position}, speed, "swing");
  })
})
