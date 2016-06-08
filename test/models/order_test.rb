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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
