require 'rails_helper'
require 'spec_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  let(:params) { attributes_for(:user) }
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

#   describe 'POST #create' do
#     context 'can save' do
#       subject {
#         post :create,
#         params: params
#       }
#       it "creates the column in users_table" do
#         # expect do
#         #   post :create, params: params, session: {}
#         # end.to change(User, :count).by(1)
#         binding.pry
#         expect{ subject }.to change(User, :count).by(1)
#       end
#     end
#   end
end
