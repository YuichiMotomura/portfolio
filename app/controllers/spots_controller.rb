class SpotsController < ApplicationController
  before_action :redirect_to_root, only: [:new, :create, :destroy]
  PICTURE_COUNT = 1

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
    @comments = @spot.comments.order(id: 'DESC').includes(:user)
    @comment = Comment.new

    gon.data = []
    radar = @spot.radar
    ary = [radar[:retro], radar[:rare], radar[:insta], radar[:emotional], radar[:kawaii]]
    gon.data << ary
    @google = "https://maps.googleapis.com/maps/api/js?key=#{Rails.application.secrets.map_api}&callback=initMap"
  end

  def new
    @spot = Spot.new
    @spot.photos.build
    @spot.build_radar
  end

  def create
    @spot = Spot.new(spot_params)

    @spot.photos.each do |photo|
      unless photo.image.present?
        photo.destroy
      end
    end
  
    if @spot.save
      redirect_to root_path, notice: '投稿が完了しました' 
    else
      @pre_prefecture = @spot.prefecture.parent if @spot.prefecture.present?
      # 保存失敗した場合、一度、画像は全部消す
      @spot.photos.destroy_all
      @spot.photos.build
      render :new
    end
  end

  def search_prefecture
    @prefectures = []
    @prefectures = Prefecture.find(params[:pre_number].to_i).children
  end

  def edit
    @spot = Spot.find(params[:id])
    @pre_prefecture = @spot.prefecture.parent if @spot.prefecture.present?
    # 写真追加用
    @spot.photos.build if @spot.photos.length < 5
    # @spot.photos[0].image.cache! if @spot.photos.present?
  end

  def update
    @spot = Spot.find(params[:id])

    if @spot.update(spot_params)
      redirect_to @spot, notice: '記事を編集しました'
    else
      @pre_prefecture = @spot.prefecture.parent if @spot.prefecture.present?
      render :edit
    end
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to root_path, notice: '記事を削除しました'
  end

  private
  def spot_params
    params.require(:spot).permit(:title, :text, :prefecture_id, :address, photos_attributes: [:image, :image_cache, :spot_id, :_destroy, :id], radar_attributes: [:retro, :rare, :insta, :emotional, :kawaii]).merge(author_id: current_user.id)
  end

  def redirect_to_root
    redirect_to root_path, alert: 'ログインしてください' unless user_signed_in?
  end
end
