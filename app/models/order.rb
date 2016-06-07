# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :text
#  email      :string
#  pay_type   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#

class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  has_many :line_items, dependent: :destroy
  belongs_to :cart

  validates :name, :address, :email, :pay_type, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

end
