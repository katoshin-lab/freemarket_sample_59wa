# ルート
crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :mypages do
  link "マイページ", mypages_path
  parent :root
end

crumb :profile do
  link "プロフィール", profile_mypages_path
  parent :mypages
end

crumb :addcard do
  link "支払い方法", addcard_mypages_path
  parent :mypages
end

crumb :card_info do
  link "支払い方法", card_info_mypages_path
  parent :mypages
end

crumb :personal_info do
  link "本人確認情報", personal_info_mypages_path
  parent :mypages
end

crumb :logout do
  link "ログアウト", logout_mypages_path
  parent :mypages
end

crumb :card_info do
  link "支払い方法", card_info_mypages_path
  parent :mypages
end

# カテゴリー

crumb :categories do
  link "カテゴリー一覧", categories_path
end

crumb :category do |category|
  link category.name, category
  if category.parent
    parent category.parent
  else
    parent :categories
  end
end