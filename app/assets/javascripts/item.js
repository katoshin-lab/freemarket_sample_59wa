$(function() {
  // 画像の切り替え
  $('.items-image__boxes').on('click', function() {
    var image_url = $(this).children('img').attr('src');
    var imageHTML = `<img src=${image_url} class="items-image__box">`
    $('.items-image__box').remove();
    $('.items-image').prepend(imageHTML);
  })
})
