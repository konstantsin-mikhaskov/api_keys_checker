class Account < ApplicationRecord
  include AccountAdmin

  belongs_to :email_service
  belongs_to :shop
  has_many :keys

  validates :name, presence: true
  validates :password, presence: true

  after_save :update_email

  private

  def update_email
    update_column(:email, self.email_service.email)
  end

end
