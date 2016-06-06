module CartsHelper

  def titles_and_quantities
    titles = {}
    @cart.line_items.each do |line_item|
      product = line_item.product
      if titles[product.title].nil?
        titles[product.title] = 1
      else
        titles[product.title] += 1
      end
    end
    titles
  end
end
