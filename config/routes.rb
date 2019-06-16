Rails.application.routes.draw do
  root 'posts#index'
  get 'pages/about'
  devise_for :users,
    path: '',
    path_name: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {registration: 'registration'}
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]

  resources :posts, only: [:index, :show, :create, :destroy] do
     resources :photos, only: [:create]
     resources :likes, only: [:create, :destroy], shallow: true
     resources :comments, only: [:index, :create, :destroy], shallow: true
     resources :bookmarks, only: [:create, :destroy], shallow: true
  end

  #custom route defined
  get 'post/module_post', :to => 'posts#module_post', as: 'module'
end