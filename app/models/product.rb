# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  image_url   :string
#  price       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base

  validates :title, :description, :image_url, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: true
  validates :image_url, format: {
                with: %r{\.(jpg|png|gif)}i,
                message: 'URL should include jpg, png or gif'
                      }

  paginates_per 12
  has_many :line_items

  before_destroy :check_line_items_on_product

  private
  def check_line_items_on_product
    line_items.empty?
  end
end
