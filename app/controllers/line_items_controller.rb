class LineItemsController < ApplicationController
  before_action :set_line_item, only: :destroy
  skip_before_action :authorize, only: :create

  # POST /line_items
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(product: product)
    session[:count_products_in_cart] = @cart.line_items.count + 1
    respond_to do |format|
        if @line_item.save
          format.html { redirect_to current_cart, notice: 'Line item was successfully created.' }
        end
    end
  end

  # DELETE /line_items/1
  def destroy
    @line_item.destroy
    session[:count_products_in_cart] -= 1 if session[:count_products_in_cart]

    respond_to do |format|
      format.html { redirect_to current_cart, notice: 'Line item was successfully destroyed.' }
    end
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
