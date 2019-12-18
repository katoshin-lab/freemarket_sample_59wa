class ShippingMethod < ActiveHash::Base
  self.data = [
    {id: 1, shipping_method: "未定"},
    {id: 2, shipping_method: "らくらくメルカリ便"},
    {id: 3, shipping_method: "ゆうメール"},
    {id: 4, shipping_method: "レターパック"},
    {id: 5, shipping_method: "普通郵便(定形、定形外)"},
    {id: 6, shipping_method: "クロネコヤマト"},
    {id: 7, shipping_method: "ゆうパック"},
    {id: 8, shipping_method: "クリックポスト"},
    {id: 9, shipping_method: "ゆうパケット"}
  ]
end
