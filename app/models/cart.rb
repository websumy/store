# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ActiveRecord::Base

  has_many :line_items, dependent: :destroy
  has_one :order

  def add_product(product_id)
    current_line_item = line_items.find_by product_id: product_id
    current_line_item = line_items.build(product_id: product_id) if current_line_item.nil?
    current_line_item.quantity += 1
    current_line_item.save
  end

  def count_products_in_cart
    line_items.sum(:quantity)
  end

  def has_line_item?(line_item)
    line_items.include? line_item
  end

  def remove_product_from_line_item(line_item)
    if line_item.quantity > 1
      line_item.quantity -= 1
      line_item.save!
    else
      line_item.destroy!
    end
  end

# for another way of destroying

=begin
if has_line_item?(line_item)
  if line_item.quantity > 1
      line_item.quantity -= 1
      line_item.save!
  else
     line_item.destroy!
  end
  'Item removed from the cart'
else
  'It\'s not your cart'
end
=end

end
