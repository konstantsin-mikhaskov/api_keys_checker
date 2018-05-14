class Shop < ApplicationRecord
  include ShopAdmin

  has_many :accounts
  has_many :products

  validates :name, presence: true
  validates :domain, presence: true
  validates :api_domain, presence: true
end
