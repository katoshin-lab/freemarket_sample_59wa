require 'rails_helper'

RSpec.describe UserDelivery, type: :model do
  describe '#create' do
    before do
      @test_user = create(:user)
      @test_delivery = build(:user_delivery, user_id: @test_user.id)
    end
    context "can save" do
      it "is valid with last_name, first_name, last_name_kana, first_name_kana, postal_number, prefecture_id, city, block, building_name, phone_number and user_id" do
        expect(@test_delivery).to be_valid
      end

      it "is valid without a building_name" do
        @test_delivery.building_name = nil
        expect(@test_delivery).to be_valid
      end

      it "is valid without a phone_number" do
        @test_delivery.phone_number = nil
        expect(@test_delivery).to be_valid
      end

      it "is valid without building_name and phone_number" do
        @test_delivery.building_name = nil
        @test_delivery.phone_number = nil
        binding.pry
        expect(@test_delivery).to be_valid
      end
    end
  end
end
