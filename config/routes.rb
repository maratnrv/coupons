Rails.application.routes.draw do
  resources :coupons

  root to: 'coupons#index'
end
