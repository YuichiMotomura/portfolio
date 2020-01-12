class CommentsController < ApplicationController

  def create
    spot = params[:spot_id]
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to spot_path(spot)
    else
      if @comment[:comment] == ''
        flash[:alert] = '空白では投稿できません'
        redirect_to spot_path(spot)
      elsif @comment[:comment].length > 140
        @spot = Spot.find(spot)
        @comments = @spot.comments.order(id: 'DESC').includes(:user)
        gon.data = []
        radar = @spot.radar
        ary = [radar[:retro], radar[:rare], radar[:insta], radar[:emotional], radar[:kawaii]]
        gon.data << ary
        @google = "https://maps.googleapis.com/maps/api/js?key=#{Rails.application.secrets.map_api}&callback=initMap"
        flash[:alert] = 'コメントは140文字以内にしましょう'
        render 'spots/show'
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to spot_path(comment.spot), notice: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end

  
end
