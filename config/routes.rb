Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'keys#index'
  resources :keys do
    get 'check_availability', :on => :member
  end
end
