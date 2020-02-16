$(function() {

  // 「カテゴリーから探す」にマウスカーソルを合わせるとカテゴリー一覧が表示
  $('#category').hover(function() {
    $('.header-category__hidden').show();
  }, function() {
    $('.header-category__hidden').hide();
  })
  $('.header-category__label').hover(function() {
    var target_id = $(event.target).attr('id');
    var target = "#top_category_"+target_id+"_list";
    $(target).show();
  }, function() {
    var target_id = $(event.target).closest('.header-category__label').find('.header-category__box').attr('id');
    var target = "#top_category_"+target_id+"_list";
    $(target).hide();
  });
  $('.header-category__label--subcategory').hover(function() {
    var target_id = $(event.target).attr('id');
    var target = "#top_category_"+target_id+"_list";
    $(target).show();
  }, function() {
    var target_id = $(event.target).closest('.header-category__label--subcategory').find('.header-category__box--subcategory').attr('id');
    var target = "#top_category_"+target_id+"_list";
    $(target).hide();
  });
})
