Rails.application.routes.draw do

  root 'auth#index'
  get '/auth/github', to: 'auth#login'
  get '/auth/github/cb', to: 'auth#cb'
  delete 'logout', to: 'auth#logout', as: 'logout'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
