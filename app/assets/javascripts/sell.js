$(function() {


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