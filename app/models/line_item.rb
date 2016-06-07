# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#  quantity   :integer          default(1)
#

class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  validates :quantity, numericality: {greater_than_or_equal_to: 1, only_integer: true}
end
