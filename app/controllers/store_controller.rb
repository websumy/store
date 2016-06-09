class StoreController < ApplicationController

  skip_before_action :authorize

  def index
    @products = Product.order(:created_at).page params[:page]
    @user = User.find(session[:user_id]) if session[:user_id]
  end
end
