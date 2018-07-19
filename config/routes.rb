Rails.application.routes.draw do

  resources :notices
  resources :qnas
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users/auth/kakao', to: 'users/omniauth_callbacks#kakao'
    get '/users/auth/kakao/callback', to: 'users/omniauth_callbacks#kakao_auth'
  end
  get 'user/index'

  get 'home/index'

  resources :products
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/likes/:product_id/home' => 'home#like_product'
  get '/likes/:product_id/product' => 'products#like_product'
  
  
end
