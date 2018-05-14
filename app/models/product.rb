class Product < ApplicationRecord
  include ProductAdmin
  belongs_to :shop

  validates :name, presence: true
  validates :asin, presence: true
end
