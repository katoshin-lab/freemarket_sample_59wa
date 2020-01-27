module ItemHelper
  def ajax_redirect_to(url)
    { js: "window.location.replace('#{url}');" }
  end

end