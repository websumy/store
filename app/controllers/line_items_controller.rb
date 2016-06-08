class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:update, :destroy]
  skip_before_action :authorize, only: [:create, :update, :destroy]

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

  def update
    @line_item.quantity -= 1
    session[:count_products_in_cart] -= 1

    if @line_item.save
      redirect_to current_cart, notice: 'Item removed from the cart'
    end
  end

  # DELETE /line_items/1
  def destroy
    @line_item.destroy
    session[:count_products_in_cart] -= 1 if session[:count_products_in_cart]

    redirect_to current_cart, notice: 'Line item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end
