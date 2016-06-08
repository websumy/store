class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :destroy]
  skip_before_action :authorize, only: [:show, :destroy]

  # GET /carts/1
  def show
    if @cart.id != session[:cart_id]
      redirect_to store_path, notice: 'It\'s not your cart'
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end
end
