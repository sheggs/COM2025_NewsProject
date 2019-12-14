Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  devise_for :users
  get '/' => 'posts#index'
  get '/login' => 'users#index'
  post '/register' => 'users#create'
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'
  post '/imageupdate' => 'avatars#create'
  get '/dashboard' => 'users#dashboard'
  post '/updateUserInformation' => 'users#update'
  get '/admin' => 'posts#newpost'
  get '/view' => 'posts#view'
  post '/createPost' => 'posts#create'
  post '/comment/new' => 'comments#create'
  delete '/comment/delete' => 'comment#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
