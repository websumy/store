module ApplicationHelper
  def count_products
    res = 0
    res = session[:count_products_in_cart] unless session[:count_products_in_cart].nil?
    res
  end
end
