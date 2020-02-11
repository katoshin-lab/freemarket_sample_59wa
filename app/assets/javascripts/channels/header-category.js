$(function() {

  // 「カテゴリーから探す」にマウスカーソルを合わせるとカテゴリー一覧が表示
  $('#category').hover(function() {
    console.log("ok");
    $('.header-category__hidden').show();
  }, function() {
    $('.header-category__hidden').hide();
  })
})
