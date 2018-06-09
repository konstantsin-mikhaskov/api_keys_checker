class Key < ApplicationRecord
  include KeyAdmin

  belongs_to :account

  validates :access_key_id, presence: true
  validates :secret_access_key, presence: true

  def after_check(response)
    if response[/<Error><Code>/]
      self.update_attributes(last_check_at: Time.current, expired_at: nil)
    else
      self.update_attributes(last_check_at: Time.current)
    end
  end

end
