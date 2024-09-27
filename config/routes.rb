Rails.application.routes.draw do
  get 'pages/home'
  
  get 'musics/:music_id/likes' => 'likes#create'
  get 'musics/:music_id/likes/:id' => 'likes#destroy'
  
  
  
  devise_for :users
  
  
  resources :users, only: [:show] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :musics do
    resources :likes, only: [:create, :destroy] 
  
  end
  

resources :users do
  member do
    get :likes
  end
end




  
  root  'pages#home'
end
  

