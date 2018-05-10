class Account < ApplicationRecord
  belongs_to :email_service
  has_many :keys
end
