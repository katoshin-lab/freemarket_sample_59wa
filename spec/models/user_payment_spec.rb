require 'rails_helper'

RSpec.describe UserPayment, type: :model do
  describe 'create' do
    subject { test_payment.valid? }
    let(:user) { create(:user) }
    let(:test_payment) { build(:user_payment, user_id: user.id) }
    context "can save" do
      it "is valid with customer_id, card_id and user_id" do
        expect(test_payment).to be_valid
      end
    end

    context "cannot save" do
      it "is invalid without user_id" do
        test_payment.user_id = nil
        subject
        expect(test_payment.errors[:user_id]).to include("can't be blank")
      end

      it "is invalid without customer_id" do
        test_payment.customer_id = nil
        subject
        expect(test_payment.errors[:customer_id]).to include("can't be blank")
      end

      it "is invalid without card_id" do
        test_payment.card_id = nil
        subject
        expect(test_payment.errors[:card_id]).to include("can't be blank")
      end

      it "is invalid with a customer_id which doesn't begin with 'cus_'" do
        test_payment.customer_id = "a3a2dd1bf4f9c13c73ff39330eb0"
        subject
        expect(test_payment.errors[:customer_id]).not_to match(/\Acus_[0-9a-f]+\z/)
      end

      it "is invalid with a card_id which doesn't begin with 'car_'" do
        test_payment.card_id = "51b8c2dbbb23cf4f2c5c8d09588d"
        subject
        expect(test_payment.errors[:card_id]).not_to match(/\Acus_[0-9a-f]+\z/)
      end
    end
  end
end
