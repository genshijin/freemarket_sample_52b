Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'

  resources :items, only: [:show,:new,:create,:edit,:create,:update,:destroy] do
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
        get 'sold', to: 'purchase#sold'
      end
    end
  end

  resources :exhibit, only: [:index,:show]

  #新規登録周りの設定
  resources :signup, only: [:index, :create] do
    collection do
      get :step1
      get :step2
      get :step3
      # get :step4
      get :done
    end
  end

  # マイページ周りの設定
  resource :mypage, controller: :users, only: [:edit] do
    collection do
      get :index
      get :logout
      get :exhibition
      get :trading
      get :completed
    end
    resources :cards, controller: :creditcards, only: [:index, :new, :create, :destroy]
    resources :profile ,controller: :user_profiles, only: [:index]
  end
end