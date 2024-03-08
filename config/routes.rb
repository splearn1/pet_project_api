Rails.application.routes.draw do
  # get 'profiles/show'

  post 'login', to: 'sessions#create'

  # scope :profiles do
  #   get ':first_name', to: "profiles#show"
  # end

  resources :users do
    resources :pets
  end
  resources :vets, only: [:show, :update]
  resources :meds
  resources :prescriptions


# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
