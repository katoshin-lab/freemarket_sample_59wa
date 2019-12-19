$(function() {
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