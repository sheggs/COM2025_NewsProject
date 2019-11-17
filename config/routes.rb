Rails.application.routes.draw do
  get '/login' => 'users#index'
  post '/register' => 'users#create'
  post '/login' => 'users#login'
  get '/dashboard' => 'users#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
