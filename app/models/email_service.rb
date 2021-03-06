class EmailService < ApplicationRecord
  include EmailServiceAdmin

  has_one :account

  validates :name, presence: true
  validates :password, presence: true

  after_save :update_domain

  private

  def update_domain
    update_column(:domain, self.name[/@(.*)/,1])
  end

end
