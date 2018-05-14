module EmailServiceAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :login
        field :password
        field :domain do
          hide
        end
      end
      list do
        field :login
        field :password
        field :domain
      end
    end
  end
end