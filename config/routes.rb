Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/dashboard", to: "pages#dashboard"

  resources :courses, param: :title, only: [:index, :show] do
    resources :enrollments, only: [:create]
  end

  resources :lessons, param: :title, only: [:show] do
    resources :user_progresses, only: [:create]
  end

  resources :user_progresses, only: [:update]
end
