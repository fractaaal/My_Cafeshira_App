class ShopsController < ApplicationController
  before_action :authenticate_account!, only: [:new, :edit, :destroy]

  def index
    @search_params = shop_search_params
    @search_shops = Shop.search(@search_params).order(created_at: :desc).page(params[:page])
    @shops = Shop.all.order(created_at: :desc).page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @shop = Shop.find(params[:id])
    gon.shop_recommended = @shop.recommended
    gon.shop_bitterness = @shop.bitterness
    gon.shop_acidity = @shop.acidity
    gon.shop_fragrance = @shop.fragrance
    gon.shop_rich = @shop.rich
    gon.shop_sweetness = @shop.sweetness
    gon.shop_latitude = @shop.latitude
    gon.shop_longitude = @shop.longitude
    @comments = @shop.comments.order(created_at: :desc).page(params[:page]).per(5)

    if account_signed_in?
      @comment = current_account.comments.new
    end
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.account_id = current_account.id
    if @shop.save
      redirect_to shops_url, notice: "カフェ「#{@shop.name}」を登録しました！"
    else
      render 'new'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shops_url, notice: "カフェ「#{@shop.name}」を更新しました。"
    else
      render 'edit'
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_url notice: "カフェ「#{shop.name}」の投稿を削除しました。"
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :recommended, :prefecture_id, :city, :bitterness, :acidity, :fragrance, :rich, :sweetness, :address, :description, :image, :open_at, :close_at, :station, :holiday_id, :phone_number, :latitude, :longitude)
  end

  def login_required
    redirect_to login_url unless current_user
  end

  def shop_search_params
    params.fetch(:search, {}).permit(:name,:prefecture_id)
  end
end

