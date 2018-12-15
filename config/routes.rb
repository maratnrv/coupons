Rails.application.routes.draw do
  resources :coupons do
    member do
      post :ss_coupon
    end
  end

  root to: 'coupons#index'

  controller :coupons do
    get 'take'
    get 'my_coupons'
  end

end
