Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :rooms do
    resources :messages, only: [ :create ]
  end

  # Defines the root path route ("/")
  root to: "home#index"
end
