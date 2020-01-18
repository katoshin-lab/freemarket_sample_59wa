require 'rails_helper'

RSpec.describe UserDelivery, type: :model do
  describe '#create' do
    subject { test_delivery.valid? }
    let(:user) { create(:user) }
    let(:test_delivery) { build(:user_delivery, user_id: user.id) }
    context "can save" do
      it "is valid with last_name, first_name, last_name_kana, first_name_kana, postal_number, prefecture_id, city, block, building_name, phone_number and user_id" do
        expect(test_delivery).to be_valid
      end

      it "is valid without a building_name" do
        test_delivery.building_name = nil
        expect(test_delivery).to be_valid
      end

      it "is valid without a phone_number" do
        test_delivery.phone_number = nil
        expect(test_delivery).to be_valid
      end

      it "is valid without building_name and phone_number" do
        test_delivery.building_name = nil
        test_delivery.phone_number = nil
        expect(test_delivery).to be_valid
      end
    end

    context 'cannot save' do
      it "isninvalid without user_id" do
        test_delivery.user_id = nil
        subject
        expect(test_delivery.errors[:user_id]).to include("can't be blank")
      end
      it "is invalid without last_name" do
        test_delivery.last_name = nil
        subject
        expect(test_delivery.errors[:last_name]).to include("can't be blank")
      end

      it "is invalid without first_name" do
        test_delivery.first_name = nil
        subject
        expect(test_delivery.errors[:first_name]).to include("can't be blank")
      end

      it "is invalid without last_name_kana" do
        test_delivery.last_name_kana = nil
        subject
        expect(test_delivery.errors[:last_name_kana]).to include("can't be blank")
      end

      it "is invalid without first_name_kana" do
        test_delivery.first_name_kana = nil
        subject
        expect(test_delivery.errors[:first_name_kana]).to include("can't be blank")
      end

      it "is invalid without a postal_number" do
        test_delivery.postal_number = nil
        subject
        expect(test_delivery.errors[:postal_number]).to include("can't be blank")
      end

      it "is invalid without a prefecture_id" do
        test_delivery.prefecture_id = nil
        subject
        expect(test_delivery.errors[:prefecture_id]).to include("can't be blank")
      end
      
      it "is invalid without a city" do
        test_delivery.city = nil
        subject
        expect(test_delivery.errors[:city]).to include("can't be blank")
      end

      it "is invalid without a block" do
        test_delivery.block = nil
        subject
        expect(test_delivery.errors[:block]).to include("can't be blank")
      end

      it "is invalid with a last_name which is more than 21 characters" do
        test_delivery.last_name = "あいうえおかきくけこさしすせそたちつてとな"
        subject
        expect(test_delivery.errors[:last_name]).to include("is too long (maximum is 20 characters)")
      end

      it "is invalid with a first_name which is more than 21 characters" do
        test_delivery.first_name = "あいうえおかきくけこさしすせそたちつてとな"
        subject
        expect(test_delivery.errors[:first_name]).to include("is too long (maximum is 20 characters)")
      end

      it "is invalid with a last_name_kana which is more than 21 characters" do
        test_delivery.last_name_kana = "アイウエオカキクケコサシスセソタチツテトナ"
        subject
        expect(test_delivery.errors[:last_name_kana]).to include("is too long (maximum is 20 characters)")
      end

      it "is invalid with a first_name_kana which is more than 21 characters" do
        test_delivery.first_name_kana = "アイウエオカキクケコサシスセソタチツテトナ"
        subject
        expect(test_delivery.errors[:first_name_kana]).to include("is too long (maximum is 20 characters)")
      end

      it "is invalid with a postal_number which is less than 6 characters" do
        test_delivery.postal_number = "123456"
        subject
        expect(test_delivery.errors[:postal_number]).to include("is invalid")
      end

      it "is invalid with a postal_number which is more than 8 characters" do
        test_delivery.postal_number = "12345678"
        subject
        expect(test_delivery.errors[:postal_number]).to include("is invalid")
      end

      it "is invalid with a postal_number which includes hyphen" do
        test_delivery.postal_number = "079-1143"
        subject
        expect(test_delivery.errors[:postal_number]).not_to match(/\A[0-9]{7}\z/)
      end

      it "is invalid with city which is more than 25 characters" do
        test_delivery.city = "あいうえおかきくけこさしすせそたちつてとなにぬねの市"
        subject
        expect(test_delivery.errors[:city]).to include("is too long (maximum is 25 characters)")
      end

      it "is invalid with block which is more than 25 characters" do
        test_delivery.block = "あいうえおかきくけこさしすせそたちつてとなにぬねの1"
        subject
        expect(test_delivery.errors[:block]).to include("is too long (maximum is 25 characters)")
      end

      it "is invalid with building_name which is more than 25 characters" do
        test_delivery.building_name = "あいうえおかきくけこさしすせそたちつてとなにぬねのは"
        subject
        expect(test_delivery.errors[:building_name]).to include("is too long (maximum is 25 characters)")
      end

      it "is invalid with a phone_number which is less than 8 characters" do
        test_delivery.phone_number = 12345678
        subject
        expect(test_delivery.errors[:phone_number]).to include("is invalid")
      end

      it "is invalid with a phone_number which is more than 11 characters" do
        test_delivery.phone_number = 12345678901
        subject
        expect(test_delivery.errors[:phone_number]).to include("is invalid")
      end

      it "is invalid with a phone_number which includes hyphen" do
        test_delivery.phone_number = "03-1234-5678"
        subject
        expect(test_delivery.errors[:phone_number]).not_to match(/\A[0-9]{9,10}\z/)
      end
    end
  end
end
