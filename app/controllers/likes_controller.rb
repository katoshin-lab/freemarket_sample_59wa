class LikesController < ApplicationController

  def create
    current_user.likes.create(item_id: params[:id])
    respond_to do |format|
      format.json
    end
  end
      
  def destroy
    current_user.likes.find(params[:id]).destroy
  end

end
