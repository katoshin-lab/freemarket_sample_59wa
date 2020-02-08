module ItemHelper
  def is_seller?
    user_signed_in? && @item.seller_id == current_user.id
  end
  def without_seller
    redirect_to mypages_path if is_seller?
  end

  def is_sold?
    @item.item_status_id == 4 || @item.dealing.present?
  end

  def ajax_redirect_to(url)
    { js: "window.location.replace('#{url}');" }
  end

  def alert_image
    { js: "window.alert('画像が入っていません');" }
  end

  def alert_text
    { js: "window.alert('入力に誤りがあります')" }
  end
end
