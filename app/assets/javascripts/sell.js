$(function() {

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
          <div class="sell__image_btn--delete" id=${number}>
            削除
          </div>
        </div>
      `
      var buildForm = `<input id="image${number+1}" multiple="multiple" class="file_field" type="file" name="image[]">`;

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

  $('#is_seller_shipping').on('change', function() {
    var seller_shipping = $('#is_seller_shipping option:selected').val()
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
      $('#shipping_method').empty().append(HTML);
      $('#method').show();
    } else {
      var HTML = `
        <option value>---</option>
        <option value="1">未定</option>
        <option value="6">クロネコヤマト</option>
        <option value="7">ゆうパック</option>
        <option value="3">ゆうメール</option>
      `
      $('#shipping_method').empty().append(HTML);
      $('#method').show();

    }
  })

  $('#price').on("keyup", function(){
    var input = $('#price').val();
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