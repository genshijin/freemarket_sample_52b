Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'

  resources :items, only: [:show]
  resources :exhibit, only: [:index]
  resources :purchase, only: [:index]
  resource :sign_up, only: [:index] do
    collection do
      get :index
      get :infomation
      get :phone_number
      get :carry
      get :payment
      get :finish
    end
  end

  # マイページ周りの設定
  resource :mypage, controller: :users, onry: [:edit] do
    collection do
      get :index
      get :logout
    end
    get 'login' , to: 'sign_up#login'
    resources :cards, only: [:index, :new]
    resources :profile ,controller: :user_profiles, only: [:index]
  end
end
