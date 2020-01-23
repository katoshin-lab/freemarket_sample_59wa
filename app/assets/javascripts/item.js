$(function() {
  // 画像の切り替え
  $('.items-image__boxes').on('click', function() {
    var image_url = $(this).children('img').attr('src');
    var imageHTML = `<img src=${image_url} class="items-image__box">`
    $('.items-image__box').remove();
    $('.items-image').prepend(imageHTML);
  })

  // いいねボタン機能
  // いいねを追加
  $('.items-tag__left').on('click', '#good_btn', function() {
    setTimeout(function(){
      var likes_count = $('#likes_count').text();
      $('#good_btn').attr("id", "good_btn_liked");
      $('#likes_count').text(Number(likes_count) + 1);  
    }, 50);
  })
  // いいね済みの場合はいいねを取り消し
  $('.items-tag__left').on('click', '#good_btn_liked', function() {
    setTimeout(function(){
      var likes_count = $('#likes_count').text();
      $('#good_btn_liked').attr("id", "good_btn");
      $('#likes_count').text(Number(likes_count) - 1);
      if ($('#likes_count').text() === "0") {
        $('#likes_count').text("");
      };
    }, 50);
  })
})
