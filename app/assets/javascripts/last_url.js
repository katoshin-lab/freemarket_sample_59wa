$(function() {
  var lastURL = $('#lastURL').val();
  $('#card_change').on('click', function() {
    $('#card_update').on("ajax:success", function(event, xhr, settings) {　
      window.location.replace(lastURL);
    });
    $('#card_update').on("ajax:error", function(event, xhr, settings) {　
      window.alert("エラーが発生しました");
    });
  })

  $('#delivery_change').on('click', function() {
    $('#delivery_update').on("ajax:success", function(event, xhr, settings) {　
      window.location.replace(lastURL);
    });
    $('#delivery_update').on("ajax:error", function(event, xhr, settings) {　
      window.alert("エラーが発生しました");
    });
  })

})
