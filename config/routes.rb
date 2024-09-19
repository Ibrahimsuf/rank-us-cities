Rails.application.routes.draw do
  get 'cities/index'
  resources :comparisons, only: [:new,:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "comparisons#new"
end
