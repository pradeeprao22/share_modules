Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  resources :posts, only: [:index, :show, :create] do
     resources :photos, only: [:create]
  end
end