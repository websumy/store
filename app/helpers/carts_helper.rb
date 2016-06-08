module CartsHelper

  def total_price
    price = 0
    @cart.line_items.each do |line_item|
      price += line_item.quantity * line_item.product.price
    end
    price
  end

  def removing_method(line_item)
    method = :put
    method = :delete if line_item.quantity == 1
    method
  end
end
