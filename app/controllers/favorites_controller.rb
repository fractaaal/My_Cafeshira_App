class FavoritesController < ApplicationController
  before_action :authenticate_account!

  def create
    @shop = Shop.find(params[:shop_id])
    favorite = current_account.favorites.build(shop_id: params[:shop_id])
    favorite.save!
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    favorite = Favorite.find_by(shop_id: params[:shop_id], account_id: current_account.id)
    favorite.destroy
  end
end
