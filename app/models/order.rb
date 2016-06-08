# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  name         :string
#  address      :text
#  email        :string
#  payment_type :pay_type
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cart_id      :integer
#

class Order < ActiveRecord::Base
  enum pay_type: [ :check, :credit_card ]

  belongs_to :cart

  validates :name, :address, :email, :payment_type, presence: true
  validates :email, format: { with: /.+@.+\..+/i }
end
