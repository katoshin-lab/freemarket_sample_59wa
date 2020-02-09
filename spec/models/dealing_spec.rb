require 'rails_helper'

describe Dealing do

  describe '#create' do
    subject { test_dealing.valid? }
    let(:seller) { create(:user) }
    let(:buyer) { create(:user) }
    let(:category) { create(:category)}
    let(:item) { create(:item, seller_id: seller.id, category_id: category.id) }
    let(:test_dealing) { build(:dealing, buyer_id: buyer.id, item_id: item.id) }

    context "can save" do
      it "is valid with full element" do
        expect(test_dealing).to be_valid
      end
    end

    context "can not save" do
      it "is invalid without buyer_id" do
        test_dealing.buyer_id = nil
        subject
        expect(test_dealing.errors[:buyer_id]).to include("can't be blank") 
      end

      it "is invalid with non-existent user" do
        buyer.destroy
        subject
        expect(test_dealing.errors[:buyer]).to include("must exist") 
      end

      it "is invalid without item_id" do
        test_dealing.item_id = nil
        subject
        expect(test_dealing.errors[:item_id]).to include("can't be blank") 
      end

      it "is invalid with non-existent item" do
        item.destroy
        subject
        expect(test_dealing.errors[:item]).to include("must exist") 
      end

      it "is invalid without charge" do
        test_dealing.charge = nil
        subject
        expect(test_dealing.errors[:charge]).to include("can't be blank") 
      end

      it "is invalid without dealing_status_id" do
        test_dealing.dealing_status_id = nil
        subject
        expect(test_dealing.errors[:dealing_status_id]).to include("can't be blank") 
      end

      it "is invalid without last_name" do
        test_dealing.last_name = nil
        subject
        expect(test_dealing.errors[:last_name]).to include("can't be blank") 
      end

      it "is invalid without first_name" do
        test_dealing.first_name = nil
        subject
        expect(test_dealing.errors[:first_name]).to include("can't be blank") 
      end

      it "is invalid without last_name_kana" do
        test_dealing.last_name_kana = nil
        subject
        expect(test_dealing.errors[:last_name_kana]).to include("can't be blank") 
      end

      it "is invalid without first_name_kana" do
        test_dealing.first_name_kana = nil
        subject
        expect(test_dealing.errors[:first_name_kana]).to include("can't be blank") 
      end

      it "is invalid without postal_number" do
        test_dealing.postal_number = nil
        subject
        expect(test_dealing.errors[:postal_number]).to include("can't be blank") 
      end

      it "is invalid without prefecture_id" do
        test_dealing.prefecture_id = nil
        subject
        expect(test_dealing.errors[:prefecture_id]).to include("can't be blank") 
      end

      it "is invalid without city" do
        test_dealing.city = nil
        subject
        expect(test_dealing.errors[:city]).to include("can't be blank") 
      end

      it "is invalid without block" do
        test_dealing.block = nil
        subject
        expect(test_dealing.errors[:block]).to include("can't be blank") 
      end

      it "is invalid without building_name" do
        test_dealing.building_name = nil
        subject
        expect(test_dealing.errors[:building_name]).to include("can't be blank") 
      end

      it "is invalid without phone_number" do
        test_dealing.phone_number = nil
        subject
        expect(test_dealing.errors[:phone_number]).to include("can't be blank") 
      end
    end

  end
end 