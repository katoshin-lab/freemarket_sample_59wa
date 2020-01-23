class LikesController < ApplicationController

  def create
    if @item = current_user.likes.find_by(item_id: params[:item_id])
      @item.destroy
    else
      current_user.likes.create(item_id: params[:item_id])
    end
  end

end
