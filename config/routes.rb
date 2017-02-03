Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get 'pages/friends'
  get 'pages/map'
  post 'pages/find_user' => 'pages#find_user'

  resources :quests, only: [:index]

  
end
