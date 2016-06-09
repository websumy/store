module ApplicationHelper
  def count_products
    session[:count_products_in_cart] || 0
  end
end
