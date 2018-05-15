module AccountAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :email do
          hide
        end
      end
      list do
        field :shop
        field :email
        field :password
      end
    end
  end
end