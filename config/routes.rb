Rails.application.routes.draw do
  resources :coupons do
    collection do
      get :take_coupon
    end
  end

  root to: 'coupons#index'

  controller :coupons do
    get 'take'
  end

end
