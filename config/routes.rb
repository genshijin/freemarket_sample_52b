Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'

  resources :items, only: [:show]
  resources :exhibit, only: [:index]
  resources :purchase, only: [:index]

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
  resource :mypage, controller: :users, onry: [:edit] do
    collection do
      get :index
      get :logout
    end
    resources :cards, only: [:index, :new]
    resources :profile ,controller: :user_profiles, only: [:index]
  end
end
