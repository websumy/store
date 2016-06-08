module OrdersHelper
  def total_price_for_order
    price = 0
    @order.cart.line_items.each do |line_item|
      price += line_item.quantity * line_item.product.price
    end
    price
  end
end
