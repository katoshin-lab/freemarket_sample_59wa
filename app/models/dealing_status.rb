class DealingStatus < ActiveHash::Base
  self.data = [
      {id: 1, name: '購入済み'},
      {id: 2, name: '入金待ち'},
      {id: 3, name: '発送済み'},
      {id: 4, name: '完了'},
  ]
end
