module ProductAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :shop
        field :name
        field :asin
      end
    end
  end
end