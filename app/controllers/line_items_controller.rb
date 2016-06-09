class LineItemsController < ApplicationController
  before_action :set_line_item, only: :destroy
  skip_before_action :authorize, only: [:create, :destroy]

  # POST /line_items
  def create
    current_cart.add_product(params[:product_id])
    session[:count_products_in_cart] = current_cart.count_products_in_cart
    redirect_to store_path, notice: 'Product added to the cart'
  end

  # DELETE /line_items/1
  def destroy
    if current_cart.has_line_item?(@line_item)
      current_cart.remove_product_from_line_item(@line_item)
      session[:count_products_in_cart] = current_cart.count_products_in_cart
      notice = 'Item removed from the cart'
    else
      notice = 'It\'s not your cart'
    end
    redirect_to current_cart, notice: notice
  end

# another way of destroying

=begin
 notice = current_cart.remove_product_from_line_item(@line_item)
 session[:count_products_in_cart] = current_cart.count_products_in_cart
 redirect_to current_cart, notice: notice
=end

  private
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
