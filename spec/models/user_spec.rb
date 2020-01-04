require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @test_user = build(:user)
    end
    context "can save" do
      it "is valid with a name, email, password, last_name, first_name, last_name_kana, first_name_kana, mobile_phone_number, birthday and profile" do
        expect(@test_user).to be_valid
      end

      it "is valid without mobile_phone_number and profile" do
        @test_user.mobile_phone_number = nil
        @test_user.profile = nil
        expect(@test_user).to be_valid
      end
    end

end
