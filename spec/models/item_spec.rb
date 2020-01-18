require 'rails_helper'

describe Item do
  describe '#create' do
  subject {test_item.valid?}
  let(:test_item){build(:item)}
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
      test_item.price = Faker::Lorem.sentence
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
end