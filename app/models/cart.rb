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
    current_line_item = line_items.find_or_create_by product_id: product_id
    current_line_item.quantity += 1
    current_line_item
  end

  def count_products_in_cart
    sum = 0
    line_items.each { |line_item| sum += line_item.quantity }
    sum
  end

  def has_line_item?(line_item)
    line_items.include? line_item
  end
end
