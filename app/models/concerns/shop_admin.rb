module ShopAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :name
        field :domain
        field :api_domain
      end
    end
  end
end