class LineItemsController < ApplicationController
  before_action :set_line_item, only: :destroy
  skip_before_action :authorize, only: [:create, :destroy]

  # POST /line_items
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    if @line_item.save
      session[:count_products_in_cart] = @cart.count_products_in_cart
      redirect_to store_path, notice: 'Product added to the cart'
    end
  end

  # DELETE /line_items/1
  def destroy
    if @cart.include? @line_item
      if @line_item.quantity > 1
        @line_item.quantity -= 1
        session[:count_products_in_cart] -= 1
        if @line_item.save
          redirect_to current_cart, notice: 'Item removed from the cart'
        end
      else
        @line_item.destroy
        session[:count_products_in_cart] -= 1 if session[:count_products_in_cart]
        redirect_to current_cart, notice: 'Line item was successfully destroyed.'
      end
    else
      redirect_to store_path, notice: 'Cart doesn\'t has the line_item'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end
end
