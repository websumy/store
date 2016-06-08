class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]
  before_action :current_cart, only: [:new, :create]
  skip_before_action :authorize, only: [:new, :create]

  # GET /orders
  def index
    @total_orders = Order.count
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.cart = current_cart

    if @order.cart.line_items.empty?
      redirect_to store_url, notice: 'Your cart is empty'
      return
    end

    if @order.save
      session[:cart_id] = nil
      session[:count_products_in_cart] = nil
      redirect_to store_url, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :payment_type)
    end
end
