$(function() {

  // 画像のアップロード部分（10枚まで）
  $('#dropbox').on('change', $('.file_field'), function(e) {
    var number = Number($('#number').text());
    var total = Number($('#total').text());
    if (total < 10) {
      number += 1;
      total += 1;
      var image_number = '#upload_image'+number
      var buildHTML = `
        <div class="sell__image_box">
          <div class="sell__image" id="upload_image${number}">
          </div>
          <div class="sell__image_btn--edit" id=${number}_edit>
            編集
          </div>
          <div class="sell__image_btn--delete" id=${number}>
            削除
          </div>
        </div>
      `
      var buildForm = `<input id="image${number+1}" class="file_field" type="file" name="item[images_attributes][${number}][image]">`;

      file = e.target.files[0];
      reader = new FileReader();
      $('#container').append(buildHTML).trigger('create');
      if (total === 5){
        $('#dropbox').css('width', 620);
      } else if (total === 10) {
        $('#dropbox').hide();
      } else {
        var box_width = $('#dropbox').css('width').replace('px', '');
        box_width -= 126;
        $('#dropbox').css('width', box_width+'px');
      }; 

      reader.onload = (function(file) {
        return function(e) {

          $(image_number).prepend($('<img>').attr({
            src: e.target.result,
            title: "image" + number,
            class: "sell__image"
          }));
        };
      })(file);
      reader.readAsDataURL(file);
      $('#dropbox').append(buildForm).trigger('create');
      $('#number').text(number);
      $('#total').text(total);
    };
  });
  // 画像の削除機能部分
  $('#container').click('.sell__image_btn--delete', function() {
    var total = Number($('#total').text());
    var click = $(event.target);
    var click_image_id = "#image" + click.attr('id');
    if (total === 10) {
      $('#dropbox').show();
    } else if (total === 5) {
      $('#dropbox').css('width', 116);
    } else {
      var box_width = $('#dropbox').css('width').replace('px', '');
      box_width = Number(box_width) + 126;
      $('#dropbox').css('width', box_width);
    }
    click.parent().remove();
    $(click_image_id).remove();
    total--;
    $('#total').text(total).trigger('create');
  });

  // カテゴリー部分
  // サブカテゴリーが未選択の場合ははじめに非表示にする
  if ($('#item_category_id option:selected').val() === "") {
    $('#item_subcategory_selector').hide();
  };
  if ($('#item_subcategory option:selected').val() === "") {
    $('#item_sub_subcategory_selector').hide();
  };
  // カテゴリー選択部分
  function build_list(category, HTML) {
    var selectHTML = `
    <div class="sell__select_form" id="${category}_selector">
      <i class="fas fa-chevron-down"></i>
      <select id="${category}" name="${category}">
        <option value>---</option>
        ${HTML}
      </select>
    </div>`;
    $('.sell__category').append(selectHTML)
  }
  $('#item_category_selector').on('change', function() {
    var category = ($('#item_category_id option:selected').val());
    var listHTML = '';
    $.ajax({
      type: 'GET',
      url: '/items/new',
      data: {ancestry: category},
      dataType: 'json'
    })
    .done(function(data) {
      $('#item_subcategory_selector').remove();
      $('#item_sub_subcategory_selector').remove();
      if (data.length !== 0) {
        data.forEach(function(subcategory) {
          listHTML += `
          <option value="${subcategory.id}">${subcategory.name}</option>
          `;
        });
        build_list("item_subcategory", listHTML);
        error_color();
      };
    })
  })
  // サブカテゴリー選択部分
  $('#category_field').on('change', '#item_subcategory_selector', function() {
    var category = ($('#item_category_id option:selected').val());
    var subcategory = ($('#item_subcategory option:selected').val());
    var listHTML = '';
    $.ajax({
      type: 'GET',
      url: '/items/new',
      data: {ancestry: category+"/"+subcategory},
      dataType: 'json'
    })
    .done(function(data) {
      $('#item_sub_subcategory_selector').remove();
      if (data.length !== 0) {
        data.forEach(function(sub_subcategory) {
          listHTML += `
          <option value="${sub_subcategory.id}">${sub_subcategory.name}</option>
          `;
        });
        build_list("item_sub_subcategory", listHTML);
        error_color();
      };
    })
  });
  // カテゴリーが正しく入力されていない場合に色が変化するように設定
  function error_color() {
    if ($('#item_category_selector').children('.field_with_errors').length) {
      $('#item_subcategory_selector').addClass("field_with_errors");
      $('#item_sub_subcategory_selector').addClass("field_with_errors");
    }
  };
  error_color();

  // 送料負担切り替えの部分
  $('#item_is_seller_shipping').on('change', function() {
    var seller_shipping = $('#item_is_seller_shipping option:selected').val()
    if ( seller_shipping == "" ) {
      $('#method').hide();
    } else if (seller_shipping == "true") {
      var HTML = `
        <option value>---</option>
        <option value="1">未定</option>
        <option value="2">らくらくメルカリ便</option>
        <option value="3">ゆうメール</option>
        <option value="4">レターパック</option>
        <option value="5">普通郵便(定形、定形外)</option>
        <option value="6">クロネコヤマト</option>
        <option value="7">ゆうパック</option>
        <option value="8">クリックポスト</option>
        <option value="9">ゆうパケット</option>
      `
      $('#item_shipping_method_id').empty().append(HTML);
      $('#method').show();
    } else {
      var HTML = `
        <option value>---</option>
        <option value="1">未定</option>
        <option value="6">クロネコヤマト</option>
        <option value="7">ゆうパック</option>
        <option value="3">ゆうメール</option>
      `
      $('#item_shipping_method_id').empty().append(HTML);
      $('#method').show();
    }
  })

  // 手数料、利益の自動計算部分
  $('#item_price').on("keyup", function(){
    var input = $('#item_price').val();
    var charge = Math.floor(input * 0.1);
    var gain = (input - charge);
    if (input >= 300 && input <= 9999999) {
      $('#charge').empty().append("¥" + charge.toLocaleString());
      $('#gain').empty().append("¥" + gain.toLocaleString());
    } else {
      $('#charge').empty().append("-");
      $('#gain').empty().append("-");
    }
  }) 
})