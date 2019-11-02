class SpotsController < ApplicationController
  before_action :redirect_to_root, only: [:new, :create, :destroy]

  def index
    @spots = Spot.order(id: 'DESC').page(params[:page]).per(10)
    gon.data = []
    @spots.each do |spot|
      radar = spot.radar
      ary = [radar[:retro], radar[:rare], radar[:insta], radar[:emotional], radar[:kawaii]]
      gon.data << ary
    end
    
  end

  def show
    @spot = Spot.find(params[:id])
    gon.data = []
    radar = @spot.radar
    ary = [radar[:retro], radar[:rare], radar[:insta], radar[:emotional], radar[:kawaii]]
    gon.data << ary
  end

  def new
    @spot = Spot.new
    @spot.photos.build
    @spot.build_radar
  end

  def create
    
    @spot = Spot.new(spot_params)
    
    if @spot.save
      redirect_to root_path, notice: '投稿が完了しました' 
    else
      render :new
    end
  end

  def search_prefecture
    @prefectures = []
    @prefectures = Prefecture.find(params[:pre_number].to_i).children
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to root_path, notice: '記事を削除しました'
  end


  private
  def spot_params
    params.require(:spot).permit(:title, :text, :prefecture_id, photos_attributes: [:image, :spot_id, :_destroy], radar_attributes: [:retro, :rare, :insta, :emotional, :kawaii]).merge(author_id: current_user.id)
  end

  def redirect_to_root
    redirect_to root_path, alert: 'ログインしてください' unless user_signed_in?
  end
end
