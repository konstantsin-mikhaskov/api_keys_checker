module KeyAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :last_check_at do
          hide
        end
        configure :expired_at do
          hide
        end
      end
      list do
        field :access_key_id
        field :secret_access_key
        field :expired_at
        field :last_check_at
      end
    end
  end
end