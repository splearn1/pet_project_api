Rails.application.routes.draw do
  get 'web/bootstrap'
#DO I Need to put scope '/' do HERE???
  post 'login', to: 'sessions#create'
  post '/users', to: 'users#create'

  resources :users do
    resources :pets
  end
  resources :vets, only: [:show, :update]
  resources :meds
  resources :prescriptions

  #this is where I want to show each pet with their respective precription information
  # resources :users do
  #   get 'users/pets', to: "pets_id#show"
  #   get 'pets/prescriptions', to: "prescriptions#show"
  #   end
  # end

end
