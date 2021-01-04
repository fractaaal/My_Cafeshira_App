class AccountsController < ApplicationController
  def index
  end

  def show
    @account = Account.find(params[:id])
    @shops = @account.shops
    @comments = @account.comments.page(params[:page]).per(5)
    @favorite_shops = @account.favorite_shops

    respond_to do |format|
      format.html
      format.js
    end
  end
end
