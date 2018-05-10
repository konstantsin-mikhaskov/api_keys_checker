class Shop < ApplicationRecord
  has_many :accounts
  has_many :products
end
