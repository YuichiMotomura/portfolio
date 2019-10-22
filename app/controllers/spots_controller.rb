class SpotsController < ApplicationController
  def index
  end

  def new
    @spot = Spot.new
    @spot.photos.build
    @spot.build_radar
  end

  def create
    spot = Spot.new(spot_params)
    
    if spot.save
      redirect_to root_path, notice: '投稿が完了しました'
    else
        render :new
    end
    
  end


  private
  def spot_params
    params.require(:spot).permit(:title, :text, :prefecture_id, photos_attributes: [:image], radar_attributes: [:retro, :rare, :insta, :emotional, :delicious, :kawaii]).merge(author_id: current_user.id)
  end
end
