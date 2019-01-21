Rails.application.routes.draw do
  root 'posts#index'
  get 'pages/about'
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]

  resources :posts, only: [:index, :show, :create, :destroy] do
     resources :photos, only: [:create]
     resources :likes, only: [:create, :destroy], shallow: true
     resources :comments, only: [:index, :create, :destroy], shallow: true
     resources :bookmarks, only: [:create, :destroy], shallow: true
  end
end