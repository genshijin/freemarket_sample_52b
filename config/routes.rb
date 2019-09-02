Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  
  resources :exhibit, only: [:index]
  resources :purchase, only: [:index]

  # マイページ周りの設定
  resource :mypage, controller: :users, only: [:index] do
    resources :cards, only: [:index, :new]
    resources :profile ,controller: :user_profiles, only: [:index]
  end
end
