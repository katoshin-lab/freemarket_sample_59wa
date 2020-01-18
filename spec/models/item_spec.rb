require 'rails_helper'

describe Item do
  describe '#index' do

    it "商品画像が正常に呼び出される" do
      image = Image.new(image: "test.jpg")
      expect(image.image).to eq "test.jpg"
    end

    it "価格が正常に呼び出される" do
      item = Item.new(price: 10000)
      expect(item.price).to eq 10000
    end

    it "商品名が正常に呼び出される" do
      item = Item.new(name: "テスト商品")
      expect(item.name).to eq "テスト商品"
    end

  end
end 