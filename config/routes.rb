Rails.application.routes.draw do
  resources :coupons

  root to: 'coupons#index'

  controller :coupons do
    get 'take'
    get 'my_coupons'
  end

end
