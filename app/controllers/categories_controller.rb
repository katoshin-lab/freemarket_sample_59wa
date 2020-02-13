class CategoriesController < ApplicationController
  include ApplicationHelper
  include ItemHelper
  before_action :redirect_to_login, except: [:index, :show]
  before_action :set_categories, only: [:index, :show]

  def index
  end

  def show
    @category = Category.find(params[:id])
    @items = []
    @category.descendants.each do |category|
      return unless category
      Item.where(category_id: category.id).each do |item|
        @items << item
      end
    end
  end
end
