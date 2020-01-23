class LikesController < ApplicationController

  def create
    current_user.likes.create(item_id: params[:item_id])
  end
      
  def destroy
    current_user.likes.find_by(item_id: params[:item_id]).destroy
  end

end
