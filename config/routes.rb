Rails.application.routes.draw do
  resources :hobbies
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/find_hobby_partners', to: 'users/registrations#find_hobby_partners', as: 'find_hobby_partners'
    get 'users/profile_export', to: 'users/registrations#profile_export', as: 'profile_export'
  end
  root to: 'pages#home'
  get 'pages/home'
  get 'pages/dashboard'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
