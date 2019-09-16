Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'

  resources :items, only: [:show]
  resources :exhibit, only: [:index]
  resources :purchase, only: [:index]
  resources :sign_up, only: [:index] do
    collection do
      get 'phone_number'
      get 'carry_point'
      get 'payment'
      get 'finish_page'
      get 'sign_in'
    end
  end

  # マイページ周りの設定
  resource :mypage, controller: :users, onry: [:edit] do
    collection do
      get :index
      get :logout
    end
    resources :cards, only: [:index, :new]
    resources :profile ,controller: :user_profiles, only: [:index]
  end
end
