Rails.application.routes.draw do

  get 'errors/notfound'
  get 'errors/forbidden'
  resources :contactforms
	post'/comment/like' => 'comments#likepost'
	root 'posts#index'
	get '/login' => 'users#index'
	get '/dashboard' => 'users#dashboard'
	post '/updateUserInformation' => 'users#simpleupdate'
 	post '/imageupdate' => 'avatars#create'
  patch 'users/edit'
  patch 'posts/edit'

 	get '/admin/user_edit/:id' => "admins#user_edit"
 	get '/admin/post_edit/:id' => 'admins#post_edit'

  get 'admin/index' => "admins#index"
  get 'admin/user_management' => "admins#user_management"
  get 'admin/post_management' => "admins#post_management"


   resources :posts do
    resources :comments
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
