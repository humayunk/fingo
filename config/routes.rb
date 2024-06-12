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
    member do
      get 'celebration'
    end
    resources :user_progresses, only: [:create]
  end

  get 'dashboard', to: 'pages#dashboard'
  resources :user_progresses, only: [:update] do
    member do
      patch 'complete'
    end
  end

  # Onboarding Routes
  get 'onboarding/step1', to: 'onboarding#step1'
  post 'onboarding/step1', to: 'onboarding#save_step1'
  get 'onboarding/step2', to: 'onboarding#step2'
  post 'onboarding/step2', to: 'onboarding#save_step2'
  get 'onboarding/step3', to: 'onboarding#step3'
  post 'onboarding/step3', to: 'onboarding#save_step3'
end
