Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :user_profiles, only: [:index]
  resources :exhibit, only: [:index]
  resources :purchase, only: [:index]
  resources :sign_up, only: [:index] do
    collection do
      get 'phone_number'
      get 'carry_point'
    end
  end
end
