require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    subject { test_user.valid? }
    let(:test_user) { build(:user) }
    context "can save" do
      it "is valid with a name, email, password, last_name, first_name, last_name_kana, first_name_kana, mobile_phone_number, birthday and profile" do
        expect(test_user).to be_valid
      end

      it "is valid without profile" do
        test_user.profile = nil
        expect(test_user).to be_valid
      end
    end

    context "cannot save" do
      it "is invalid without name" do
        test_user.name = nil
        test_user.valid?
        expect(test_user.errors[:name]).to include("can't be blank")
      end

      it "is invalid without email" do
        test_user.email = nil
        test_user.valid?
        expect(test_user.errors[:email]).to include("can't be blank")
      end

      it "is invalid without password" do
        test_user.password = nil
        test_user.valid?
        expect(test_user.errors[:password]).to include("can't be blank")
      end

      it "is invalid without last_name" do
        test_user.last_name = nil
        test_user.valid?
        expect(test_user.errors[:last_name]).to include("can't be blank")
      end

      it "is invalid without first_name" do
        test_user.first_name = nil
        test_user.valid?
        expect(test_user.errors[:first_name]).to include("can't be blank")
      end

      it "is invalid without last_name_kana" do
        test_user.last_name_kana = nil
        test_user.valid?
        expect(test_user.errors[:last_name_kana]).to include("can't be blank")
      end

      it "is invalid without first_name_kana" do
        test_user.first_name_kana = nil
        test_user.valid?
        expect(test_user.errors[:first_name_kana]).to include("can't be blank")
      end

      it "is invalid without birthday" do
        test_user.birthday = nil
        test_user.valid?
        expect(test_user.errors[:birthday]).to include("can't be blank")
      end

      it "is invalid with a duplicated name" do
        user = create(:user)
        test_user.name = user.name
        test_user.valid?
        expect(test_user.errors[:name]).to include("has already been taken")
      end

      it "is invalid with a duplicated email" do
        user = create(:user)
        test_user.email = user.email
        test_user.valid?
        expect(test_user.errors[:email]).to include("has already been taken")
      end

      it "is invalid with a name which is more than 21 characters" do
        test_user.name = "aaaaaaaaaabbbbbbbbbbc"
        test_user.valid?
        expect(test_user.errors[:name]).to include("is too long (maximum is 20 characters)")
      end

      it "is invalid with a password which is less than 5 characters" do
        test_user.password = 12345
        test_user.valid?
        expect(test_user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end

      it "is invalid with a last_name which is more than 21 characters" do
        test_user.last_name = "あいうえおかきくけこさしすせそたちつてとな"
        test_user.valid?
        expect(test_user.errors[:last_name]).to include("is too long (maximum is 20 characters)")
      end

      it "is invalid with a first_name which is more than 21 characters" do
        test_user.first_name = "あいうえおかきくけこさしすせそたちつてとな"
        test_user.valid?
        expect(test_user.errors[:first_name]).to include("is too long (maximum is 20 characters)")
      end

      it "is invalid with a last_name_kana which is more than 21 characters" do
        test_user.last_name_kana = "アイウエオカキクケコサシスセソタチツテトナ"
        test_user.valid?
        expect(test_user.errors[:last_name_kana]).to include("is too long (maximum is 20 characters)")
      end

      it "is invalid with a first_name_kana which is more than 21 characters" do
        test_user.first_name_kana = "アイウエオカキクケコサシスセソタチツテトナ"
        test_user.valid?
        expect(test_user.errors[:first_name_kana]).to include("is too long (maximum is 20 characters)")
      end

      it "is invalid with a mobile phone number which is less than 9 digits" do
        test_user.mobile_phone_number = 123456789
        test_user.valid?
        expect(test_user.errors[:mobile_phone_number]).to include("is invalid")
      end

      it "is invalid with a mobile phone number which is more than 11 digits" do
        test_user.mobile_phone_number = 12345678901
        test_user.valid?
        expect(test_user.errors[:mobile_phone_number]).to include("is invalid")
      end

      it "is invalid with a mobile phone number which includes hyphen" do
        test_user.mobile_phone_number = "090-1234-5678"
        test_user.valid?
        expect(test_user.errors[:mobile_phone_number]).not_to match(/\A[0-9]{10}\z/)
      end
    end
  end
end
