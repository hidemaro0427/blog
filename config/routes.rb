Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'posts' => 'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts' => 'posts#create'
  delete  'posts/:id	'  => 'posts#destroy'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


end
