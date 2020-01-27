require 'rails_helper'

describe Like do

  describe '#create' do
    let(:category) { create :category }
    let(:test_user){ create :user }
    let(:test_item){ create :item, category_id: category.id, seller_id: test_user.id }
  
    context 'can save' do
      it "is vaild with a user_id, item_id " do
        like = Like.new(user_id: test_user.id, item_id: test_item.id)
        expect(like).to be_valid
      end
    end
   
    context 'cannot save' do
      it "is invalid without a user_id" do
        like = Like.new(user_id: "", item_id: test_item.id)
        like.valid?
        expect(like.errors[:user_id]).to include("can't be blank")
      end

      it "is invalid without a test_id" do
        like = Like.new(user_id: test_user.id, item_id: "")
        like.valid?
        expect(like.errors[:item_id]).to include("can't be blank")
      end

      it "is invalid with saved combination of user_id and item_id" do
        like = Like.create(user_id: test_user.id, item_id: test_item.id)
        like2 = Like.new(user_id: test_user.id, item_id: test_item.id)
        like2.valid?
        expect(like2.errors[:item_id]).to include("has already been taken")
      end
    end

  end
end
