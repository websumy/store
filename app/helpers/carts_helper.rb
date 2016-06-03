module CartsHelper

  def titles_and_quaintities
    titles = {}
    @cart.line_items.each do |line_item|
      product = Product.find(line_item.product_id)
      if titles[product.title].nil?
        titles[product.title] = 1
      else
        titles[product.title] += 1
      end
    end
    titles
  end
end
