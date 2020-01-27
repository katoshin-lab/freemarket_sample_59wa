module ItemHelper
  def ajax_redirect_to(url)
    { js: "window.location.replace('#{url}');" }
  end

  def alert_image
      { js: "window.alert('画像が入っていません')"}    
  end

  def alert_text
    { js: "window.alert('入力に誤っている箇所があります')"}    
end
end