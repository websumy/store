module OrdersHelper
  def total_price_for_order
    price = 0
    @order.cart.line_items.each do |line_item|
      price += line_item.quantity * line_item.product.price
    end
    price
  end

  def info_label
    '<span class="glyphicon glyphicon-info-sign icon_info" aria-hidden="true"></span>'.html_safe
  end

  def trash_label
    '<span class="glyphicon glyphicon-trash remove_item" aria-hidden="true"></span>'.html_safe
  end
end
