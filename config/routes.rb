Rails.application.routes.draw do
  resources :coupons do
    member do
      get  :print_version
      post :ss_coupon
    end
  end

  root to: 'coupons#index'

  controller :coupons do
    get 'my_coupons'
    get 'come_back_later'
  end

end
