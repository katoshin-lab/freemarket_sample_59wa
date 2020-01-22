class LikesController < ApplicationController

  def create
    return false unless user_signed_in?
    current_user.likes.create(item_id: params[:id])
    respond_to do |format|
      format.json
    end
  end
      
  def destroy
    return false unless user_signed_in?
    current_user.likes.find_by(item_id: params[:id]).destroy
    respond_to do |format|
      format.json
    end
  end

end
