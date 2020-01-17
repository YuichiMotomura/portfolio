class LikesController < ApplicationController

  def create
    like = Like.new(spot_id: params[:spot_id], user_id: current_user.id)
    if like.save
      redirect_to spot_path(params[:spot_id])
    else
      redirect_to spot_path(params[:spot_id]), alert: 'エラーが発生しました'
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to spot_path(params[:spot_id])
  end
end
