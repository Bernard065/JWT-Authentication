Rails.application.routes.draw do
  get 'authentication/authenticate'
  post '/authenticate', to: 'authentication#authenticate'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
