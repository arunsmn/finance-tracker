Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources	:user_stocks, except: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'my_portfolio', to: "users#my_portfolio"
  get 'search_stocks', to: "stocks#search"
  resources :user_stocks, only: [:create, :destroy]
  resources	:users, only: [:show]
  resources :friendships
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search'
  # get 'user_path', to: 'users#show'
  post 'add_friend', to: 'users#add_friend'
end
