module CartsHelper

  def total_price
    price = 0
    @cart.line_items.each do |line_item|
      price += line_item.product.price
    end
    price
  end
end
