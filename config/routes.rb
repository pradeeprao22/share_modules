Rails.application.routes.draw do
  
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  resources :conversations do
    resources :messages
  end
  get 'fetch/:conversation_id/messages', :to => 'messages#messages_index', as: 'get_messages'

  resources :follows, only: [:create, :destroy]
  resources :module_types, only: [:index]
  resources :database_tables
  resources :feeds
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#userlanding'
  get 'pages/about'
  get 'pages/innovation'
  get 'pages/help'
  get 'pages/success'
  get 'pages/terms'
  get 'pages/privacy'
  devise_for :users,
    path: '',
    path_name: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {registration: 'registration'}
  
  resources :users, only: [:index, :show] do
     resource :follows, only: [:create, :destroy], shallow: true
  end

  resource :contact_tables, only: [:create]
  resources :columns_for_fake_databases

  resources :posts, param: :slug, only: [:index, :show, :update, :create, :destroy] do
     resources :photos, only: [:create]
     resources :likes, only: [:create, :destroy], shallow: true
     resources :comments, only: [:index, :create, :destroy], shallow: true
     resources :bookmarks, only: [:create, :destroy], shallow: true
  end

  #custom route defined
  get 'notifications', :to => 'notifications#create_notifications', as: 'get_notification'
  #get 'pages/contact_get'
  get 'appbuilder/appbuilder', :to => 'appbuilders#appbuilder', as: 'app_builder'
  get 'pages/howto', :to => 'pages#howto', as: 'how_to'
  get 'users/likes/:id', :to => 'users#likes', as: 'users_likes'
  get 'users/bookmark/:id', :to => 'users#bookmark', as: 'users_bookmark'
  get 'pages/contact_get'
  post 'pages/contact_get/:id', :to => 'pages#contact_get'
  get 'post/module_post', :to => 'posts#module_post', as: 'module'
  get 'posts/build_module/:slug', :to => 'posts#build_module', as: 'building'
  #get 'pages/userlandingtesting', :to => 'pages#userlandingtesting', as: 'landingtesting'

  #For Backend module
  get 'backends/backend_module'
  post 'backends/backend_module_post', :to => 'backends#backend_module_post'

  mount ActionCable.server, at: '/cable'
end