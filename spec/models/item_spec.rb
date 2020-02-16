require 'rails_helper'

describe Item do

  describe '#create' do
  subject {test_item.valid?}
  let(:test_item){build(:item)}

    context 'can save' do
      it "is vaild with a name , a seller_id, detail , a category_id, condition_id, is_seller_shipping, prefecture_id, shipping_period_id, shipping_method_id , price , item_status_id " do
        expect(test_item).to be_valid
      end
    end

    context 'cannot save' do
      it "is invalid without a name" do
        test_item.name = nil
        subject
        expect(test_item.errors[:name]).to include("can't be blank")
      end

      it "invalid with a name that has more than 41 characters" do
        test_item.name = Faker::Alphanumeric.alphanumeric(number: 41)
        subject
        expect(test_item.errors[:name]).to include("is too long (maximum is 40 characters)")
      end

      it "is invalid without a detail" do
        test_item.detail = nil
        subject
        expect(test_item.errors[:detail]).to include("can't be blank")
      end

      it "invalid with a detail that has more than 1001 characters" do
        test_item.detail = Faker::Alphanumeric.alphanumeric(number: 1001)
        subject
        expect(test_item.errors[:detail]).to include("is too long (maximum is 1000 characters)")
      end

      it "is invalid without a seller_id" do
        test_item.seller_id = nil
        subject
        expect(test_item.errors[:seller_id]).to include("can't be blank")
      end

      it "is invalid without a category_id" do
        test_item.category_id = nil
        subject
        expect(test_item.errors[:category_id]).to include("can't be blank")
      end

      it "is invalid without a condition_id" do
        test_item.condition_id = nil
        subject
        expect(test_item.errors[:condition_id]).to include("can't be blank")
      end

      it "is invalid without true or false" do
        test_item.is_seller_shipping = nil
        subject
        expect(test_item.errors[:is_seller_shipping]).to include("is not included in the list")
      end

      it "is invalid without a prefecture_id" do
        test_item.prefecture_id = nil
        subject
        expect(test_item.errors[:prefecture_id]).to include("can't be blank")
      end

      it "is invalid without a shipping_period_id" do
        test_item.shipping_period_id = nil
        subject
        expect(test_item.errors[:shipping_period_id]).to include("can't be blank")
      end

      it "is invalid without a shipping_method_id" do
        test_item.shipping_method_id = nil
        subject
        expect(test_item.errors[:shipping_method_id]).to include("can't be blank")
      end

      it "is invalid without a price" do
        test_item.price = nil
        subject
        expect(test_item.errors[:price]).to include("can't be blank")
      end

      it "is invalid a price without number" do
        test_item.price = "aaaaaaaaaaaaaaaa"
        subject
        expect(test_item.errors[:price]).to include("is not included in the list")
      end

      it "is invalid a price more than 10000000" do
        test_item.price = 10000000
        subject
        expect(test_item.errors[:price]).to include("is not included in the list")
      end

      it "is invalid a price less than 299" do
        test_item.price = 299
        subject
        expect(test_item.errors[:price]).to include("is not included in the list")
      end


      it "is invalid without a item_status_id" do
        test_item.item_status_id = nil
        subject
        expect(test_item.errors[:item_status_id]).to include("can't be blank")
      end
    end
  end

  describe '#update' do
    it "商品名が更新される" do
      item = Item.new(name: "test")
      item.update(name: "hoge")
      expect(item.name).to eq "hoge"
    end

    it "商品の説明がが更新される" do
      item = Item.new(detail: "テストの商品です")
      item.update(detail: "変更後の商品です")
      expect(item.detail).to eq "変更後の商品です"
    end

    it "価格が更新される" do
      item = Item.new(price: 1000)
      item.update(price: 5000)
      expect(item.price).to eq 5000
    end

    it "商品の説明がが更新される" do
      item = Item.new(detail: "テストの商品です")
      item.update(detail: "変更後の商品です")
      expect(item.detail).to eq "変更後の商品です"
    end

    it "発送料の負担が更新される" do
      item = Item.new(is_seller_shipping: true)
      item.update(is_seller_shipping: false)
      expect(item.is_seller_shipping).to eq false
    end

    it "発送元の地域が更新される" do
      item = Item.new(prefecture_id: 1)
      item.update(prefecture_id: 2)
      expect(item.prefecture_id).to eq 2
    end

    it "発送までの日数が更新される" do
      item = Item.new(shipping_period_id: 1)
      item.update(shipping_period_id: 2)
      expect(item.shipping_period_id).to eq 2
    end

    it "配送の方法が更新される" do
      item = Item.new(shipping_period_id: 1)
      item.update(shipping_period_id: 2)
      expect(item.shipping_period_id).to eq 2
    end

    it "配送の方法が更新される" do
      item = Item.new(shipping_method_id: 1)
      item.update(shipping_method_id: 2)
      expect(item.shipping_method_id).to eq 2
    end

    it "カテゴリーが更新される" do
      item = Item.new(category_id: 1)
      item.update(category_id: 2)
      expect(item.category_id).to eq 2
    end

    it "商品の状態が更新される" do
      item = Item.new(item_status_id: 1)
      item.update(item_status_id: 2)
      expect(item.item_status_id).to eq 2
    end
  end

  describe '#index' do

    it "商品画像が正常に呼び出される" do
      category = create(:category)
      user = create(:user)
      item = create(:item, category_id: category.id, seller_id: user.id, images_attributes: [{image: File.new("app/assets/images/sample.jpg")}])
      expect(item.images.first.image.url).to include("sample.jpg")
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

  describe "#destroy" do
    it "itemが削除されること" do
      @user = create(:user)
      @category = create(:category)
      @item = create(:item, id: 1, seller_id: @user.id, category_id: @category.id) 
      expect(Item.where(id: 1).count).to eq 1
      @item.destroy
      expect(Item.where(id: 1).count).to eq 0  
    end

    it "itemを削除すると、itemに紐づくimageが削除されること" do
      @user = create(:user)
      @category = create(:category)
      @item = create(:item, id: 1, seller_id: @user.id, category_id: @category.id, images_attributes: [{image: File.new("app/assets/images/sample.jpg")}]) 
      expect(Image.all.count).to eq 1
      @item.destroy
      expect(Image.all.count).to eq 0  
    end
  end
end