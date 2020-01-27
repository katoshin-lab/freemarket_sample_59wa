module ItemHelper
  def ajax_redirect_to(url)
    { js: "window.location.replace('#{url}');" }
  end

  def alert_image
    { js: "$('#scroll_to_top').click(function() {
      $('body, html').scrollTop(0);
    });
     window.alert('画像が入っていません')" }
  end

  def alert_text
    { js: "$('#scroll_to_top').click(function() {
      $('body, html').scrollTop(0);
    });
     window.alert('画像が入っていません')" }
  end
end