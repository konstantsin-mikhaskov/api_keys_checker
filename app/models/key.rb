class Key < ApplicationRecord
  include KeyAdmin

  belongs_to :account

  validates :access_key_id, presence: true
  validates :secret_access_key, presence: true

end
