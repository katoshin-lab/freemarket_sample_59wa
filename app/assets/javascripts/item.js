$(function() {
  // 画像の切り替え
  $('.items-image__boxes').on('click', function() {
    console.log(this);
    var image_url = $(this).children('img').attr('src');
    var imageHTML = `<img src=${image_url} class="items-image__box">`
    $('.items-image__box').remove();
    $('.items-image').prepend(imageHTML);
  })

  // いいねボタン機能
  // いいねを追加
  $('.items-tag__left').on('click', '#good_btn', function() {
    var likes_count = $('#likes_count').text();
    $(this).removeClass().addClass("items-tag__left--liked");
    $(this).attr("id", "good_btn_liked");
    $('#likes_count').text(Number(likes_count) + 1);
  })
  // いいね済みの場合はいいねを取り消し
  $('.items-tag__left').on('click', '#good_btn_liked', function() {
    var likes_count = $('#likes_count').text();
    $(this).removeClass().addClass("items-tag__left--good");
    $(this).attr("id", "good_btn");
    $('#likes_count').text(Number(likes_count) - 1);
  })

})