# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  name         :string
#  address      :text
#  email        :string
#  payment_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cart_id      :integer
#

class Order < ActiveRecord::Base
  enum pay_type: [ :check, :credit_card ]

  belongs_to :cart

  validates :name, :address, :email, :payment_type, :cart_id, presence: true
  validates :email, format: { with: /.+@.+\..+/i }

  def self.new_order(order_params, cart)
    order = Order.new(order_params)
    order.cart = cart.line_items.empty? ? nil : cart
    order
  end
end
