Rails.application.routes.draw do
  get '/' => 'posts#index'
  get '/login' => 'users#index'
  post '/register' => 'users#create'
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'
  post '/imageupdate' => 'avatars#create'
  get '/dashboard' => 'users#dashboard'
  post '/updateUserInformation' => 'users#update'
  get '/admin' => 'posts#newpost'
  post '/createPost' => 'posts#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
