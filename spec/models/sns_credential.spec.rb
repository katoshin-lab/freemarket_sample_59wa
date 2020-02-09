require 'rails_helper'

RSpec.describe UserDelivery, type: :model do
  describe '#callback_for(provider)' do
    let(:test_user) { create(:user) }
    let(:sns_credential) { build(:sns_credential, user_id: test_user.id) }
    context 'can save' do
      it "is valid with uid, provider, user_id, name, email, token" do
        expect(sns_credential).to be_valid
      end

      it "is valid without user_id" do
        sns_credential.user_id = nil
        expect(sns_credential).to be_valid
      end
    end

    context 'cannot save' do
      it "is invalid without a uid" do
        sns_credential.uid = nil
        sns_credential.valid?
        expect(sns_credential.errors[:uid]).to include("can't be blank")
      end

      it "is invalid without a provider" do
        sns_credential.provider = nil
        sns_credential.valid?
        expect(sns_credential.errors[:provider]).to include("can't be blank")
      end

      it "is invalid without a name" do
        sns_credential.name = nil
        sns_credential.valid?
        expect(sns_credential.errors[:name]).to include("can't be blank")
      end

      it "is invalid without a email" do
        sns_credential.email = nil
        sns_credential.valid?
        expect(sns_credential.errors[:email]).to include("can't be blank")
      end

      it "is invalid without a token" do
        sns_credential.token = nil
        sns_credential.valid?
        expect(sns_credential.errors[:token]).to include("can't be blank")
      end

      it "is invalid with a duplicated uid" do
        duplicated_sns_credential = create(:sns_credential)
        sns_credential.uid = duplicated_sns_credential.uid
        sns_credential.valid?
        expect(sns_credential.errors[:uid]).to include("has already been taken")
      end

      it "is invalid that a uid is not integer" do
        sns_credential.uid = "12345abcde6789"
        sns_credential.valid?
        expect(sns_credential.errors[:uid]).to include("is not a number")
      end
      
      it "is invalid that a user_id is not integer" do
        sns_credential.user_id = "123abc"
        sns_credential.valid?
        expect(sns_credential.errors[:user_id]).to include("is not a number")
      end
    end
  end
end