Rails.application.routes.draw do
  get 'jobs/index'
  delete '/delete_jobrela', to: 'job_relationships#destroy'

  get '/login', to: 'sessions#new'
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:index, :show, :new, :create]
  resources :cvs
  resources :job_relationships

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
