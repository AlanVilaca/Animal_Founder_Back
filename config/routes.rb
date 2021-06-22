Rails.application.routes.draw do
  #SignUp and Login
  post '/sign_up', to: 'register#sign_up'
  post '/login', to: 'session#login'

  #Authentication
  post '/authentication/confirm/:validation_token', to: 'authentication#confirm'
  post '/authentication/repeat_token', to: "authentication#repeat_validation_token"

  #User
  resources :users

  #Password

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
