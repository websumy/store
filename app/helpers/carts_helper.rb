module CartsHelper

  def total_price(cart)
    price = 0
    cart.line_items.each do |line_item|
      price += line_item.quantity * line_item.product.price
    end
    price
  end

  def minus_label
    '<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>'.html_safe
  end

  def plus_label
    '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>'.html_safe
  end
end
