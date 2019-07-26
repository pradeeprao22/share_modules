Rails.application.routes.draw do
  root 'pages#userlanding'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/innovation'
  get 'pages/help'
  devise_for :users,
    path: '',
    path_name: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {registration: 'registration'}
  
  resources :users, only: [:index, :show]

  resources :posts, only: [:index, :show, :create, :destroy] do
     resources :photos, only: [:create]
     resources :likes, only: [:create, :destroy], shallow: true
     resources :comments, only: [:index, :create, :destroy], shallow: true
     resources :bookmarks, only: [:create, :destroy], shallow: true
  end

  #custom route defined
  get 'post/module_post', :to => 'posts#module_post', as: 'module'
  get 'posts/build_module/:id', :to => 'posts#build_module', as: 'building'
end